import 'package:flutter/material.dart';

import 'login_page_content.dart';
import 'login_view_model.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final loginNotifier = LoginViewModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListenableBuilder(
        listenable: loginNotifier,
        builder: (context, child) {
          return Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  'images/fundo2.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  height: 400,
                  child: LoginPageContent(loginNotifier: loginNotifier),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
