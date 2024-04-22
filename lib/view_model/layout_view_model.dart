import 'package:flutter/material.dart';
import 'package:koupet/view/adoption/adoption_page.dart';
import 'package:koupet/view/home/home_page.dart';
import 'package:koupet/view/petShop/petshop_page.dart';
import 'package:koupet/view/user_profile_adaption/user_profil_page.dart';
import 'package:koupet/view/video/video_page.dart';

class LayoutViewModel with ChangeNotifier {
  int _currentIndex = 0;
  List<Widget> _pages = [
    PageHome(),
    PageShopping(),
    AdoptionPage(),
    PageEducationVideo(),
    PageProfileUser(),
  ];

  int get currentIndex => _currentIndex;

  Widget get currentPage => _pages[_currentIndex];

  void changePage(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
