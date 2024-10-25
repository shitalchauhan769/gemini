import 'package:gemini/screen/history/model/history_model.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static DBHelper helper = DBHelper._();

  DBHelper._();

  Database? database;

  Future<Database?> checkDB() async {
    database ??= await initDB();
    return database;
  }

  Future<Database> initDB() async {
    String folder = await getDatabasesPath();
    String path = "$folder/demo.db";
    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        String qurey =
            "CREATE TABLE history (cid INTEGER PRIMARY KEY AUTOINCREMENT, history TEXT,status INTEGER)";
        db.execute(qurey);
      },
    );
  }

  Future<void> insertDB(String search, int id) async {
    database = await checkDB();
    database!.insert("history", {"history": search, "status": id});
  }

  Future<List<HistoryModel>> readDb() async {
    database = await checkDB();
    String query = "SELECT * FROM history";
    List<Map> l1 = await database!.rawQuery(query);
    List<HistoryModel> historyList = l1
        .map(
          (e) => HistoryModel.mapToModel(e),
        )
        .toList();
    return historyList;
  }

  Future<void> deleteDb(int cid) async {
    database = await checkDB();
    database!.delete("history", where: "cid=?", whereArgs: [cid]);
  }


}
