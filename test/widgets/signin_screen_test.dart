import 'package:abast_app/screens/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('description', (WidgetTester tester) async {
    await tester.pumpWidget(SigninScreen());

    final textFiledEmail = find.byKey(const Key('textFieldSigninEmail'));
    final textFiledSenha = find.byKey(const Key('textFieldSigninSenha'));
    final btnAcessar = find.text('Acessar');

    tester.enterText(textFiledEmail, "thi@go.com");
    tester.enterText(textFiledSenha, "654321");
    tester.tap(btnAcessar);

    expect(textFiledEmail, findsOneWidget);
  });
}
