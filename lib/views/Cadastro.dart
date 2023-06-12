import 'package:flutter/material.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({super.key});

  @override
  State<Cadastro> createState() => _CadastroState();
}

TextEditingController _controllerEmail = TextEditingController();
TextEditingController _controllerNome = TextEditingController();
TextEditingController _controllerTelefone = TextEditingController();
TextEditingController _controllerSenha = TextEditingController();

class _CadastroState extends State<Cadastro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar( //barra de navegação
       backgroundColor: Color.fromARGB(255, 38, 14, 43),
          title: Text('Cadastro'),
           actions: [
            Padding(
              padding: EdgeInsets.only(right: 16.0),
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
        padding: EdgeInsets.all(16), //Email
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 32),
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
                  style: TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
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
                  style: TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(20, 16, 20, 16),
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
                  style: TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
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
                  style: TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
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
                      print("Cadastro realizado com sucesso");
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
