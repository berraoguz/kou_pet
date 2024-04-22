import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:koupet/theme/app_color.dart';
import 'package:koupet/view/component/custom_text_field.dart';
import 'package:koupet/view_model/create_pet_view_model.dart';

const List<String> cityList = <String>['İstanbul', 'İzmir', 'Ankara', 'Mersin'];
const List<String> typeList = <String>['Kedi', 'Köpek'];

class AddPetPage extends StatefulWidget {
  AddPetPage({Key? key}) : super(key: key);

  @override
  _AddPetPageState createState() => _AddPetPageState();
}

class _AddPetPageState extends State<AddPetPage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _vaccineController = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  String dropdownCityValue = cityList.first;
  String dropdownTypeValue = typeList.first;
  bool isMale = false;
  bool isFemale = false;
  bool isLost = false;
  bool isAdoption = false;
  int age = 0;
  int weight = 0;
  DateTime? _selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext builder) {
        return Container(
          height: MediaQuery.of(context).copyWith().size.height / 3,
          child: CupertinoDatePicker(
            initialDateTime: DateTime.now(),
            onDateTimeChanged: (DateTime newDateTime) {
              setState(() {
                _selectedDate = newDateTime;
                _dateController.text =
                    "${newDateTime.day}/${newDateTime.month}/${newDateTime.year}";
              });
            },
            mode: CupertinoDatePickerMode.date,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "İlan Oluştur",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  _buildImage(),
                  SizedBox(height: 16),
                  Card(
                    
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [

                          CompCustomTextField(obscureText: false,
                          controller: _nameController,hintText: "İsim",
                          ),
                          SizedBox(height: 16),
                          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              _buildTypeDropdown(),
                               SizedBox(width: 50,),
                              _buildCityDropdown(),
                            ],
                          ),
                          SizedBox(height: 16),
                          _buildGenderCheckbox(),
                           SizedBox(height: 16),
                          _buildAge(),
                          SizedBox(height: 16),
                          _buildWeight(),
                          SizedBox(height: 16),
                            CompCustomTextField(obscureText: false,
                          controller: _vaccineController,hintText: "Aşı",
                          ),
                          SizedBox(height: 16),
                          
                         
                          _buildImageReasonCheckBox(),
                          SizedBox(height: 16),
                          _buildDateTextField()
                        ],
                      ),
                    ),
                  )
                ],
              ),
              _buildAddPetButton(context),
            ],
          ),
        ),
      ),
    );
  }

 
  Widget _buildVaccineTextField() {
    return TextField(
      controller: _vaccineController,
      decoration: InputDecoration(labelText: 'Aşı'),
    );
  }

  Widget _buildDateTextField() {
    return TextField(
      controller: _dateController,
      readOnly: true,
      onTap: () => _selectDate(context),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
            width: 1.0,
          ),
        ),
        suffixIcon: Icon(Icons.calendar_today),
      ),
    );
  }

  Widget _buildGenderCheckbox() {
    return Row(
      children: [
        Checkbox(
          value: isMale,
          onChanged: (value) {
            setState(() {
              isMale = value!;
              if (isMale) {
                isFemale = false;
              }
            });
          },
        ),
        Text('Erkek'),
        SizedBox(width: 20),
        Checkbox(
          value: isFemale,
          onChanged: (value) {
            setState(() {
              isFemale = value!;
              if (isFemale) {
                isMale = false;
              }
            });
          },
        ),
        Text('Dişi'),
      ],
    );
  }

  Widget _buildCityDropdown() {
    return DropdownButton<String>(
      value: dropdownCityValue,
      icon: const Icon(Icons.arrow_drop_down),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? value) {
        setState(() {
          dropdownCityValue = value!;
        });
      },
      items: cityList.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  Widget _buildTypeDropdown() {
    return DropdownButton<String>(
      value: dropdownTypeValue,
      icon: const Icon(Icons.arrow_drop_down),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? value) {
        setState(() {
          dropdownTypeValue = value!;
        });
      },
      items: typeList.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  Widget _buildImagePicker(BuildContext context) {
    CreatePetViewModel viewModel = Provider.of(context, listen: false);
    return GestureDetector(
      onTap: () {
        viewModel.pickImage(_nameController.text.trim());
      },
      child: CircleAvatar(backgroundColor: Colors.blue, child: Icon(Icons.add)),
    );
  }

  ImageProvider _selectedImage(BuildContext context) {
    CreatePetViewModel viewModel = Provider.of<CreatePetViewModel>(context);
    String? image = viewModel.imageUrl;
    if (image != null) {
      return NetworkImage(image);
    } else {
      return AssetImage('assets/cat.jpg');
    }
  }

  Widget _buildImage() {
    return Stack(
      children: [
        CircleAvatar(
          radius: 50,
          backgroundImage: _selectedImage(context),
        ),
        _buildImagePicker(context),
      ],
    );
  }

  Widget _buildAge() {
    return Row(
      children: [
        Text('Yaş: $age'),
        SizedBox(width: 10),
        IconButton(
          icon: Icon(Icons.remove),
          onPressed: () {
            setState(() {
              if (age > 0) {
                age--;
              }
            });
          },
        ),
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () {
            setState(() {
              age++;
            });
          },
        ),
      ],
    );
  }

  Widget _buildWeight() {
    return Row(
      children: [
        Text('Kilo: $weight'),
        SizedBox(width: 10),
        IconButton(
          icon: Icon(Icons.remove),
          onPressed: () {
            setState(() {
              if (weight > 0) {
                weight--;
              }
            });
          },
        ),
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () {
            setState(() {
              weight++;
            });
          },
        ),
      ],
    );
  }

  Widget _buildImageReasonCheckBox() {
    return Row(
      children: [
        Checkbox(
          value: isLost,
          onChanged: (value) {
            setState(() {
              isLost = value!;
              if (isLost) {
                isAdoption = false;
              }
            });
          },
        ),
        Text('Kayıp'),
        SizedBox(width: 20),
        Checkbox(
          value: isAdoption,
          onChanged: (value) {
            setState(() {
              isAdoption = value!;
              if (isAdoption) {
                isLost = false;
              }
            });
          },
        ),
        Text('Sahiplendirme'),
      ],
    );
  }

  Widget _buildAddPetButton(BuildContext context) {
    CreatePetViewModel viewModel = Provider.of(
      context,
      listen: false,
    );
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.purple,
      ),
      onPressed: () {
        viewModel.addPet(
          context,
          _nameController.text.trim(),
          dropdownTypeValue,
          isMale ? 'Erkek' : 'Dişi',
          age,
          weight,
          _vaccineController.text.trim(),
          isLost ? 'Kayıp' : 'Sahiplendirme',
          dropdownCityValue,
          _dateController.text.trim(),
        );
      },
      child: Text(
        "Add Pet",
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
