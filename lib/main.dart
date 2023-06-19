import 'package:fisio/pages/register/register_page.dart';
import 'package:flutter/material.dart';

import 'pages/home/Exercicios.dart';
import 'pages/login/login_page.dart';
import 'pages/recover_password/EsqueceuSenha.dart';
import 'pages/updateRegister/AlterarDados.dart';

final GlobalKey<NavigatorState> kGlobalKeyNavigator =
    GlobalKey<NavigatorState>();

final GlobalKey<ScaffoldMessengerState> kSnackbarKey =
    GlobalKey<ScaffoldMessengerState>();

void main() async {
  runApp(MaterialApp(
    title: "Fis.IO",
    initialRoute: '/login',
    routes: routes,
    navigatorKey: kGlobalKeyNavigator,
    debugShowCheckedModeBanner: false,
    scaffoldMessengerKey: kSnackbarKey,
  ));
}

Map<String, WidgetBuilder> routes = {
  '/login': (_) => const LoginPage(),
  '/register': (_) => const RegisterPage(),
  '/updateRegister': (_) => const AlterarDados(),
  '/recoverPassword': (_) => const EsqueceuSenha(),
  '/home': (_) => const MyApp(),
};
