import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:student/AddDatapage.dart';
import 'package:student/Student_details.dart';

String? name;
String? grid;
String? standard;
String? image;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // final AddData add;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int indexCount = 0;
  TextEditingController nameController = TextEditingController();
  TextEditingController gridController = TextEditingController();
  TextEditingController standardController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  File? image;
  @override
  void initState() {
    // TODO: implement initState
    if (name != null && grid != null && standard != null && image != null) {
      nameController.text = name!;
      gridController.text = grid!;
      standardController.text = standard!;
    }
    super.initState();
  }

  pickImageFromCamera() async {
    var imageFile = await ImagePicker().pickImage(source: ImageSource.camera);
    if (imageFile != null) {
      setState(() {
        image = File(imageFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text('Student Portal',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 25)),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 40,
                  width: 200,
                  color: Colors.purpleAccent,
                  child: InkWell(
                      onTap: () {
                        setState(() {
                          indexCount = 0;
                          Container(
                            height: 10,
                            width: 100,
                            color: Colors.red,
                          );
                          // Colors.red;
                        });
                      },
                      child: Center(
                          child: Text(
                        'Contact',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ))),
                ),
                Container(
                  height: 40,
                  width: 182,
                  color: Colors.purpleAccent,
                  child: InkWell(
                      onTap: () {
                        setState(() {
                          indexCount = 1;
                        });
                      },
                      child: Center(
                          child: Text('Photo',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)))),
                )
              ],
            ),
            SizedBox(height: 20),
            IndexedStack(
              index: indexCount,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        TextFormField(
                            controller: nameController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enter Name';
                              }
                            },
                            onSaved: (value) {
                              name = value;
                            },
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                                hintText: 'Name',
                                prefixIcon: Icon(
                                    CupertinoIcons.person_alt_circle_fill,
                                    size: 30))),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: gridController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter GR - id";
                            }
                          },
                          onSaved: (value) {
                            grid = value;
                          },
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.perm_identity,
                              color: Colors.black,
                              size: 30,
                            ),
                            hintText: 'GR - id',
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          controller: standardController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter standard ";
                            }
                          },
                          onSaved: (value) {
                            standard = value;
                          },
                          keyboardType: TextInputType.phone,
                          maxLength: 2,
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.abc_outlined,
                              size: 30,
                            ),
                            hintText: "std",
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateColor.resolveWith(
                                          (states) => Colors.purple),
                                ),
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    print('Submit');
                                    formKey.currentState!.save();

                                    // AddData adData = AddData(
                                    //     stu_name:s,
                                    //     stu_grid: stu_grid,
                                    //     stu_standard: stu_standard,
                                    //     stu_image: stu_image)

                                    var snackbar = SnackBar(
                                        content: Text(
                                            'student Info Submitted sucessfully.'));
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackbar);
                                  }
                                },
                                child: Text(
                                  'Submit',
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.white),
                                )),
                            ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateColor.resolveWith(
                                            (states) => Colors.purple)),
                                onPressed: () {
                                  formKey.currentState!.reset();
                                },
                                child: Text('Reset',
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.white)))
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                          InkWell(
                      onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Stud_details()));
                    },
                            child: Container(
                              height: 100,
                              width: 100,
                              color: Colors.purple,
                            ),
                          )
                          // Container(
                          //   height: 400,
                          //   width: double.infinity,
                          //   decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.purple.shade100,),
                          //   child: ListTile(
                          //     leading:Container(child: Image.asset('assets/images/s1.jpg')),
                          //     title: Text("name"),
                          //     trailing:InkWell(
                          //             onTap: () {
                          //               Navigator.of(context).push(MaterialPageRoute(
                          //                   builder: (context) => Stud_details()));
                          //             },
                          //           ),
                          //   ),
                          // ),

                        //     trailing: InkWell(
                        //       onTap: () {
                        //         // Navigator.of(context).push(MaterialPageRoute(
                        //         //     builder: (context) => Stud_details()));
                        //       },
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 400,
                  // color: Colors.yellow,
                  child: Center(
                    child: Stack(
                      children: [
                        (image == null)
                            ? Container(
                                height: 120,
                                width: 120,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle, color: Colors.grey),
                                child: Center(
                                    child: Text(
                                  'ADD',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                )),
                              )
                            : Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.grey,
                                    image: DecorationImage(
                                        image: FileImage(image!),
                                        fit: BoxFit.cover)),
                              ),
                        Positioned(
                          top: 10,
                          left: 90,
                          child: InkWell(
                            onTap: () {
                              pickImageFromCamera();
                            },
                            child: Container(
                              height: 25,
                              width: 25,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.blue),
                              child: Center(
                                  child: Icon(
                                CupertinoIcons.add,
                                color: Colors.white,
                              )),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
