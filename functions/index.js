// functions/index.js
const functions = require('firebase-functions');
const admin = require('firebase-admin');
admin.initializeApp();
const db = admin.firestore();

/**
 * Bulk update product prices.
 * Expects data: { updates: [{ productId: string, newPrice: number }] }
 */
exports.bulkUpdatePrices = functions.https.onCall(async (data, context) => {
  // Ensure caller is admin
  if (!context.auth) {
    throw new functions.https.HttpsError('unauthenticated', 'User must be authenticated');
  }
  const uid = context.auth.uid;
  const userSnap = await db.collection('users').doc(uid).get();
  if (userSnap.data()?.role !== 'admin') {
    throw new functions.https.HttpsError('permission-denied', 'Admin only');
  }
  const batch = db.batch();
  (data.updates || []).forEach(u => {
    const ref = db.collection('products').doc(u.productId);
    batch.update(ref, { price: u.newPrice });
  });
  await batch.commit();
  return { success: true };
});

/**
 * Low‑stock alert – triggers when a product inventory falls below its threshold.
 * Sends a push notification to the "admin" topic.
 */
exports.lowStockAlert = functions.firestore
  .document('products/{productId}')
  .onWrite(async (change, context) => {
    const after = change.after.data();
    const before = change.before.data();
    if (!after) return null; // deleted
    const threshold = after.lowStockThreshold ?? 5;
    if (after.stock <= threshold && (!before || before.stock > threshold)) {
      const payload = {
        notification: {
          title: 'Low Stock Alert',
          body: `${after.title || 'Product'} is low on stock (${after.stock})`,
        },
      };
      await admin.messaging().sendToTopic('admin', payload);
    }
    return null;
  });

/**
 * Order status update – callable by admin or staff.
 * Expects data: { orderId: string, newStatus: string }
 */
exports.orderStatusUpdate = functions.https.onCall(async (data, context) => {
  if (!context.auth) {
    throw new functions.https.HttpsError('unauthenticated', 'User must be logged in');
  }
  const uid = context.auth.uid;
  const userSnap = await db.collection('users').doc(uid).get();
  if (!['admin', 'staff'].includes(userSnap.data()?.role)) {
    throw new functions.https.HttpsError('permission-denied', 'Insufficient role');
  }
  const orderRef = db.collection('orders').doc(data.orderId);
  await orderRef.update({ status: data.newStatus, updatedAt: admin.firestore.FieldValue.serverTimestamp() });
  return { success: true };
});

/**
 * Push notification – generic admin‑only broadcast.
 * Expects data: { title: string, body: string, topic?: string }
 */
exports.pushNotification = functions.https.onCall(async (data, context) => {
  if (!context.auth) {
    throw new functions.https.HttpsError('unauthenticated', 'User must be logged in');
  }
  const uid = context.auth.uid;
  const userSnap = await db.collection('users').doc(uid).get();
  if (userSnap.data()?.role !== 'admin') {
    throw new functions.https.HttpsError('permission-denied', 'Admin only');
  }
  const payload = { notification: { title: data.title, body: data.body } };
  const topic = data.topic ?? 'admin';
  await admin.messaging().sendToTopic(topic, payload);
  return { success: true };
});
