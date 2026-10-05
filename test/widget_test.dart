// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:tugas3/main.dart';
import 'package:tugas3/providers/auth_provider.dart';

void main() {
  testWidgets('app shows the login screen by default', (tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Login Provider'), findsOneWidget);
    expect(find.text('Selamat Datang'), findsOneWidget);
    expect(find.text('Login'), findsOneWidget);
  });

  test('auth provider logs in only when email is filled and password is long enough', () async {
    final provider = AuthProvider();

    final success = await provider.login('user@example.com', 'password123');

    expect(success, isTrue);
    expect(provider.isAuthenticated, isTrue);
    expect(provider.token, isNotNull);

    provider.logout();
    expect(provider.isAuthenticated, isFalse);
    expect(provider.token, isNull);
  });
}
