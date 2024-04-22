import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:koupet/theme/app_color.dart';
import 'package:koupet/view/petProfile/pet_profile_page.dart';
import 'package:koupet/view_model/adoption_page_view_model.dart';

class AdoptionPage extends StatelessWidget {
  const AdoptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    AdoptionPageViewModel viewModel = Provider.of<AdoptionPageViewModel>(
      context,
      listen: false,
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        title: Text(
          "İLANLAR",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add,color: Colors.white,),
        onPressed: () {
          viewModel.openAddPetPage(context);
        },
        backgroundColor: ConstantsColor.bottomNavColor,
      ),
    );
  }

  Widget _buildBody() {
    return Consumer<AdoptionPageViewModel>(
      builder: (context, viewModel, child) => viewModel.type == 'Sahiplendirme'
          ? ListView.builder(
              itemCount: viewModel.pets.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  color: Color.fromARGB(255, 255, 255, 255),
                  child: _buildListTile(index),
                );
              },
            )
          : GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              itemCount: viewModel.pets.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  color: Color.fromARGB(255, 255, 255, 255),
                  child: _buildGridView(index),
                );
              },
            ),
    );
  }

  Widget _buildListTile(int index) {
    return Consumer<AdoptionPageViewModel>(
      builder: (context, viewModel, child) => GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => PageProfilePet(viewModel.pets[index])),
        ),
        child: Card(
          color: ConstantsColor.lightGreenColor,
          child: ListTile(
            subtitle: Row(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  child: Image.network(viewModel.pets[index].image,fit: BoxFit.fill,),
                ),
                SizedBox(width: 15),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(viewModel.pets[index].name,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 23)),
                    Row(
                      children: [
                        Text(
                          'Tür: ',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          viewModel.pets[index].type,
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'Cinsiyet: ',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          viewModel.pets[index].gender,
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'Tarih: ',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          viewModel.pets[index].date,
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'Şehir: ',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          viewModel.pets[index].city,
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buildGridView(int index) {
  return Consumer<AdoptionPageViewModel>(
    builder: (context, viewModel, child) => GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => PageProfilePet(viewModel.pets[index])),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: ConstantsColor.lightGreennColor
        ),
        child: Column(
        
          children: [
            CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(viewModel.pets[index].image)),
            Text(
              viewModel.pets[index].name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            Row(
              children: [
                Text(
                  'Tür: ',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                Text(
                  viewModel.pets[index].type,
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w400),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  'Cinsiyet: ',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                Text(
                  viewModel.pets[index].gender,
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w400),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  'Tarih: ',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                Text(
                  viewModel.pets[index].date,
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w400),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  'Şehir: ',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                Text(
                  viewModel.pets[index].city,
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
