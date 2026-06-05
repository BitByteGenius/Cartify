import 'package:flutter_test/flutter_test.dart';
import 'package:admin_panel/src/app.dart';

void main() {
  testWidgets('Admin app loads successfully', (WidgetTester tester) async {
    await tester.pumpWidget(const AdminApp());

    expect(find.byType(AdminApp), findsOneWidget);
  });
}