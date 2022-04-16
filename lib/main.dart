import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:mich/const.dart';
import 'package:mich/db/database_helper.dart';
import 'package:mich/db/shared_preferences.dart';
import 'package:mich/pages/main_page.dart';

import 'db/shared_preferences.dart';

String profilePath="";

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseHelper.initDatabase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

