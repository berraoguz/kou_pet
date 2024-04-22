import 'package:flutter/material.dart';

class Users with ChangeNotifier {
  String? uid;
  String name;
  String surname;
  String? profileimg;

  Users(this.uid, this.name, this.surname, this.profileimg);

  Users.fromMap(Map<String, dynamic> map)
      : uid = map["uid"],
        name = map["name"],
        surname = map["surname"],
        profileimg = map["image"];

  Map<String, dynamic> toMap() {
    return {
      "uid": uid,
      "name": name,
      "surname": surname,
      "image": profileimg ??
          "", 
    };
  }
}
