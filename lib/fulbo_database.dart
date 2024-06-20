import 'package:fulbo/fulbo.dart'; // Reemplazar con la ubicación correcta de fulbo.dart
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class FulboDatabase {
  static final FulboDatabase instance = FulboDatabase._internal();

  static Database? _database;

  FulboDatabase._internal();

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, 'fulbos.db');
    return await openDatabase(
      path,
      version: 1, // Actualiza la versión si es necesario
      onCreate: _createDatabase,
      onUpgrade: _upgradeDatabase,
    );
  }

  Future<void> _createDatabase(Database db, int version) async {
    return await db.execute('''
        CREATE TABLE ${FulboFields.tableName} (
          ${FulboFields.id} ${FulboFields.idType},
          ${FulboFields.name} ${FulboFields.textType},
          ${FulboFields.foundingYear} ${FulboFields.intType},
          ${FulboFields.lastchampionshipDate} ${FulboFields.dateType}
        )
      ''');
  }

  Future<void> _upgradeDatabase(Database db, int oldVersion, int newVersion) async {
    // Aquí puedes manejar las actualizaciones de la base de datos si es necesario
  }

  Future<FulboModel> create(FulboModel fulbo) async {
    final db = await instance.database;
    final id = await db.insert(FulboFields.tableName, fulbo.toJson());
    return fulbo.copy(id: id);
  }

  Future<FulboModel> read(int id) async {
    final db = await instance.database;
    final maps = await db.query(
      FulboFields.tableName,
      columns: FulboFields.values,
      where: '${FulboFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return FulboModel.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<FulboModel>> readAll() async {
    final db = await instance.database;
    const orderBy = '${FulboFields.foundingYear} DESC'; // Cambiar el campo de ordenamiento según necesidad
    final result = await db.query(FulboFields.tableName, orderBy: orderBy);
    return result.map((json) => FulboModel.fromJson(json)).toList();
  }

  Future<int> update(FulboModel fulbo) async {
    final db = await instance.database;
    return db.update(
      FulboFields.tableName,
      fulbo.toJson(),
      where: '${FulboFields.id} = ?',
      whereArgs: [fulbo.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await instance.database;
    return await db.delete(
      FulboFields.tableName,
      where: '${FulboFields.id} = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
