import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../Models/ClienteModel.dart';

class ConnectDb {
    connectionDataBase() async{
        final caminhoBancoDados = await getDatabasesPath();
        final localBancoDados =  join(caminhoBancoDados, "uber.db");
        var db = await openDatabase(
          localBancoDados,
          version: 1,
          onCreate: (db, dbVersao){
            String sql ="CREATE TABLE clientes (id INTEGER PRIMARY KEY AUTOINCREMENT, nome VARCHAR, email VARCHAR, telefone VARCHAR, senha VARCHAR, perfil VARCHAR ) ";
            db.execute(sql);
          }
        );
        return db;
        //print("aberto:" +db.isOpen.toString());
    }
   Future<int> salvar(String nome, String email, String telefone, String senha, String perfil) async{
        Database db = await connectionDataBase();
        Map<String, dynamic> dadosUsuario = {
          "nome" : nome,
          "email" : email,
          "telefone" : telefone,
          "senha" : senha,
          "perfil" : perfil
        };
        int id = await db.insert("clientes", dadosUsuario);
        return id;
    }

    validaAcesso(String usuario, String senha) async{
      var cliente = Cliente();
      Database db = await connectionDataBase();
      String sql = "SELECT * FROM clientes WHERE 1=1 and email ='$usuario' and senha ='$senha'";
      List clientes = await db.query(sql);
      for( final _cliente in clientes ){
          cliente.Set_nome = _cliente['nome'];
          cliente.Set_email = _cliente['email'];
          cliente.Set_telefone = _cliente['telefone'];
          cliente.Set_senha = _cliente['senha'];
          cliente.Set_perfil = _cliente['perfil'];
      }
      //listusuario();
      return cliente;  
    }

    listusuario() async{
      //var cliente = Cliente();
      Database db = await connectionDataBase();
      String sql = "SELECT * FROM clientes";
      List clientes = await db.rawQuery(sql);
      for( final cliente in clientes ){
        print(cliente['nome']);         
      }
      return clientes;  
    }
}
  

