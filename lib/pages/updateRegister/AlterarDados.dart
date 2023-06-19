import 'package:fisio/core/app_provider.dart';
import 'package:fisio/models/customer_model.dart';
import 'package:fisio/services/sqlite_service.dart';
import 'package:flutter/material.dart';

class AlterarDados extends StatefulWidget {
  const AlterarDados({super.key});

  @override
  State<AlterarDados> createState() => _AlterarDados();
}

TextEditingController _controllerEmail = TextEditingController();
TextEditingController _controllerNome = TextEditingController();
TextEditingController _controllerTelefone = TextEditingController();
TextEditingController _controllerSenha = TextEditingController();

class _AlterarDados extends State<AlterarDados> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //barra de navegação
        backgroundColor: const Color.fromARGB(255, 38, 14, 43),
        title: const Text('Alteração de Dados'),
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
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/fundo2.jpg"), fit: BoxFit.cover),
        ),
        padding: const EdgeInsets.all(16), //Email
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 32),
                  child: Image.asset(
                    "images/logo.png",
                    width: 200,
                    height: 150,
                  ),
                ),
                TextField(
                  controller: _controllerNome,
                  autofocus: true,
                  keyboardType: TextInputType.name,
                  style: const TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
                      prefixIcon: const Padding(
                        padding: EdgeInsets.all(5),
                        child: Icon(
                          Icons.person_2,
                          color: Colors.blueGrey,
                        ),
                      ),
                      hintText: "Nome",
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16))),
                ),
                TextField(
                  controller: _controllerTelefone,
                  autofocus: true,
                  keyboardType: TextInputType.phone,
                  style: const TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
                    prefixIcon: const Padding(
                      padding: EdgeInsets.all(5),
                      child: Icon(
                        Icons.phone,
                        color: Colors.blueGrey,
                      ),
                    ),
                    hintText: "Telefone",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16)),
                  ),
                ),
                TextField(
                  controller: _controllerEmail,
                  autofocus: true,
                  keyboardType: TextInputType.emailAddress,
                  style: const TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
                      prefixIcon: const Padding(
                        padding: EdgeInsets.all(5),
                        child: Icon(
                          Icons.email,
                          color: Colors.blueGrey,
                        ),
                      ),
                      hintText: "E-mail",
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16))),
                ),
                TextField(
                  controller: _controllerSenha,
                  obscureText: true,
                  keyboardType: TextInputType.number,
                  style: const TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
                      prefixIcon: const Padding(
                        padding: EdgeInsets.all(5),
                        child: Icon(
                          Icons.key,
                          color: Colors.blueGrey,
                        ),
                      ),
                      hintText: "Senha",
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16))),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16, bottom: 10),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 205, 207, 55),
                        padding: const EdgeInsets.fromLTRB(32, 16, 32, 16)),
                    onPressed: () async {
                      await SQLiteService().updateCustomer(
                          currentCustomer!,
                          CustomerModel(
                              name: _controllerNome.text,
                              phone: _controllerTelefone.text,
                              email: _controllerEmail.text,
                              password: _controllerSenha.text));
                    },
                    child: const Text(
                      "Cadastrar",
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
