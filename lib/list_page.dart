import 'package:cubit_exe/dbhelper.dart';
import 'package:cubit_exe/list_cubit.dart';
import 'package:cubit_exe/second_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'main.dart';

class ListPage extends StatefulWidget {

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  Dbhelper dbhelper=Dbhelper.instance;
  List<Map<String,dynamic>> allData=[];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<ListCubit>().getInitialNotes();
    //allData=context.watch<ListCubit>().fetchAllNotes();
  }

  @override
  Widget build(BuildContext context) {

    //mdata=context.watch<ListCubi>().state.mData;
    //context.read<ListCubit>().getInitialNotes();
    allData=context.watch<ListCubit>().state.mData;

    return Scaffold(
      appBar: AppBar(
        title: Text("List page"),
      ),
      body: allData.isNotEmpty ? ListView.builder(
        itemCount: allData.length,
          itemBuilder: (_,index){
        return ListTile(
          leading: Text('${index+1}'),
          title: Text(
            allData[index]["title"]
          ),
          subtitle: Text(
              allData[index]["desc"]
          ),
          trailing: SizedBox(
            width: 100,
            child: Row(
              children: [
                IconButton(onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>UpdatePage(index: allData[index][ListCubit.NOTE_COLUMN_ID],

                  )));
                }, icon:Icon(Icons.edit),),
                IconButton(onPressed: () {
                  context.read<ListCubit>().removeData(id: allData[index][ListCubit.NOTE_COLUMN_ID]);
                }, icon: Icon(Icons.delete),color: Colors.red,)
              ],
            ),
          ),
        );
      }) : Center(child: Text("No notes added")),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>SecondPage()));
      },child: Text("Next"),),
    );
  }
}

