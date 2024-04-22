import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:koupet/view/adoption/adoption_page.dart';
import 'package:koupet/view/component/card_widget.dart';
import 'package:koupet/view/donat/donat_page.dart';
import 'package:koupet/view/video/video_page.dart';
import 'package:koupet/view_model/adoption_page_view_model.dart';
import 'package:koupet/view_model/donat_view_model.dart';
import 'package:koupet/view_model/education_view_model.dart';

class HomeViewModel with ChangeNotifier {
  List<CustomCard> customCards = [];

  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  set currentIndex(int value) {
    _currentIndex = value;
    notifyListeners();
  }

  void openOwnPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ChangeNotifierProvider(
        create: (BuildContext context) => AdoptionPageViewModel("Sahiplendirme"),
        child: AdoptionPage(),
        ),
      ),
    );
  }

  void openLostPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ChangeNotifierProvider(
        create: (BuildContext context) => AdoptionPageViewModel("Kayıp"),
        child: AdoptionPage(),
        ),
      ),
    );
  }

  void openDonatPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ChangeNotifierProvider(
          create: (BuildContext context) => DonatViewModel(),
          child: DonationPage(),
        ),
      ),
    );
  }

  void openEducationVideoPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ChangeNotifierProvider(
          create: (BuildContext context) => EducationViewModel(),
          child: PageEducationVideo(),
        ),
      ),
    );
  }
}
