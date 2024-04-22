import 'package:flutter/material.dart';

class Pet with ChangeNotifier {
  String? id;
  String userid;
  String name;
  String type;
  String gender;
  String image;
  int age;
  int weight;
  String vaccine;
  String reason;
  String city;
  String date;

  Pet(this.userid, this.name, this.type, this.gender, this.image, this.age, this.weight,
      this.vaccine, this.reason, this.city, this.date);

  Pet.fromMap(this.id, Map<String, dynamic> map)
      : userid= map["userid"] ??"", 
      name = map["name"] ?? "",
        type = map["type"] ?? "",
        gender = map["gender"] ?? "",
        image = map["image"] ?? "",
        age = map["age"] ?? "",
        weight = map["weight"] ?? "",
        vaccine = map["vaccine"] ?? "",
        reason = map["reason"] ?? "",
        city = map["city"] ?? "",
        date = map["date"] ?? "";

  Map<String, dynamic> toMap() {
    return {
      "userid" :userid,
      "name": name,
      "type": type,
      "gender": gender,
      "image": image,
      "age": age,
      "weight": weight,
      "vaccine": vaccine,
      "reason": reason,
      "city": city,
      "date": date,
    };
  }
}
