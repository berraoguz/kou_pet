import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:koupet/view/profile_adaption/profile_adaption.dart';
import 'package:koupet/view/adoption/adoption_page.dart';
import 'package:koupet/view/component/drawer.dart';
import 'package:koupet/view_model/adoption_page_view_model.dart';
import 'package:koupet/view_model/profile_page_view_model.dart';
import 'package:koupet/view_model/register_view_model.dart';

class PageProfileUser extends StatelessWidget {
  const PageProfileUser({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RegisterViewModel(),
      child: Consumer<RegisterViewModel>(
        builder: (context, viewmodel, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: DefaultTabController(
              length: 2,
              child: Scaffold(
                appBar: AppBar(
      toolbarHeight: 300,
      title: Padding(
        padding: const EdgeInsets.only(top: 35),
        child: Column(
          children: [

 CircleAvatar(
              backgroundColor: Colors.black,
              radius: 50,
            ),
SizedBox(height: 10),
            FutureBuilder<User?>(
              future: viewmodel.getCurrentUser(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (!snapshot.hasData || snapshot.data == null) {
                  return Text('User not found');
                } else {

                  //String userName = FirebaseAuth.instance.currentUser?.displayName ?? 'N/A';
                  //String userName = snapshot.data!.displayName ?? "N/A";
                  String eMail = snapshot.data!.email ?? 'N/A';
                  return Column(
                    children: [
                      //Text('Soft, $userName'),
                      Text('$eMail'),
                    ],
                  );
                }
              },
            ),



            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(fixedSize: Size(300, 50)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.message),
                  SizedBox(width: 7),
                  Text('Mesaj at'),
                ],
              ),
            )
          ],
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 0, 255, 127),
      bottom: TabBar(
        tabs: const <Widget>[
          Tab(child: Text('İlanlarım')),
          Tab(child: Text('Patilerim')),
        ],
      ),
    ),
                body: TabBarView(
                  children: [
                    ChangeNotifierProvider(
                      create: (BuildContext context) =>
                          ProfilePageViewModel("Sahiplendirme", FirebaseAuth.instance.currentUser!.uid),
                      child: ProfileAdoptionPage(),
                    ),
                    ChangeNotifierProvider(
                      create: (BuildContext context) =>
                          ProfilePageViewModel("Kayıp", FirebaseAuth.instance.currentUser!.uid),
                      child: ProfileAdoptionPage(),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}




//   AppBar _buildAppBar(BuildContext context, ProfileViewModel viewModel) {
//     return AppBar(
//       toolbarHeight: 300,
//       actions: [
//         IconButton(
//           onPressed: () {},
//           icon: Icon(Icons.message),
//         ),
//       ],
//       title: Padding(
//         padding: const EdgeInsets.only(top: 35),
//         child: Column(
//           children: [
//             Text(viewModel.userName ?? ""),
//            // Text('Berra Oğuz'),
//             CircleAvatar(
//               backgroundColor: Colors.black,
//               radius: 50,
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {},
//               style: ElevatedButton.styleFrom(fixedSize: Size(300, 50)),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Icon(Icons.message),
//                   SizedBox(width: 7),
//                   Text('Mesaj at'),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//       backgroundColor: const Color.fromARGB(255, 247, 205, 219),
//       bottom: TabBar(
//         tabs: const <Widget>[
//           Tab(child: Text('İlanlarım')),
//           Tab(child: Text('Patilerim')),
//         ],
//       ),
//     );
//   }
// }
