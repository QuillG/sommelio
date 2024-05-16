import 'package:path/path.dart' as p;
import 'package:sommelio/models/user.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static const _databaseName = "sommelioLite.db";
  static const _databaseVersion = 1;

  static const table = 'user_table';

  static const columnId = 'id';
  static const columnName = 'name';
  static const columnSurname = 'surname';
  static const columnEmail = 'email';
  static const columnProfilePictureUrl = 'profilePictureUrl';

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  _initDatabase() async {
    String path = p.join(await getDatabasesPath(), _databaseName);
    Database db = await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
    testDatabase();
    return db;
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $table (
            $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
            $columnName TEXT NOT NULL,
            $columnSurname TEXT NOT NULL,
            $columnEmail TEXT NOT NULL,
            $columnProfilePictureUrl TEXT
          )
          ''');
  }

  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(table, row);
  }

  Future<bool> saveUser(User user) async {
    Database db = await instance.database;
    var res = await db.insert(table, user.toJson());
    return res > 0;
  }

  Future<User?> getUser() async {
    Database db = await instance.database;
    var users = await db.query(table);
    return users.isNotEmpty ? User.fromJson(users.first) : null;
  }

  //Delete all users
  Future<int> deleteAllUsers() async {
    if (_database != null) {
      Database db = await instance.database;
      return await db.delete(table);
    } else {
      return 0;
    }
  }

  Future<void> testDatabase() async {
    // Obtenez la base de données
    Database db = await database;

    // Insérez une entrée de test
    await db.insert(
      table,
      {
        columnName: 'Test Name',
        columnSurname: 'Test Surname',
        columnEmail: 'test@example.com',
        columnProfilePictureUrl: 'https://example.com/profile.jpg',
      },
    );

    // Récupérez l'entrée de test
    List<Map<String, dynamic>> maps = await db.query(table);

    // Imprimez l'entrée de test
    print(maps);
  }
}
