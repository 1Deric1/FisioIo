import 'package:sqflite/sqflite.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';

import '../models/customer_model.dart';

class SQLiteService {
  static const String tableName = 'customers';
  static const String databaseName = 'fisio_database.db';

  Database? _database;

  Future<Database> get getDatabase async {
    if (_database != null) {
      return _database!;
    }

    _database = await initDatabase;
    return _database!;
  }

  Future<Database> get initDatabase async {
    final String path = await getDatabasesPath();
    final String databasePath = join(path, databaseName);

    return openDatabase(
      databasePath,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
          CREATE TABLE $tableName (
            name TEXT,
            phone TEXT,
            image TEXT,
            email TEXT PRIMARY KEY,
            password TEXT
          )
        ''');
      },
    );
  }

  Future<void> insertCustomer(CustomerModel customer) async {
    final Database db = await getDatabase;

    await db.insert(
      tableName,
      customer.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<CustomerModel?> getCustomerByCredentials(
    String email,
    String password,
  ) async {
    final Database db = await getDatabase;

    final List<Map<String, dynamic>> maps = await db.query(
      tableName,
      where: "email = ? AND password = ?",
      whereArgs: [email, password],
      limit: 1,
    );

    if (maps.isNotEmpty) {
      return CustomerModel.fromMap(maps.first);
    }

    return null;
  }

  Future<void> updateCustomerPassword(
    String email,
    String newPassword,
  ) async {
    final Database db = await getDatabase;

    await db.update(
      tableName,
      {'password': newPassword},
      where: 'email = ?',
      whereArgs: [
        email,
      ],
    );
  }

  Future<void> updateCustomer(
    CustomerModel oldCustomer,
    CustomerModel newCustomer,
  ) async {
    final Database db = await getDatabase;

    await db.update(
      tableName,
      oldCustomer
          .copyWith(
            name: newCustomer.name,
            phone: newCustomer.phone,
            email: newCustomer.email,
            password: newCustomer.password,
            image: newCustomer.image,
          )
          .toMap(),
      where:
          'email = ? AND password = ? AND phone = ? AND name = ? AND image = ?',
      whereArgs: [
        oldCustomer.email,
        oldCustomer.password,
        oldCustomer.phone,
        oldCustomer.name,
        oldCustomer.image,
      ],
    );
  }
}
