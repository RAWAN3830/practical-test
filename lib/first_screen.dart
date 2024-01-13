import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:student/AddDatapage.dart';
import 'package:student/Student_details.dart';
import 'package:student/edit_screen.dart';
import 'package:student/main.dart';

class firstScreen extends StatefulWidget {

  const firstScreen({super.key});

  @override
  State<firstScreen> createState() => _firstScreenState();
}

class _firstScreenState extends State<firstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Data'),
        backgroundColor: Colors.purpleAccent,
        toolbarHeight: 100,
      ),
      body: Column(
        children: [
          Container(
            height: 500,
            decoration: BoxDecoration(color: Colors.transparent),
            child: ListView.builder(
              itemCount: AddData.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {

                  },
                  child: Column(
                    children: [
                      AspectRatio(aspectRatio: 50),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          horizontalTitleGap: 10.0,
                            titleTextStyle: TextStyle(color:Colors.white),
                          iconColor: Colors.white,
                          tileColor: Colors.purpleAccent.shade200,
                          onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Stud_details(
                                stu_name: AddData[index].stu_name,
                                stu_image: AddData[index].stu_image,
                                stu_grid:  AddData[index].stu_grid,
                                stu_standard:  AddData[index].stu_standard,)));
                        },
                        leading: Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(shape: BoxShape.circle,
                          image: DecorationImage(image: FileImage(File(AddData[index].stu_image!)),fit: BoxFit.cover)),
                        ),
                        title: Text(AddData[index].stu_name!,style:TextStyle(fontWeight: FontWeight.bold,fontSize:20),),
                        subtitle: (Text(AddData[index].stu_grid.toString(),style: TextStyle(fontWeight: FontWeight.bold),)),
                        trailing: Container(
                          height: 50,
                          width: 100,
                          child: Row(children: [
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  AddData.remove(AddData[index]);
                                });
                              },
                              icon: Icon(CupertinoIcons.delete),
                            ),

                            IconButton(
                              onPressed: () {
                               Navigator.of(context).push(MaterialPageRoute(builder: (context) => EditScreen(
                                   stu_name: AddData[index].stu_name!,
                                   stu_image: AddData[index].stu_image!,
                                   stu_grid: AddData[index].stu_grid!,
                                   stu_standard: AddData[index].stu_standard!,
                                 index: index,),
                                   ));
                              },
                              icon: Icon(Icons.edit),
                            ),

                          ],),
                        ),
                     ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
         // Text(getTotal().toString())
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) =>MyHomePage()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
