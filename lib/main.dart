import 'package:fisio/views/Login.dart';
import 'package:flutter/material.dart';

    //final dbConnect = ConnectDb();
void main() async {
    //WidgetsFlutterBinding.ensureInitialized();
   //await dbConnect.connectionDataBase();
  runApp(const MaterialApp(
    title: "Fis.IO",
    home: Login(),
    debugShowCheckedModeBanner: false,
  ));
}
