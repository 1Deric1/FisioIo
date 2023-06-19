import 'dart:convert';
import 'dart:io';

import 'package:fisio/core/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'register_view_model.dart';

class RegisterPageContent extends StatelessWidget {
  final RegisterViewModel registerNotifier;

  const RegisterPageContent({
    Key? key,
    required this.registerNotifier,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
              onPressed: () async {
                registerNotifier.changeCurrentImage(await capturePhoto() ?? '');
              },
              icon: Icon(Icons.camera, color: AppTheme.whiteColor)),
          IconButton(
              onPressed: () async {
                registerNotifier
                    .changeCurrentImage(await getPhotoByGallery() ?? '');
              },
              icon: Icon(Icons.image, color: AppTheme.whiteColor)),
        ],
      ),
      TextField(
        onChanged: registerNotifier.changeCurrentName,
        autofocus: true,
        decoration: AppTheme.filledInputDecoration.copyWith(
          hintText: 'Nome',
          prefixIcon: const Padding(
            padding: EdgeInsets.all(5.0),
            child: Icon(Icons.person),
          ),
        ),
      ),
      TextField(
        onChanged: registerNotifier.changeCurrentPassword,
        decoration: AppTheme.filledInputDecoration.copyWith(
          hintText: 'Senha',
          prefixIcon: const Padding(
            padding: EdgeInsets.all(5.0),
            child: Icon(Icons.key),
          ),
        ),
      ),
      TextField(
        onChanged: registerNotifier.changeCurrentPhone,
        decoration: AppTheme.filledInputDecoration.copyWith(
          hintText: 'Telefone',
          prefixIcon: const Padding(
            padding: EdgeInsets.all(5.0),
            child: Icon(Icons.phone),
          ),
        ),
      ),
      TextField(
        onChanged: registerNotifier.changeCurrentEmail,
        decoration: AppTheme.filledInputDecoration.copyWith(
          hintText: 'Email',
          prefixIcon: const Padding(
            padding: EdgeInsets.all(5.0),
            child: Icon(Icons.email),
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
              await registerNotifier.registerNewCustomer();
            },
            child: const Text('Logar')),
      ),
    ]);
  }
}

Future<String?> getPhotoByGallery() async {
  final imagePicker = ImagePicker();

  final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);

  if (pickedFile == null) {
    // Nenhuma foto selecionada
    return null;
  }

  final imageFile = File(pickedFile.path);

  if (!imageFile.existsSync()) {
    // Arquivo da imagem não encontrado
    return null;
  }

  final imageBytes = await imageFile.readAsBytes();
  final imageBase64 = base64Encode(imageBytes);

  return imageBase64;
}

Future<String?> capturePhoto() async {
  final imagePicker = ImagePicker();

  final pickedFile = await imagePicker.pickImage(source: ImageSource.camera);

  if (pickedFile == null) {
    // Nenhuma foto selecionada
    return null;
  }

  final imageFile = File(pickedFile.path);

  if (!imageFile.existsSync()) {
    // Arquivo da imagem não encontrado
    return null;
  }

  final imageBytes = await imageFile.readAsBytes();
  final imageBase64 = base64Encode(imageBytes);

  return imageBase64;
}
