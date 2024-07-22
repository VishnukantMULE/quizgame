import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Future<Database> openMyDatabase() async {
  final dbPath = await getDatabasesPath();
  final path = join(dbPath, 'quizdatabse.db');
  final database = await openDatabase(
    path,
    version: 1,
    onCreate: (db, version) async {
      // Create tables here
    },
  );
  return database;
}