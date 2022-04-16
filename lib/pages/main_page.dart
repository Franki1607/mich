import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mich/db/database_helper.dart';
import 'package:mich/models/my_model.dart';
import 'package:mich/pages/show_page.dart';

import 'add_page.dart';

List<MyModel> allmodels=[];
class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Accueil")),
      body: FutureBuilder(
        future: DatabaseHelper.getAllModels(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            allmodels=snapshot.data as List<MyModel>;
          }

          return snapshot.hasData?
          allmodels.length==0?
          Center(
            child: Text("Aucun élement pour l'instant"),
          ):
          ListView.builder(
            itemCount: allmodels.length,

            itemBuilder: (context, index){
            return InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ShowPage(allmodels[index].firstname, allmodels[index].lastname)));
              },
              child: Card(
                child: Container(
                  height: 200,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Image.file(File(allmodels[index].imagePath)),
                      )
                    ],
                  ),
                ),
              ),
            );
          }):
          Center(
            child: CircularProgressIndicator(),
          );
        }
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context )=>AddPage())).then((value){
            setState(() {

            });
          });
        },
      ),
    );
  }
}
