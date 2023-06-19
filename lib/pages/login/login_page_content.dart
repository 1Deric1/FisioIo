import 'package:fisio/core/app_theme.dart';
import 'package:fisio/services/navigator_service.dart';
import 'package:flutter/material.dart';

import 'login_view_model.dart';

class LoginPageContent extends StatelessWidget {
  const LoginPageContent({
    super.key,
    required this.loginNotifier,
  });

  final LoginViewModel loginNotifier;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Image.asset(
          "images/logo.png",
          width: MediaQuery.of(context).size.width,
          height: 100,
        ),
        TextField(
          onChanged: loginNotifier.changeCurrentEmail,
          decoration: AppTheme.filledInputDecoration.copyWith(
              hintText: 'Email',
              prefixIcon: const Padding(
                padding: EdgeInsets.all(5.0),
                child: Icon(Icons.email),
              )),
        ),
        TextField(
          onChanged: loginNotifier.changeCurrentPassword,
          decoration: AppTheme.filledInputDecoration.copyWith(
            hintText: 'Senha',
            prefixIcon: const Padding(
              padding: EdgeInsets.all(5.0),
              child: Icon(Icons.key),
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: InkWell(
            onTap: () {
              KNavigator().pushNamed('/recoverPassword');
            },
            child: Text(
              'Esqueci minha senha',
              style: TextAppTheme.labelWhiteTextStyle,
            ),
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.primaryColor,
                padding: const EdgeInsets.symmetric(vertical: 15),
              ),
              onPressed: () async {
                await loginNotifier.doLogin();
                await Future.delayed(const Duration(milliseconds: 300));
              },
              child: const Text('Logar')),
        ),
        Text(
          loginNotifier.errorMessage ?? '',
          style: TextAppTheme.labelErrorTextStyle,
        ),
        const SizedBox(height: 10),
        InkWell(
          onTap: () {
            KNavigator().pushNamed('/register');
          },
          child: Text(
            'Primeiro Acesso',
            style: TextAppTheme.labelWhiteTextStyle,
          ),
        )
      ],
    );
  }
}
