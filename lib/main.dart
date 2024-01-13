import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:student/AddDatapage.dart';
import 'package:student/Student_details.dart';
import 'package:student/first_screen.dart';

String? name;
int? grid;
int? standard;
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
      home: const firstScreen(),
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
  File? gallaryImg;
  @override
  void initState() {
    // TODO: implement initState
    // if (name != null && grid != null && standard != null && image != null) {
    //   nameController.text = name!;
    //   gridController.text = grid!;
    //   standardController.text = standard!;
    // }
    super.initState();
  }

  pickImageFromCamera() async {
    var imageFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (imageFile != null) {
      setState(() {
        gallaryImg = File(imageFile.path);
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
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 600,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white10,
                boxShadow: [BoxShadow(color:Colors.black45,offset: Offset(3,5),blurRadius: 10,spreadRadius: 3),BoxShadow(color: Colors.white,)]),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
            Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('Enter Photo :',
                    style:
                    TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Container(
                  height: 200,
                  child: Center(
                    child: Stack(
                      children: [
                        (gallaryImg==null)? Container(
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey,
                          ),
                        ):
                        Container(
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey,
                              image: DecorationImage(
                                  image: FileImage(gallaryImg!),
                                  fit: BoxFit.cover
                              )
                          ),
                        ),
                        Positioned(
                            top: 20,
                            left: 99,
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
                            ))
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Enter your name',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    TextFormField(
                      controller: nameController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter name";
                        }
                      },
                      onSaved: (value) {
                        name = value;
                      },
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(hintText: 'Name'),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text('Enter GR - ID',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    TextFormField(
                      controller: gridController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "enter GR - ID";
                        }
                      },

                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(hintText: 'Gr id'),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text('Enter standard ',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    TextFormField(
                      controller: standardController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'enter standard';
                        }
                      },
                      onSaved: (value) {
                        image = value;
                      },
                      keyboardType: TextInputType.number,
                      decoration:
                      InputDecoration(hintText: 'enter Standard'),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateColor.resolveWith(
                                (states) => Colors.purple)),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        print('Data Submitted Successfully');

                        addData data = addData(
                            stu_name: nameController.text,
                            stu_grid: int.parse(gridController.text),
                            stu_standard: int.parse(standardController.text),
                            stu_image: gallaryImg!.path);
                        setState(() {
                          AddData.add(data);
                        });

                        // formkey.currentState!.save();

                        var snakebar =
                        SnackBar(content: Text('submited Successfully'));
                        ScaffoldMessenger.of(context).showSnackBar(snakebar);
                        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>firstScreen()), (route) => false);
                      }
                    },
                    child: Text(
                      'Submit',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    )),
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateColor.resolveWith(
                                (states) => Colors.purple)),
                    onPressed: () {
                      formKey.currentState!.reset();
                      var remove = SnackBar(content: Text('remove your data'));
                      ScaffoldMessenger.of(context).showSnackBar(remove);
                    },
                    child: Text("RESET",
                        style: TextStyle(fontSize: 18, color: Colors.white)))
              ],
            ),

      ]),
          ),
        ),
    ));
  }
}
