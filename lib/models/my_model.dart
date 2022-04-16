import 'package:hive/hive.dart';

part 'my_model.g.dart';
@HiveType(typeId: 0)
class MyModel{
  @HiveField(0)
  String firstname;
  @HiveField(1)
  String lastname;
  @HiveField(2)
  String imagePath;


  MyModel(this.firstname, this.lastname, this.imagePath);

  factory MyModel.fromMap(Map<String, dynamic> json)=> MyModel(
      json['firstname'],
      json['lastname'],
      json['imagePath'],
  );
  Map <String, dynamic> toMap()=>{
    'firstname': firstname,
    'lastname': lastname,
    'imagePath': imagePath,
  };
}