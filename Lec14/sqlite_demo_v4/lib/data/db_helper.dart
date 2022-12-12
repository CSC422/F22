import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../constants/constants.dart';
import '../domain/pet.dart';

class DBHelper {
  final _databaseName = kDatabaseName;
  final _databaseVersion = kDatabaseVersion;
  final _table = kTableName;
  final createSQL = '''CREATE TABLE $kTableName (
      ${Columns.id.name} INTEGER PRIMARY KEY, 
      ${Columns.name.name} TEXT, 
      ${Columns.age.name} INTEGER,
      ${Columns.species.name} TEXT, 
      ${Columns.imgUrl.name} TEXT)''';

  Database? _database;
  static final DBHelper instance = DBHelper._();
  DBHelper._();

  // only have a single app-wide reference to the database
  Future<Database> get database async {
    return _database ?? await _initDatabase();
  }

  Future<Database> _initDatabase() async {
    // Set the path to the database. Note: Using the `join` function from the
    // `path` package is best practice to ensure the path is correctly set
    // for Android or iOS.
    String path = join(await getDatabasesPath(), _databaseName);
    _database = await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: (db, version) async {
        // Run the CREATE TABLE statement on the database.
        await db.execute(createSQL);
      },
    );
    return _database!;
  }

  // Helper methods

  // Inserts a row in the database where each key in the Map is a column name
  // and the value is the column value. The return value is the id of the
  // inserted row.
  // `conflictAlgorithm` to use in case the same pet is inserted twice.
  // In this case, replace any previous data.
  Future<int> insert(Pet pet) async {
    Database db = await database;
    return db.insert(
      _table,
      pet.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // All of the rows are returned as a list of maps, where each map is
  // a key-value list of columns.
  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database db = await database;
    return await db.query(_table);
  }

  // Queries rows based on the argument received
  Future<List<Map<String, dynamic>>> queryRows(name) async {
    Database db = await database;
    return db.query(_table, where: "${Columns.name.name} LIKE '%$name%'");
  }

  // All of the methods (insert, query, update, delete) can also be done using
  // raw SQL commands. This method uses a raw query to give the row count.
  Future<int?> queryRowCount() async {
    Database db = await database;
    return Sqflite.firstIntValue(
        await db.rawQuery('SELECT COUNT(*) FROM $_table'));
  }

  // We are assuming here that the id column in the map is set. The other
  // column values will be used to update the row.
  Future<int> update(Pet pet) async {
    Database db = await database;
    int id = pet.toMap()[Columns.id.name];
    return db.update(_table, pet.toMap(),
        where: '${Columns.id.name} = ?', whereArgs: [id]);
  }

  // Deletes the row specified by the id. The number of affected rows is
  // returned. This should be 1 as long as the row exists.
  Future<int> delete(int id) async {
    Database db = await database;
    return db.delete(_table, where: '${Columns.id.name} = ?', whereArgs: [id]);
  }

  Future<void> reset() async {
    Database db = await database;
    await db.execute('DROP TABLE IF EXISTS $_table');
    await db.execute(createSQL);
  }

  Future<List<Map<String, dynamic>>> getById(id) async {
    Database db = await database;
    return db.query(_table, where: "${Columns.id.name} LIKE '%$id%'");
  }
}
