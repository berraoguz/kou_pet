import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:koupet/model/pet.dart';

class CreatePetViewModel with ChangeNotifier {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  FirebaseStorage _storage = FirebaseStorage.instance;
  
  String? _url;
  String? get imageUrl => _url;

  User? user;
  String? userid;

  CreatePetViewModel() {
    user = _auth.currentUser;
    if (user != null) {
      userid = user!.uid;
    }
  }

  get pets => null;

  void addPet(
      BuildContext context,
      String name,
      String type,
      String gender,
      int age,
      int weight,
      String vaccine,
      String reason,
      String city,
      String date) async {
    if (_url != null) {
      Pet pet = Pet(
        userid!, name, type, gender, _url!, age, weight, vaccine, reason, city, date);
      await _firestore.collection("pets").doc().set(pet.toMap());
      Navigator.pop(context);
    }
  }

  Future pickImage(String name) async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);

      if (image == null) return;

      final imageTemp = File(image.path);

      TaskSnapshot snapshot =
          await _storage.ref("users/$name.jpg").putFile(imageTemp);
      _url = await snapshot.ref.getDownloadURL();

      notifyListeners();
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }
}
