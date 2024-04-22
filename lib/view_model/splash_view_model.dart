import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:koupet/view/layout_page/layout_page.dart';
import 'package:koupet/view/onboarding/onboarding_page.dart';
import 'package:koupet/view_model/layout_view_model.dart';
import 'package:koupet/view_model/onboarding_view_model.dart';

class SplashViewModel with ChangeNotifier {

void getSplash(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () async {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider(
              create: (BuildContext context) =>LayoutViewModel(),
              child: HomeLayoutPage(),
            ),
          ),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider(
              create: (BuildContext context) => OnBoardingViewModel(),
              child: OnBoardingPage(),
            ),
          ),
        );
      }
    });
  }
}