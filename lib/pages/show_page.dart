import 'package:flutter/material.dart';


class ShowPage extends StatefulWidget {
  String firstname;
  String lastname;


  ShowPage(this.firstname, this.lastname);

  @override
  _ShowPageState createState() => _ShowPageState();
}

class _ShowPageState extends State<ShowPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Show Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Vos informations"),
            SizedBox(
              height: 15,
            ),
            Text("Nom : ${widget.firstname}"),
            SizedBox(
              height: 15,
            ),
            Text("Prenoms : ${widget.lastname}"),
            SizedBox(
              height: 15,
            ),


          ],
        ),
      ),
    );
  }
}
