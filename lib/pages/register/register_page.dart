import 'package:fisio/core/app_theme.dart';
import 'package:flutter/material.dart';

import 'register_page_content.dart';
import 'register_view_model.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({
    super.key,
  });

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final registerNotifier = RegisterViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.complementarColor,
        title: const Text('Cadastro'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Image.asset(
              'images/logo.png', // Caminho da imagem
              width: 100, // Largura da imagem
              height: 100, // Altura da imagem
            ),
          ),
        ],
      ),
      body: ListenableBuilder(
        listenable: registerNotifier,
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
                  child: RegisterPageContent(
                    registerNotifier: registerNotifier,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
