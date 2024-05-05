import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColor {
  static ColorScheme colorScheme = ColorScheme.fromSeed(
      seedColor: Colors.purple,
      primary: const Color(0xFF9833FF),
      secondary: const Color(0xFF00D29B),
      background: const Color(0xFFFFFFFF));
  static final Color textColor = Color(0xFF222222);
  static final Color textColorDark = Color(0xFFFFFFFF);
  static final Color boxColor = Color(0xFF0E0B93);
  static final Color favoriteButtonColor = Color(0xFFFE4657);
  static final Color backgroundDark = Color(0xFF333333);

  static poppinsTextTheme() {}
}

class ConstantsColor {
  static const bottomNavColor = Color(0xff008B45);
  static const bodyColor = const Color(0xffd9f0fd);
  static const lightGreyColor = const Color(0xfff5f5f5);
  static const purpleColor = const Color(0xff008B45);
  static const lightGreenColor = const Color(0xff32cd32);
  static const greenColor = const Color(0xffe5fbec);
  static const orangeColor = const Color(0xfffcf1d5);
  static const lightorangeColor = const Color(0xfffef9ef);
  static const lightGreennnColor = const Color(0xff4ba123);
  static const lightGreennColor = const Color(0xff00FF7F);
  //static const redColor = const Color(0xffee6463);
  static const blueColor = const Color(0xff2477fd);
  static const lightGreennnnColor = const Color(0xff32cd32);
}

class ConstantsAdress {
  static const String sampleLottieUrl =
      "https://assets6.lottiefiles.com/packages/lf20_8Psf5B.json";
  static const String sampleLottieWelcomeUrl =
      'https://assets5.lottiefiles.com/packages/lf20_qnqidn8g.json';
static const String splash_animation = 'assets/splash_animation.json';
static const String donate_animation = 'assets/donate_animationn.json';

  static const String avatarImage =
      'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1000&q=80';
  static const String avatarImage2 =
      "https://images.squarespace-cdn.com/content/v1/592577372e69cfb16c774206/1573029252375-C3MJ8SIDXA38H7GYVUEP/ico_pro-01.png";
  static const String avatarImage3 =
      "https://images.unsplash.com/photo-1589156288859-f0cb0d82b065?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NTh8fHBlb3BsZXxlbnwwfHwwfHw%3D&w=1000&q=80";

  //LOGİN
  static const String login = "Giriş Yap";
  static const String forgotPassword = "Şifremi Unuttum";
  static const String dontAccount = "Hesabınız yok mu?";
  static const String haveAccount = "Hesabınız zaten var mı?";
  static const String register = "Kayıt ol";
  static const String email = "E-mail";
  static const String password = "Şifre";
  static const String name = "İsim";
  static const String surname = "Soy isim";
  //REGİSTER
  static const String createAccount = "Hesap Oluşturun";
  //HOME
  static const String own = "Sahiplen";
  static const String lost = "Kayıp";
  static const String shop = "Bağış & Shop";
  static const String education= "Eğitim Videoları";







}

TextTheme textTheme = TextTheme(
  headline1: GoogleFonts.outfit(
      fontSize: 107, fontWeight: FontWeight.w300, letterSpacing: -1.5),
  headline2: GoogleFonts.outfit(
      fontSize: 67, fontWeight: FontWeight.w300, letterSpacing: -0.5),
  headline3: GoogleFonts.outfit(fontSize: 54, fontWeight: FontWeight.bold),
  headline4: GoogleFonts.outfit(
      fontSize: 38, fontWeight: FontWeight.w400, letterSpacing: 0.25),
  headline5: GoogleFonts.outfit(fontSize: 27, fontWeight: FontWeight.w400),
  headline6: GoogleFonts.outfit(
      fontSize: 22, fontWeight: FontWeight.w500, letterSpacing: 0.15),
  subtitle1: GoogleFonts.outfit(
      fontSize: 18, fontWeight: FontWeight.w400, letterSpacing: 0.15),
  subtitle2: GoogleFonts.outfit(
      fontSize: 16, fontWeight: FontWeight.w500, letterSpacing: 0.1),
  bodyText1: GoogleFonts.outfit(
      fontSize: 18, fontWeight: FontWeight.w400, letterSpacing: 0.5),
  bodyText2: GoogleFonts.outfit(
      fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.25),
  button: GoogleFonts.outfit(
      fontSize: 16, fontWeight: FontWeight.w500, letterSpacing: 1.25),
  caption: GoogleFonts.outfit(
      fontSize: 13, fontWeight: FontWeight.w400, letterSpacing: 0.4),
  overline: GoogleFonts.outfit(
      fontSize: 11, fontWeight: FontWeight.w400, letterSpacing: 1.5),
);
