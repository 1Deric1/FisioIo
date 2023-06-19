import 'package:fisio/core/app_provider.dart';
import 'package:fisio/services/navigator_service.dart';
import 'package:flutter/material.dart';

import '../../services/sqlite_service.dart';

class LoginViewModel extends ChangeNotifier {
  String _email = '';
  String get email => _email;

  String _password = '';
  String get password => _password;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  void changeCurrentEmail(String newValue) {
    _email = newValue;
    notifyListeners();
  }

  void changeCurrentPassword(String newValue) {
    _password = newValue;
    notifyListeners();
  }

  Future<void> doLogin() async {
    if (_email.isEmpty) {
      _errorMessage = 'Preencha os dois campos';
      notifyListeners();

      return;
    }
    if (_password.isEmpty) {
      _errorMessage = 'Preencha os dois campos';
      notifyListeners();
      return;
    }
    final relatedCustomer = await SQLiteService().getCustomerByCredentials(
      email,
      password,
    );

    if (relatedCustomer != null) {
      //success login
      _errorMessage = null;

      currentCustomer = relatedCustomer;

      KNavigator().removeAllAndPush('/home');
    } else {
      //display error message

      _errorMessage = 'Email ou senha incorretos';
      notifyListeners();
    }
  }
}
