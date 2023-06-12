import 'package:flutter/material.dart';

class EsqueceuSenha extends StatefulWidget {
  const EsqueceuSenha({super.key});

  @override
  State<EsqueceuSenha> createState() => _EsqueceuSenhaState();
}

class _EsqueceuSenhaState extends State<EsqueceuSenha> {
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerSenha = TextEditingController();
  TextEditingController _controllerSenha01 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    //Definindo imagem background do fundo do aplicativo
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 38, 14, 43),
        title: Text('Esqueceu Senha'),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Image.asset(
              'images/logo.png',
              width:100,
              height: 100,
            ),
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/fundo2.jpg"),
            fit: BoxFit
                .cover, //mandando assumir toda área independente do tamanha
          ),
        ),
        padding: const EdgeInsets.all(16),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                //lista de widget
                Padding(
                  padding: EdgeInsets.only(bottom: 32),
                  child: Image.asset(
                    "images/logo.png",
                    width: 200,
                    height: 150,
                  ),
                ),
                TextField(
                  //CAMPO EMAIL
                  controller:
                      _controllerEmail, //chamada do objeto para armazenar o que foi digitado
                  autofocus: true, //foco inicial, onde o pursor aparece
                  keyboardType: TextInputType
                      .emailAddress, // aqui defini-se a configuração do teclado
                  style: TextStyle(fontSize: 20), // stilo do texto
                  decoration: InputDecoration(
                      //decoração criando formatação do campo de texto layout
                      contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16), //definição de diametro interno
                      hintText: "E-mail",
                      filled: true, //definindo campo
                      fillColor: Colors.white, //coloração
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6)) //borda
                      ),
                ),
                TextField(
                  //CAMPO SENHA
                  controller: _controllerSenha,
                  obscureText:
                      true, //definindo que os caracteres não ficarão visiveis .. por ser campo de senha
                  keyboardType: TextInputType.text,
                  style: TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                    hintText: "Digite Sua Nova Senha",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6)),
                  ),
                ),
                TextField(
                  //CAMPO SENHA
                  controller: _controllerSenha01,
                  obscureText:
                      true, //definindo que os caracteres não ficarão visiveis .. por ser campo de senha
                  keyboardType: TextInputType.text,
                  style: TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                    hintText: "Confirme Sua Nova Senha",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16, bottom: 10),
                  child: ElevatedButton(
                    child: Text(
                      "Cadastrar",
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 205, 207, 55),
                        padding: EdgeInsets.fromLTRB(32, 16, 32, 16)),
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
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
