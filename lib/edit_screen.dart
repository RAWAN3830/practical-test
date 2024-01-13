import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:student/first_screen.dart';

import 'AddDatapage.dart';

class EditScreen extends StatefulWidget {
  final String stu_name;
  final String stu_image;
  final int stu_grid;
  final int index;
  final int stu_standard;


  const EditScreen({super.key,
    required this.stu_name,
    required this.stu_image,
    required this.stu_grid,
    required this.stu_standard,
    required this.index,
  });

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController gridController = TextEditingController();
  TextEditingController standardController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  File? gallaryImg;
  @override
  void initState() {
    // TODO: implement initState
    nameController.text = widget.stu_name!;
    gridController.text = widget.stu_grid.toString();
    standardController.text = widget.stu_standard.toString();
    setState(() {
      gallaryImg = File(widget.stu_image!);
    });
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
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text('Edit Screen'),
        ),
        body: SingleChildScrollView(
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
                          // onSaved: (value) {
                          //   name = value;
                          // },
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(hintText: 'Name'),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text('Enter number',
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
                          // onSaved: (value) {
                          //   image = value;
                          // },
                          keyboardType: TextInputType.number,
                          decoration:
                          InputDecoration(hintText: 'enter Standard'),
                        )
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateColor.resolveWith(
                                    (states) => Colors.purple)),
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            print('SUbmit your content');

                            addData data = addData(
                                stu_name: nameController.text,
                                stu_grid: int.parse(gridController.text),
                                stu_standard: int.parse(standardController.text),
                                stu_image: gallaryImg!.path);
                            setState(() {
                               AddData[widget.index!] = data;
                            });

                            // formkey.currentState!.save();

                            var snakebar =
                            SnackBar(content: Text('submited Successfully'));
                            ScaffoldMessenger.of(context).showSnackBar(snakebar);
                            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>firstScreen()), (route) => false);
                          }
                        },
                        child: Text(
                          'Edit',
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
                        child: Text("Restart",
                            style: TextStyle(fontSize: 18, color: Colors.white)))
                  ],
                ),

              ]),
        )
    );
  }
}
