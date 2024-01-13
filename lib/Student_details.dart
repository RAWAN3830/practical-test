import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Stud_details extends StatefulWidget {
  const Stud_details({super.key});

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
                      image: AssetImage('assets/images/s1.jpg'),
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
                        'Name',
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
                            Text('12345',style: TextStyle(fontSize: 20))
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
                            Text('5',style: TextStyle(fontSize: 20))
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
