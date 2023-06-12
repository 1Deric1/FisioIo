import 'package:fisio/views/Cadastro.dart';
import 'package:flutter/material.dart';
import 'Exercicios.dart';
import 'EsqueceuSenha.dart';

//final dbConnect = ConnectDb();
class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _controllerEmail = TextEditingController(); //criação de objeto
  TextEditingController _controllerSenha = TextEditingController();
  //var cliente = Cliente();

  @override
  Widget build(BuildContext context) {
    //Definindo imagem background do fundo do aplicativo
    return Scaffold(
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
                      contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                      prefixIcon: const Padding(
                        padding: EdgeInsets.all(5),
                        child: Icon(
                          Icons.email,
                          color: Colors.blueGrey,
                        ),
                      ), //definição de diametro interno
                      hintText: "E-mail",
                      filled: true, //definindo campo
                      fillColor: Colors.white, //coloração
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(26))),
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
                        borderRadius: BorderRadius.circular(26)),
                  ),
                ),
                Padding(
                  //BOTÃO
                  padding: EdgeInsets.only(top: 16, bottom: 10),
                  child: ElevatedButton(
                      //declaração do botão
                      child: Text(
                        //formatação do botão
                        "Logar",
                        style: TextStyle(
                            color: const Color.fromARGB(255, 8, 4, 4),
                            fontSize: 20),
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(255, 205, 207, 55),
                          padding: EdgeInsets.fromLTRB(20, 16, 20, 16)),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MyApp()),
                        );
                        //evento do botão
                        // _ValidaAcesso();
                      }),
                ),
                Center(
                  //CADASTRO
                  child: TextButton(
                      child: Text(
                        "Primeiro Acesso",
                        style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 13),
                      ),
                      onPressed: () {
                        //detecção de ação das mãos
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                //rota do context
                                builder: (context) => Cadastro()));
                      }),
                ),
                Padding(
                  // Esqueci Senha
                  padding: EdgeInsets.only(top: 16),
                  child: TextButton(
                    child: Text(
                      "Esqueci Senha",
                      style: TextStyle(
                          color: const Color.fromARGB(255, 255, 255, 255),
                          fontSize: 12),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EsqueceuSenha()));
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
  
  //void _ValidaAcesso() async{
      
      // await dbConnect.listusuario();
      //Navigator.push(
          //context,
          //MaterialPageRoute(builder: (context)=>Home())
    //  );
  //}

