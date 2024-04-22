import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view/home/home_page.dart';
import '../view/login/login_page.dart';
import 'home_view_model.dart';
import 'login_view_model.dart';

class RegisterViewModel with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  late User currentUser;
  late DocumentSnapshot<Map<String, dynamic>> _documentSnapshot;

  Future<void> signUpWithEmailAndPassword(
      String name,
      String surname,
      String email,
      String password,
      BuildContext context,
      ) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await _firestore.collection("users").doc(userCredential.user!.uid).set({
        'uid' : userCredential.user!.uid,
        'name': name,
        'surname': surname,
        'email': email,
      });

      _openHomePage(context);
    } catch (e, st) {
      print(e);
      print(st);
      rethrow;
    }
  }

  Future<User?> getCurrentUser() async {
    try {
      String uid = _auth.currentUser?.uid ?? '';
      print('Authenticated Uid: ' + uid);

      _documentSnapshot = await _firestore.collection('users').doc(uid).get();

      currentUser = _auth.currentUser!;

      return currentUser;
    } catch (e, st) {
      print(e);
      print(st);
      rethrow;
    }
  }

  Future<String?> getCurrentUserName() async {
  try {
    String uid = _auth.currentUser?.uid ?? '';
    _documentSnapshot = await _firestore.collection('users').doc(uid).get();

    if (_documentSnapshot.exists) {
      return _documentSnapshot.data()?['name'];
    } else {
      return null;
    }
  } catch (e, st) {
    print(e);
    print(st);
    rethrow;
  }
}


  Future<DocumentSnapshot<Map<String, dynamic>>> getCurrentUserDocument() async {
    try {
      String uid = _auth.currentUser?.uid ?? '';
      return await _firestore.collection('users').doc(uid).get();
    } catch (e, st) {
      print(e);
      print(st);
      rethrow;
    }
  }

  Future<void> signInWithEmail(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e, st) {
      print(e);
      print(st);
      rethrow;
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e, st) {
      print(e);
      print(st);
      rethrow;
    }
  }

  void _openHomePage(BuildContext context) {
    MaterialPageRoute pageRoute = MaterialPageRoute(
      builder: (context) => ChangeNotifierProvider(
        create: (context) => HomeViewModel(),
        child: PageHome(),
      ),
    );
    Navigator.pushReplacement(context, pageRoute);
  }

  void openLoginPage(BuildContext context) {
    MaterialPageRoute pageRoute = MaterialPageRoute(
      builder: (context) => ChangeNotifierProvider(
        create: (context) => LoginViewModel(),
        child: PageLogin(),
      ),
    );
    Navigator.pushReplacement(context, pageRoute);
  }
}
