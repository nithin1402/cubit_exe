import 'package:cubit_exe/dbhelper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';

import 'list_cubit.dart';

class SecondPage extends StatelessWidget {

  Dbhelper dbHelper=Dbhelper.instance;


  TextEditingController titleController  =TextEditingController();
  TextEditingController descController= TextEditingController();

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text("Add page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                hintText: "Enter title",
                labelText: "Label",
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15)
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15)
                )
              ),
            ),
            SizedBox(height: 11,),
            TextField(
              controller: descController,
              decoration: InputDecoration(
                  hintText: "Enter desc",
                  labelText: "Description",
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)
                  )
              ),
            ),
            SizedBox(height: 11,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                OutlinedButton(onPressed: () async{
                context.read<ListCubit>().addNote(title: titleController.text.toString(), desc: descController.text.toString());
                Navigator.pop(context);
                }, child: Text("Add")),
                SizedBox(width: 11,),
                OutlinedButton(onPressed: () {
                  Navigator.pop(context);
                }, child: Text("Calcel"))
              ],
            )
          ],
        ),
      )
    );
  }
}

class UpdatePage extends StatelessWidget {

  int index;
  UpdatePage({required this.index});

  Dbhelper dbHelper=Dbhelper.instance;


  TextEditingController titleController  =TextEditingController();
  TextEditingController descController= TextEditingController();

  @override
  Widget build(BuildContext context) {


    return Scaffold(
        appBar: AppBar(
          title: Text("Add page"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(
                    hintText: "Enter title",
                    labelText: "Title",
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)
                    )
                ),
              ),
              SizedBox(height: 11,),
              TextField(
                controller: descController,
                decoration: InputDecoration(
                    hintText: "Enter desc",
                    labelText: "Description",
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)
                    )
                ),
              ),
              SizedBox(height: 11,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  OutlinedButton(onPressed: () async{
                    context.read<ListCubit>().updateData(id: index, title: titleController.text.toString() , desc: descController.text.toString());
                    Navigator.pop(context);
                  }, child: Text("Update")),
                  SizedBox(width: 11,),
                  OutlinedButton(onPressed: () {
                    Navigator.pop(context);
                  }, child: Text("Calcel"))
                ],
              )
            ],
          ),
        )
    );
  }
}