
import 'package:cubit_exe/dbhelper.dart';
import 'package:cubit_exe/list_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class ListCubit extends Cubit<ListState>{

  ListCubit() : super(ListState(mData: []));

  Database? mDb;

  static final String TABLE_NOTE="note";
  static final String NOTE_COLUMN_TITLE="title";
  static final String NOTE_COLUMN_DESC="desc";
  static final String NOTE_COLUMN_ID="id";

  Dbhelper dbhelper=Dbhelper.instance;

  // Future<Database> initDB() async{
  //   mDb =mDb ?? await openDB();
  //   return mDb!;
  // }
  //
  // Future<Database> openDB() async{
  //   var dirPath= await getApplicationDocumentsDirectory();
  //   var dbPath=join(dirPath.path,TABLE_NOTE);
  //
  //   return openDatabase(dbPath,version: 1,onCreate: (db,version){
  //     db.execute("create table $TABLE_NOTE ($NOTE_COLUMN_ID integer primary key autoincrement,$NOTE_COLUMN_DESC text,$NOTE_COLUMN_TITLE text)");
  //   });
  // }
  //
  //
    getInitialNotes() async{
    //Database db=await initDB();
    List<Map<String,dynamic>> cData=await dbhelper.fetchAllNotes();
    emit(ListState(mData: cData));
  }




     addNote({required String title,required String desc}) async{
    bool check=await dbhelper.addNote(title: title, desc: desc);
    if(check){
      var mNotes=await dbhelper.fetchAllNotes();
      emit(ListState(mData: mNotes));
    }
    // Database db=await initDB();
    // //List<Map<String,dynamic>> currentData=state.mData;
    // await db.insert(TABLE_NOTE,{
    //   "title":title,
    //   "desc":desc
    // });
    // fetchAllNotes();
    //emit(ListState(mData: fetchAllNotes()));
    //emit(ListState(mData: currentData));

    // int rowsEffected=await db.insert(TABLE_NOTE, {
    //   "title" :title,
    //   "desc" :desc
    // });
    //return rowsEffected>0;
  }

  //
  // addData(Map<String,dynamic> eachData) {
  //  List<Map<String,dynamic>> currentData=state.mData;
  //  currentData.add(eachData);
  //
  //  emit(ListState(mData: currentData));
  // }


  updateData({required int id,required String title,required String desc})async{
    bool check= await dbhelper.updateData(id: id, title: title, desc: desc);
    if(check){
      var mNotes= await dbhelper.fetchAllNotes();
      emit(ListState(mData: mNotes));
    }
    // Database db=await initDB();
    // db.update(TABLE_NOTE, {
    //   "title" : title,
    //   "desc" :desc
    // },where: "$NOTE_COLUMN_ID=?",whereArgs: [id]);
    // fetchAllNotes();
    //emit(ListState(mData: fetchAllNotes()));
  }

  removeData({required int id})async{
    bool check=await dbhelper.removeData(id: id);
    if(check){
      var mNotes=await dbhelper.fetchAllNotes();
      emit(ListState(mData: mNotes));
    }
    // Database db= await initDB();
    // db.delete(TABLE_NOTE,
    //   where: "$NOTE_COLUMN_ID=?",whereArgs: ['$id']
    // );
    // fetchAllNotes();
    //emit(ListState(mData: fetchAllNotes()));
  }

}