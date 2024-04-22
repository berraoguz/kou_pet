import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:koupet/model/pet.dart';
import 'package:koupet/view/addPet/create_pet.dart';
import 'package:koupet/view_model/create_pet_view_model.dart';

class ProfilePageViewModel with ChangeNotifier {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  List<Pet> _pets = [];

  List<Pet> get pets => _pets;
  String _type;

  String get type => _type;

  String userid;

  ProfilePageViewModel(this._type, this.userid) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _getUserPets(userid);
    });
  }


  void _getUserPets(String userid) async {
    print("!!!!!!!: "+_type);
    QuerySnapshot<Map<String, dynamic>> snapshot = await _firestore
        .collection("pets")
        .where("reason", isEqualTo: _type)
        .where("userid", isEqualTo: userid)
        .get();

    print("!!!!!!!: "+snapshot.docs.length.toString());

    for (QueryDocumentSnapshot<Map<String, dynamic>> documentSnapshot
    in snapshot.docs) {
      Pet pet = Pet.fromMap(
        documentSnapshot.id,
        documentSnapshot.data(),
      );
      _pets.add(pet);
    }
    notifyListeners();
  }


  void openAddPetPage(BuildContext context) {
    MaterialPageRoute pageRoute = MaterialPageRoute(
      builder: (context) => ChangeNotifierProvider(
        create: (context) => CreatePetViewModel(),
        child: AddPetPage(),
      ),
    );
    Navigator.push(context, pageRoute).then((value) {
      _pets.clear();
      _getUserPets(userid);
    });
  }
}
