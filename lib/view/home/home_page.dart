import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:koupet/theme/app_color.dart';

import 'package:koupet/view/adoption/adoption_page.dart';
import 'package:koupet/view/component/card_widget.dart';
import 'package:koupet/view/component/drawer.dart';
import 'package:koupet/view_model/home_view_model.dart';
import 'package:koupet/view_model/profile_page_view_model.dart';

class PageHome extends StatelessWidget {
  const PageHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double navBarHeight = 80.0;
    final double navBarWidth = MediaQuery.of(context).size.width * 0.8;

    return ChangeNotifierProvider(
      create: (BuildContext context) => ProfilePageViewModel("Sahiplendirme", FirebaseAuth.instance.currentUser!.uid),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
        ),
        drawer: CompDrawer(),
        backgroundColor: Colors.white,
        //bottomNavigationBar: buildBottomNavigationBar(navBarHeight, navBarWidth),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AdoptionPage(), //PageProfileUser(),
                  ),
                ),
                child: buildHeaderItems(
                  context,
                  ConstantsAdress.avatarImage2,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: buildCardPano(),
            ),
            buildTitleDepartmants(context),
            Expanded(
              flex: 6,
              child: Consumer<HomeViewModel>(
                builder: (context, viewModel, child) {return buildCardItem(context, viewModel.customCards);},
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding buildCardItem(BuildContext context, List<CustomCard> customCards) {
      HomeViewModel viewModel = Provider.of<HomeViewModel>(context, listen: false);
      List<Widget> allCards = [
        CustomCard(
          icon: "👨‍🎨",
          title: ConstantsAdress.own,
          subtitle: '',
          backgroundColor: ConstantsColor.lightGreenColor,
          onPressed: () {
            viewModel.openOwnPage(context);
          },
        ),
        CustomCard(
          icon: "👨‍🎨",
          title: 'Kayıp',
          subtitle: '',
          backgroundColor: ConstantsColor.lightGreennColor,
          onPressed: () {
            viewModel.openLostPage(context);
          },
        ),

        CustomCard(
          icon: "🙅‍♂️",
          title: 'Bağış & Shop',
          subtitle: '',
          backgroundColor: ConstantsColor.lightGreennColor,
          onPressed: () {
            viewModel.openDonatPage(context);
          },
        ),
        CustomCard(
          icon: "🙅‍♂️",
          title: 'Eğitim Videoları',
          subtitle: '',
          backgroundColor: ConstantsColor.lightGreennnnColor,
          onPressed: () {
            viewModel.openEducationVideoPage(context);
          },
        ),
    ];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
        ),
        itemCount: allCards.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: allCards[index],
          );
        },
      ),
    );
  }

  Padding buildTitleDepartmants(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 20, top: 20),
        child: Text(
          'Departmants',
          style: GoogleFonts.outfit(
              textStyle: textTheme.headline6, color: Colors.black),
        ));
  }

  Padding buildHeaderItems(BuildContext context, String avatarImage) {
    return Padding(
      padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FittedBox(
                child: Text(
                  'Merhaba',
                  style: GoogleFonts.outfit(
                      textStyle: textTheme.headline5, color: Colors.black),
                ),
              ),
          
            ],
          ),
          CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(avatarImage),
          ),
        ],
      ),
    );
  }
}

Padding buildBottomNavigationBar(double navBarHeight, double navBarWidth) {
  return Padding(
    padding: const EdgeInsets.all(3.0),
    child: SizedBox(
      height: navBarHeight,
      width: navBarWidth,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: BottomNavigationBar(
          backgroundColor: ConstantsColor.bottomNavColor,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white.withOpacity(0.5),
          currentIndex: 0,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.thumbs_up_down_outlined),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.thumbs_up_down_outlined),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: "",
            ),
          ],
        ),
      ),
    ),
  );
}

Padding buildCardPano() {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 20),
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 2,
      itemBuilder: (BuildContext context, int index) {
        return buildImageCard(index);
      },
    ),
  );
}


Card buildImageCard(int index) {
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    child: Container(
      width: 250,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage(index == 0
                  ? 'assets/bg-2.jpeg' // İlk resmin dosya yolu
                  : 'assets/bg-1.jpeg' // İkinci resmin dosya yolu
              ),
          fit: BoxFit.fill,
        ),
      ),
    ),
  );
}

