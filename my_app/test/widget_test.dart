import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:my_app/user_registration.dart';

void main() {
  testWidgets('registration blocks Next until the form is valid', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: UserRegistrationPage()));

    await tester.tap(find.text('Next'));
    await tester.pump();
    expect(find.text('Please fill in all fields'), findsOneWidget);
    expect(find.text('Subject Enrollment'), findsNothing);
  });
}
