import 'dart:io';

import 'package:bank_system_app/core/utils/constrant.dart';
import 'package:bank_system_app/data/model/user_data_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../../data/model/transfer_data_model.dart';
import '../../domain/entities/base_user_data.dart';


class DatabaseHelper {
  static  const _databaseName = "bank.db";
  static const _databaseVersion = 2;
  static final table = "user";
  static final userID = "id";
  static final userName="name";
  static final userEmail="email";
  static final userBalance="balance";



  static final table3 = "transfers";
  static final transID = "id";
  static final senderName="sender";
  static final recieverName="reciever";
  static final ammountValue="ammount";
  static Database? _database;
  // privateconstructor
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  Future<Database?> get database async {
    if (_database != null) return _database;

    // create a database if one doesn't exist
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = documentDirectory.path+_databaseName;
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('CREATE TABLE $table('
        '$userID INTEGER PRIMARY KEY AUTOINCREMENT,'
        ' $userName TEXT, '
        '$userEmail TEXT,'
        '$userBalance DOUBLE)');

    await db.execute('CREATE TABLE $table3('
        '$transID INTEGER PRIMARY KEY AUTOINCREMENT,'
        '$senderName TEXT, '
        '$recieverName TEXT,'
        '$ammountValue DOUBLE)');
  }

  Future deleteTable(Database db)async{
    await db.delete(table);
  }

  Future <int?> insertUser(Map<String,dynamic> data ) async{
    Database? db = await instance.database;
    return await db!.insert(table, data);
  }
  Future <int?> insertTransfer(Map<String,dynamic> data ) async{
    Database? db = await instance.database;
  return await db!.insert(table3, data);

  }

  Future <int?> deleteUser(int id) async{
    Database? db = await instance.database;
    return await db?.delete(table, where: "id = ?", whereArgs: [id]);
  }

  Future <List<UserDataModel>> userQuery() async{
    Database? db = await instance.database;
    List<Map<String,dynamic>> users= await db!.query(table);
    List<UserDataModel> finalResult =[];
    for (var element in users) {
      UserDataModel results=UserDataModel.fromJson(element) ;
      finalResult.add(results);
    }
    return finalResult;
  }
  Future <List<TransferDataModel>> transferQuery() async{
    Database? db = await instance.database;
    List<Map<String,dynamic>> users= await db!.query(table3);
    print(users);
    return List<TransferDataModel>.from((users).map((e) =>TransferDataModel.fromJson(e)));
  }
  List<UserDataModel> parseCustomer(List<Map<String, dynamic>> customerMaps) {
    final List<UserDataModel> customers = [];

    for (var customerMap in customerMaps) {
      final customer = UserDataModel.fromJson(customerMap);
      customers.add(customer);
    }

    return customers;
  }

  Future<UserDataModel> findUserByName(int  id) async {
    print(id);
    final db = await instance.database;
    final customerMaps = await db!.rawQuery('SELECT * FROM $table WHERE id=?', [id]);
    print("Userrrrrrrrrrrrr: ${customerMaps[0]}");
    return UserDataModel.fromJson(customerMaps[0]);
  }
  Future<int> updateUser(Map<String,dynamic> user,id) async {
    Database? db = await instance.database;
    var result = await db!.update(table, user,
        where: '$userID = $id');
    return result;
  }




}