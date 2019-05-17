import 'dart:async';
import 'package:flutter_app1/db/Note.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
class dbHelper{
  static final dbHelper _instance = new dbHelper.internal();
  factory dbHelper() => _instance;
   final String tableNote = 'notableTable';
   final String columnId = 'id';
   final String pointId = 'pointId';
   final String image = 'image';
   final String contractId = 'contractId';
   final String publicationId = 'publicationId';
   final String pointLat = 'pointLat';
   final String pointLng = 'pointLng';
   String sql;

   static Database _db;
   dbHelper.internal();
   
   Future<Database> get db async{
     if(_db != null){
       return _db;
     }
     _db = await initDb();
     
     return _db;
   }
   
   initDb() async{
     String databasePath = await getDatabasesPath();
     String path = join(databasePath,'notes11.db');
     
     var db = await openDatabase(path,version: 1,onCreate: _onCreate);
     return db;
   }
   
   void _onCreate(Database db, int newVersion) async{
     sql = 'CREATE TABLE $tableNote($columnId INTEGER PRIMARY KEY AUTOINCREMENT, $pointId TEXT, $image TEXT, $contractId TEXT, $publicationId TEXT, $pointLng TEXT, $pointLat TEXT)';
     await db.execute(sql);
   }

   Future<int> saveNote(Note note) async{
     var dbClient = await db;
     var result = await dbClient.insert(tableNote, note.toMap());
     return result;
   }
   
   Future<List> getAllNotes() async{
     var dbClient = await db;
     var result = await dbClient.query(tableNote,columns: [columnId,pointId,image,columnId,publicationId,pointLng,pointLat]);
     return result.toList();
   }

  Future<int> getCount() async {
     var dbClient = await db;
     return Sqflite.firstIntValue(await dbClient.rawQuery('SELECT COUNT(*) FROM $tableNote'));
   }

  Future<int> deleteAll() async {
     var dbClient = await db;
     return dbClient.delete(tableNote);
   }

   Future<Note> getNote(int id) async{
     var dbClient = await db;
     List<Map> result = await dbClient.query(tableNote,
     columns: [columnId,pointId,image,contractId,publicationId,pointLng,pointLat],
     where: '$columnId = ?',
     whereArgs: [id]);

     if(result.length>0){
       return new Note.forMap(result.first);
     }

     return null;
   }

   Future<int> deletetNote(String images) async{
     var dbClient = await db;
     return await dbClient.delete(tableNote,where: '$image=?',whereArgs: [images]);
   }

   Future<int> updataNote(Note note) async{
     var dbClient = await db;
     return await dbClient.update(tableNote, note.toMap(),where: '$columnId = ?',whereArgs: [note.id]);
   }

   Future close() async{
     var dbClient = await db;
     return dbClient.close();
   }
}