import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:koupet/view/chatRepo/dm_page.dart';
import 'package:koupet/theme/app_color.dart';
import 'package:koupet/view/addPet/create_pet.dart';
import 'package:koupet/view/donat/donat_page.dart';
import 'package:koupet/view/home/home_page.dart';
import 'package:koupet/view/user_profile_adaption/user_profil_page.dart';
import 'package:koupet/view_model/create_pet_view_model.dart';
import 'package:koupet/view_model/education_view_model.dart';
import 'package:koupet/view_model/home_view_model.dart';
import 'package:koupet/view_model/layout_view_model.dart';
import 'package:koupet/view_model/own_view_model.dart';
import '../chatRepo/services/chat/chat_service.dart';

class HomeLayoutPage extends StatelessWidget {
  const HomeLayoutPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeViewModel()),
        ChangeNotifierProvider(create: (context) => OwnViewModel()),
        ChangeNotifierProvider(create: (context) =>ChatService()),
        ChangeNotifierProvider(create: (context) => EducationViewModel()),
     
      ],
      child: Scaffold(
        body: Consumer<LayoutViewModel>(
          builder: (context, provider, child) {
            return _buildPage(provider.currentIndex);
          },
        ),
        bottomNavigationBar: Consumer<LayoutViewModel>(
          builder: (context, provider, child) {
            return BottomNavigationBar(
              currentIndex: provider.currentIndex,
              onTap: (index) {
                provider.changePage(index);
              },
              items: const [
                BottomNavigationBarItem(
                  backgroundColor: ConstantsColor.bottomNavColor,
                  icon: Icon(Icons.home),
                  label: 'Ana Sayfa',
                ),
                BottomNavigationBarItem(
                  backgroundColor: ConstantsColor.bottomNavColor,
                  icon: Icon(Icons.shopping_bag),
                  label: 'Shop',
                ),
  
                BottomNavigationBarItem(
                  backgroundColor: ConstantsColor.bottomNavColor,
                  icon: Icon(Icons.message),
                  label: 'Mesaj',
                ),
                BottomNavigationBarItem(
                  backgroundColor: ConstantsColor.bottomNavColor,
                  icon: Icon(Icons.person),
                  label: 'Profil',
                ),
              ],
              backgroundColor: ConstantsColor.bottomNavColor,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.grey,
            );
          },
        ),
      ),
    );
  }

  Widget _buildPage(int index) {
    switch (index) {
      case 0:
        return Center(child: PageHome());
      case 1:
        return Center(child: DonationPage());
      case 2:
        return Center(child: DMPage());
      case 3:
         return Center(child: PageProfileUser());
      default:
        return Container();
    }
  }
}
