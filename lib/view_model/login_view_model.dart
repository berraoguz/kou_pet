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
      _showSnackbar(context, "Giriş başarılı");
      _openHomePage(context);
    } on FirebaseAuthException catch (e) {
      String errorMessage = "Giriş başarısız. Hata: ";
      if (e.code == 'user-not-found') {
        errorMessage += "Kullanıcı bulunamadı.";
      } else if (e.code == 'wrong-password') {
        errorMessage += "Geçersiz şifre.";
      } else {
        errorMessage += e.message ?? "Bilinmeyen hata";
      }

      _showSnackbar(context, errorMessage);
      print(e);
    }
  }

  void forgotPassword(BuildContext context) async {
    // Şifremi unuttum işlevi
    _auth.sendPasswordResetEmail(email: "berraoguz@outlook.com");
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
    // Anasayfaya yönlendirme
    MaterialPageRoute pageRoute = MaterialPageRoute(
      builder: (context) => ChangeNotifierProvider(
        create: (context) => LayoutViewModel(),
        child: HomeLayoutPage(),
      ),
    );
    Navigator.pushReplacement(context, pageRoute);
  }

  void _showSnackbar(BuildContext context, String message) {
    // Snackbar gösterme işlevi
    SnackBar snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    print(message);
  }
}
