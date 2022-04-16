import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:mich/db/database_helper.dart';
import 'package:mich/pages/show_page.dart';

import '../main.dart';

late String firstname;
late String lastname;

class AddPage extends StatefulWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    profilePath="";
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Main page"),
        ),
        body:Center(
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  profilePath==""?
                  CircleAvatar(
                    backgroundImage:AssetImage("assets/images/profile.png") ,
                    maxRadius: 60,
                  ):
                  CircleAvatar(
                    backgroundImage:FileImage(File('${profilePath}')) ,
                    maxRadius: 60,
                  ),
                  IconButton(
                      onPressed: () async{
                        FilePickerResult? result= await FilePicker.platform.pickFiles(
                            type: FileType.image
                        );
                        if(result!=null){
                          if((result.files.first.extension=="jpg"||result.files.first.extension=="jpeg"||result.files.first.extension=="png"||result.files.first.extension=="gif") && result.files.first.size<=4194304){
                            print(result.files.first.size);
                            setState(() {
                              print("Iget");
                              profilePath='${result.files.first.path}';

                              // Preferences.setStringValue(keyUserProfileImagePath, profilePath);
                            });
                          }else{
                            Scaffold.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("Veillez selectionner une image de moins de 4Mo"),
                                )
                            );
                          }
                        }
                      },
                      icon: Icon(Icons.add_circle,)
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.only(left: 40, right: 40),
                child: TextFormField(
                  onChanged: (text){
                    lastname=text;
                  },
                  validator: (text){
                    if(text!.trim().length<6)return 'Vous devez entrer au minimum 06 caractères';
                    else return null;
                  },
                  decoration: InputDecoration(
                    label: Text("Entrez votre nom",),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.only(left: 40, right: 40),
                child: TextFormField(
                  onChanged: (text){
                    firstname=text;
                  },
                  validator: (text){
                    if(text!.trim().length<6)return 'Vous devez entrer au minimum 06 caractères';
                    else return null;
                  },
                  decoration: InputDecoration(
                    label: Text("Entrez vos prenoms",),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    child: Text("Valider"),
                    onPressed: () async{
                      print("Here $profilePath");
                      await DatabaseHelper.saveData(lastname, firstname, profilePath).then((value){
                        Navigator.pop(context);
                      });
                      // Navigator.push(context, MaterialPageRoute(builder: (context)=>SecondPage()));
                    },
                  )
                ],
              )
            ],
          ),
        )
    );
  }
}
