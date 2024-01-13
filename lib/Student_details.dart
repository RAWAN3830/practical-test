import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Stud_details extends StatefulWidget {
  final String? stu_name;
  final String? stu_image;
  final int? stu_grid;
  final int? stu_standard;

  const Stud_details({super.key,
    required this.stu_name,required this.stu_image,required this.stu_grid,required this.stu_standard});

  @override
  State<Stud_details> createState() => _Stud_detailsState();
}

class _Stud_detailsState extends State<Stud_details> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.purple, Colors.white])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          // elevation: 0.3,
          backgroundColor: Colors.transparent,

          leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(
              Icons.keyboard_arrow_left,
              color: Colors.white,
              size: 30.0,
            ),
          ),
        ),
        floatingActionButton: Align(
          alignment: Alignment(0.2, -0.7),
          child: Container(
              width: 230.0,
              height: 230.0,
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: FileImage(File(widget.stu_image!)),
                      fit: BoxFit.cover),
                  boxShadow: [
                    BoxShadow(blurRadius: 30.0, color: Colors.black45)
                  ])),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 150),
                child: Container(
                  height: 500,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40)),
                      color: Colors.white),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.stu_name!,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 35,
                            ),
                      ),
                      SizedBox(height: 20,),
                      Container(
                        height: 100,
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('GR - ID : ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
                            Text(widget.stu_grid.toString(),style: TextStyle(fontSize: 20))
                          ],
                        ),
                      ),
                      SizedBox(height: 20,),
                      Container(
                        height: 100,
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(' Standerd : ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
                            Text(widget.stu_standard.toString(),style: TextStyle(fontSize: 20))
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
