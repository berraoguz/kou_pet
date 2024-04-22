import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:koupet/view/layout_page/layout_page.dart';
import 'package:koupet/view/register/register_page.dart';
import 'package:koupet/view_model/layout_view_model.dart';
import 'package:koupet/view_model/register_view_model.dart';

class LoginViewModel with ChangeNotifier{

  FirebaseAuth _auth = FirebaseAuth.instance;
  void login(BuildContext context, String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      print(_auth.currentUser != null);
      _showSnackbar(context, "Login successful");
      _openHomePage(context);
    } on FirebaseAuthException catch (e) {
      String errorMessage = "Login failed. Error: ";
      if (e.code == 'user-not-found') {
        errorMessage += "User not found.";
      } else if (e.code == 'wrong-password') {
        errorMessage += "Invalid password.";
      } else {
        errorMessage += e.message ?? "Unknown error";
      }

      _showSnackbar(context, errorMessage);
      print(e);
    }
  }

  void forgotPassword(BuildContext context) async {

    _auth.sendPasswordResetEmail(email: "hilalbyk396@gmail.com");
  }


  void openRegisterPage(BuildContext context) {
    MaterialPageRoute pageRoute = MaterialPageRoute(
      builder: (context) => ChangeNotifierProvider(
        create: (context) => RegisterViewModel(),
        child: PageRegister(),
      ),
    );
    Navigator.pushReplacement(context, pageRoute);
  }

  void _openHomePage(BuildContext context) {
    MaterialPageRoute pageRoute = MaterialPageRoute(
      builder: (context) => ChangeNotifierProvider(
        create: (context) => LayoutViewModel(),
        child: HomeLayoutPage(),
      ),
    );
    Navigator.pushReplacement(context, pageRoute);
  }

   void _showSnackbar(BuildContext context, String message) {
    SnackBar snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    print(message);
  }
}