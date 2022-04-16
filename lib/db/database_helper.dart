
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mich/const.dart';
import 'package:mich/db/shared_preferences.dart';
import 'package:mich/models/my_model.dart';

class DatabaseHelper{
  static Future <void> initDatabase() async{
    Preferences.init();
    await Hive.initFlutter();
    Hive.registerAdapter(MyModelAdapter());
    print("Initialise la base de données ici");
  }

  static Future <void> saveData(String nom, String prenom, String path) async{
    // await Preferences.setStringValue(keyNomPref, nom);
    // await Preferences.setStringValue(keyPrenomPref, prenom);
    // await Preferences.setStringValue(keyProfilePath, path);
    final box= await Hive.openBox<MyModel>(kHiveModel);
    box.add(MyModel.fromMap({"lastname": nom, "firstname": prenom, "imagePath":path}));
  }
  static Future<List<MyModel>> getAllModels() async{
    final box= await Hive.openBox<MyModel>(kHiveModel);
    return box.values.toList();
  }
}