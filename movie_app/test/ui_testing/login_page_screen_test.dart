import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movie_app/screens/login_page_screen.dart';

void main() {
  testWidgets("Judul halaman harus Log In Page", (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: LoginPageScreen(),
    ));

    expect(find.text('Log In Page'), findsOneWidget);
  });
}
