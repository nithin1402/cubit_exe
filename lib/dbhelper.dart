
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class Dbhelper{
  Dbhelper._();

  static final instance=Dbhelper._();

  Database? mDb;

  static final String TABLE_NOTE="note";
  static final String NOTE_COLUMN_TITLE="title";
  static final String NOTE_COLUMN_DESC="desc";
  static final String NOTE_COLUMN_ID="id";

  Future<Database> initDB() async{
    mDb =mDb ?? await openDB();
    return mDb!;
  }

  Future<Database> openDB() async{
    var dirPath= await getApplicationDocumentsDirectory();
    var dbPath=join(dirPath.path, "noteDB.db");

    return openDatabase(dbPath,version: 1,onCreate: (db,version){
      db.execute("create table $TABLE_NOTE ( $NOTE_COLUMN_ID integer primary key autoincrement, $NOTE_COLUMN_DESC text, $NOTE_COLUMN_TITLE text )");
    });
  }

  // getInitialNotes() async{
  //   Database db=await initDB();
  //   List<Map<String,dynamic>> cData=await db.query(TABLE_NOTE);
  //   return cData;
  // }


  Future<List<Map<String, dynamic>>> fetchAllNotes() async{
    Database db=await initDB();
    List<Map<String,dynamic>> mData=await db.query(TABLE_NOTE);
    return mData;
  }

  Future<bool> addNote({required String title,required String desc}) async{
    Database db=await initDB();
    int rowsEffected=await db.insert("$TABLE_NOTE", {
      "title" :title,
      "desc" :desc
    });
    return rowsEffected>0;
  }

  Future<bool> updateData({required int id,required String title,required String desc})async{
    Database db=await initDB();
    int rowsEffected= await db.update(TABLE_NOTE, {
      "title" : title,
      "desc" :desc
    },where: "$NOTE_COLUMN_ID=?",whereArgs: [id]);
    return rowsEffected>0;
    //fetchAllNotes();
    //emit(ListState(mData: fetchAllNotes()));
  }

  Future<bool> removeData({required int id})async{
    Database db= await initDB();
    int rowsEffected= await db.delete(TABLE_NOTE,
        where: "$NOTE_COLUMN_ID=?",whereArgs: ['$id']
    );
    return rowsEffected>0;
    //fetchAllNotes();
    //emit(ListState(mData: fetchAllNotes()));
  }





}