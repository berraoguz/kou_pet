import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:koupet/view/chatRepo/dm_page.dart';
import 'package:koupet/view/adoption/adoption_page.dart';
import 'package:koupet/view/donat/donat_page.dart';
import 'package:koupet/view/login/login_page.dart';
import 'package:koupet/view/petShop/petshop_page.dart';
import 'package:koupet/view/video/video_page.dart';
import 'package:koupet/view_model/adoption_page_view_model.dart';

class CompDrawer extends StatefulWidget {
  const CompDrawer({super.key, required});

  @override
  State<CompDrawer> createState() => _ComtDrawerState();
}

class _ComtDrawerState extends State<CompDrawer> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Anasayfa',
      style: optionStyle,
    ),
    Text(
      'Sahipler',
      style: optionStyle,
    ),
    Text(
      'Kayıp',
      style: optionStyle,
    ),
    Text(
      'Bagış/Petşop',
      style: optionStyle,
    ),
    Text(
      'Eğitim',
      style: optionStyle,
    ),
    Text(
      'Videolar',
      style: optionStyle,
    ),
    Text(
      'Çıkış',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      padding: EdgeInsets.zero,
      children: [
        const DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Color.fromARGB(255, 245, 226, 233),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                ],
              ),
            ],
          ),
        ),
        ListTile(
          leading: const Icon(Icons.card_giftcard),
          title: const Text('Sahipler'),
          selected: _selectedIndex == 0,
          onTap: () {
            _onItemTapped(0);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChangeNotifierProvider(
                  create: (BuildContext context) =>
                      AdoptionPageViewModel("Sahiplendirme"),
                  child: AdoptionPage(),
                ),
              ),
            );
          },
        ),
        GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AdoptionPage(),
            ),
          ),
          child: ListTile(
            leading: const Icon(Icons.featured_play_list),
            title: const Text('Kayıp'),
            selected: _selectedIndex == 1,
            onTap: () {
              _onItemTapped(1);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChangeNotifierProvider(
                    create: (BuildContext context) =>
                        AdoptionPageViewModel("Kayıp"),
                    child: AdoptionPage(),
                  ),
                ),
              );
            },
          ),
        ),
        GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PageShopping(),
            ),
          ),
          child: ListTile(
            leading: const Icon(Icons.add_shopping_cart),
            title: const Text('Petshop'),
            selected: _selectedIndex == 2,
            onTap: () {
              _onItemTapped(2);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PageShopping(), 
                ),
              );
            },
          ),
        ),
        ListTile(
          leading: const Icon(Icons.shopping_cart),
          title: const Text('Bağış'),
          selected: _selectedIndex == 3,
          onTap: () {
            _onItemTapped(3);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DonationPage(), 
              ),
            );
          },
        ),
        ListTile(
          leading: const Icon(Icons.ondemand_video),
          title: const Text('Videolar'),
          selected: _selectedIndex == 4,
          onTap: () {
            _onItemTapped(4);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    PageEducationVideo(),
              ),
            );
          },
        ),
        ListTile(
          leading: const Icon(Icons.subtitles),
          title: const Text('Hakkımızda '),
          selected: _selectedIndex == 5,
          onTap: () {
            _onItemTapped(5);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DMPage(),
              ),
            );
          },
        ),
        ListTile(
          leading: const Icon(Icons.input),
          title: const Text('Çıkış '),
          selected: _selectedIndex == 6,
          onTap: () {
            _onItemTapped(6);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PageLogin(), 
              ),
            );
          },
        ),
      ],
    ));
  }
}
