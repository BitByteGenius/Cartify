import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:admin_panel/src/app.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (Firebase.apps.isEmpty) {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.web,
    );
  }

  runApp(const AdminApp());
}