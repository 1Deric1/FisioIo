// ignore_for_file: prefer_final_fields

import 'package:fisio/models/customer_model.dart';
import 'package:fisio/services/navigator_service.dart';
import 'package:fisio/services/sqlite_service.dart';
import 'package:flutter/material.dart';

class RegisterViewModel extends ChangeNotifier {
  String _email = '';
  String get email => _email;

  String _name = '';
  String get name => _name;

  String _phone = '';
  String get phone => _phone;

  String _password = '';
  String get password => _password;

  String _image = '';
  String? get image => _image;

  List<String> _errors = [];
  List<String> get errors => _errors;

  Future<void> registerNewCustomer() async {
    bool isValid = true;

    if (name.isEmpty) {
      _errors.add('Preencha o nome');
      isValid = false;
    }
    if (phone.isEmpty) {
      _errors.add('Preencha o telefone');
      isValid = false;
    }
    if (email.isEmpty) {
      _errors.add('Preencha o email');
      isValid = false;
    }
    if (password.isEmpty) {
      _errors.add('Preencha a senha');
      isValid = false;
    }

    if (!isValid) return;

    await SQLiteService().insertCustomer(CustomerModel(
        name: name,
        phone: phone,
        email: email,
        password: password,
        image: image));

    debugPrint("[registerNewCustomer]>> user inserted");
    await Future.delayed(const Duration(milliseconds: 300));
    KNavigator().pop();
  }

  void changeCurrentEmail(String newValue) {
    _email = newValue;
    notifyListeners();
  }

  void changeCurrentName(String newValue) {
    _name = newValue;
    notifyListeners();
  }

  void changeCurrentPhone(String newValue) {
    _phone = newValue;
    notifyListeners();
  }

  void changeCurrentPassword(String newValue) {
    _password = newValue;
    notifyListeners();
  }

  void changeCurrentImage(String newValue) {
    _image = newValue;
    notifyListeners();
  }
}
