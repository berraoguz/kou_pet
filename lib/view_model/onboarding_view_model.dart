import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:koupet/view/login/login_page.dart';
import 'package:koupet/view_model/login_view_model.dart';

class OnBoardingViewModel with ChangeNotifier {
  late PageController pageController;
  int pageIndex = 0;
  int selectedPageIndex = 0; 

  OnBoardingViewModel() {
    getPage();
  }

  void getPage() {
    pageController = PageController(initialPage: 0);
    notifyListeners();
  }

  void updateSelectedPageIndex(int index) {
    selectedPageIndex = index;
    notifyListeners();
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

