import 'package:fisio/views/Login.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Olá queli',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: Scaffold(
        appBar: AppBar(
         backgroundColor: Color.fromARGB(255, 38, 14, 43),
          leading: IconButton( //Icone Navebar
            icon: const Icon(Icons.menu),
            onPressed: () => Navigator.pop(context, false),
          ),

            //Imagem Logo
          actions: [
            Padding( 
              padding: EdgeInsets.only(right: 16.0),
              child: Image.asset(
                'images/logo.png',
                width: 100,
                height: 100,
              ),
            ),
          ],
        ),

        //Coloração Tela
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color.fromRGBO(50, 154, 164, 100), Colors.deepPurple,],
            ),
          ),

          //Texto Boas Vindas
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Text(
                    'Olá, Queli!',
                    style: TextStyle(
                      fontSize: 32,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                //Imagem Destaque5
                
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 32),
                    child: Image.asset(
                      "images/Alongamento-editado.png",
                      color: Colors.white,
                      width: 100,
                      height: 100,
                    ),
                  ),
                ),

               //Conteiner
                Stack(
                  children: [
                    Padding( 
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Container(
                          width: 320,
                          height: 290,
                          color: Colors.white.withOpacity(0.5),
                        ),
                      ),
                    ),

                        //Texto Topo Conteiner
                         Positioned.fill(
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: Padding(
                                padding: EdgeInsets.only(top: 20),
                                child: Text(
                                  'Exercícios do dia',
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),

                                //Inserção de Imagens
                                Positioned.fill(
                                    child:Align( alignment: Alignment.center,               
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Image.asset('images/alongamento1.png'),
                                          Image.asset('images/alongamento2.png'),
                                          Image.asset('images/alongamento3.png'),
                                        ],
                                      ),
                                    ),),
                                              
                                   
                                   //Botão parte de baixo
                                   Positioned.fill(
                                    child:Align( alignment: Alignment.bottomCenter,
                                       child: Padding(
                                         padding:  EdgeInsets.only(bottom: 16),
                                          child: TextButton(
                                          child: Text(
                                              "Clique para ver mais",
                                          style: TextStyle(
                                                color: const Color.fromARGB(255, 255, 255, 255),
                                                fontSize: 12),
                                                           ),
                                                 onPressed: () {
                                      Navigator.push(
                                          context,
                                      MaterialPageRoute(
                                      builder: (context) => Login()));
                                        },
                                       ),
                                     ), ),
                       
                            ),],
                          
                         )],
                      ),
                    ),
                  
                )
              
     ) );
    
  }
}
