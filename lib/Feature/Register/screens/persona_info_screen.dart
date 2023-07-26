import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:findy/Feature/Register/screens/otp_verify_screen.dart';
import 'package:findy/Feature/Register/widget/appbar_app.dart';
import 'package:findy/Feature/Register/widget/button_app.dart';
import 'package:findy/Feature/Register/widget/route_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:intl/intl.dart';

import '../../Login/screens/login_screen.dart';

class PersonaInfoScreen extends StatefulWidget {
  const PersonaInfoScreen({Key? key}) : super(key: key);

  @override
  State<PersonaInfoScreen> createState() => _PersonaInfoScreenState();
}

class _PersonaInfoScreenState extends State<PersonaInfoScreen> {
  PlatformFile? fileimage;
  TextEditingController nameController = TextEditingController();
  TextEditingController brithdayController = TextEditingController();
  TextEditingController villageController = TextEditingController();
  TextEditingController pwController = TextEditingController();
  TextEditingController cpwController = TextEditingController();
  String? _selectedGender;
  bool pwobscureText = true;
  bool cpwobscureText = true;
  String? selectedprovince;
  FilePickerResult? _result;
  bool _showImage = false;
  List<String> province = [
    'ນະຄອນຫຼວງ',
    'ວຽງຈັນ',
    'ຫຼວງພະບາງ',
    'ຊຽງຂວາງ',
    'ຈຳປາສັກ'
  ];
  String? selecteddiscricts;

  List<String> discricts = [
    'ໄຊເສດຖາ',
    'ສີສັດຕະນາກ',
    'ໄຊທານີ',
    'ຫາດຊາຍຟອງ',
    'ສີໂຄດຕະບອງ'
  ];
  // Handle radio button changes.
  void _handleGenderChange(String? value) {
    setState(() {
      _selectedGender = value!;
      print(_selectedGender);
    });
  }



  Future<void> pickImage() async {
    _result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );
    if (_result != null) {
      setState(() {
        _showImage = true;
      });
    } else {
      // User canceled the picker
    }
  }

  void showDateTimePicker(BuildContext context) {
    DatePicker.showDatePicker(
      context,
      showTitleActions: true,
      minTime: DateTime(1950, 1, 1),
      maxTime: DateTime.now(),
      onConfirm: (date) {
        String formattedDate = DateFormat('yyyy-MM-dd').format(date);
        brithdayController.text = formattedDate;
        // This callback will be called when the user confirms their selection.
        // You can do something with the selected date.
        print('Selected date: $date');
      },
      currentTime: DateTime.now(),
      locale: LocaleType.en,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: "ລົງທະບຽນ",
      ),
      body: body(),
    );
  }

  Widget body() {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 50,
          ),
          Center(
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                GestureDetector(
                  onTap: () {
                    pickImage();
                  },
                  child: Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey[300],
                      image: _showImage
                          ? DecorationImage(
                              image:
                                  FileImage(File(_result!.files.single.path!)),
                              fit: BoxFit.cover,
                            )
                          : null,
                    ),
                    child: !_showImage
                        ? const Icon(
                            Icons.person,
                            size: 80,
                            color: Colors.white,
                          )
                        : null,
                  ),
                ),
                Container(
                  width: 40,
                  height: 40,
                  margin: const EdgeInsets.only(top: 30),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: const Icon(
                      Icons.camera_alt_outlined,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      pickImage();
                    },
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 50, left: 40, right: 40, bottom: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'ຂໍ້ມູນສ່ວນຕົວ',
                      style: TextStyle(
                        fontFamily: "NotoSansLao",
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.4),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.person,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 20),
                  child: TextFormField(
                    controller: nameController,
                    onChanged: (value) {},
                    decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.brown),
                      ),
                      hintText: "ຊື່ ແລະ ນາມສະກຸນ",
                      hintStyle: TextStyle(
                        fontFamily: "NotoSansLao",
                      ),
                    ),
                  ),
                ),
                TextFormField(
                  controller: brithdayController,
                  keyboardType: TextInputType.phone,
                  onChanged: (value) {},
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.brown),
                    ),
                    hintText: "ວັນເດືອນປີເກີດ",
                    hintStyle: TextStyle(
                      fontFamily: "NotoSansLao",
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.calendar_month),
                      onPressed: () {
                        showDateTimePicker(context);
                        // Add your calendar icon onPressed functionality here
                        // For example, you can show a date picker or handle the calendar interaction.
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                  ),
                  child: Text(
                    'ເພດ',
                    style: TextStyle(
                      fontFamily: "NotoSansLao",
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Radio(
                          value: 'ຍິງ',
                          groupValue: _selectedGender,
                          onChanged: _handleGenderChange,
                        ),
                        Text(
                          'ຍິງ',
                          style: TextStyle(
                              fontFamily: "NotoSansLao", fontSize: 16),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                          value: 'ຊາຍ',
                          groupValue: _selectedGender,
                          onChanged: _handleGenderChange,
                        ),
                        Text(
                          'ຊາຍ',
                          style: TextStyle(
                              fontFamily: "NotoSansLao", fontSize: 16),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                          value: 'ບໍລະບຸ',
                          groupValue: _selectedGender,
                          onChanged: _handleGenderChange,
                        ),
                        Text(
                          'ບໍລະບຸ',
                          style: TextStyle(
                              fontFamily: "NotoSansLao", fontSize: 16),
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 20),
                  child: Text(
                    'ທີ່ຢູ່ປັດຈຸບັນ',
                    style: TextStyle(
                      fontFamily: "NotoSansLao",
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, bottom: 20),
                  child: Column(
                    children: [
                      Container(
                        width: double
                            .infinity, // Set the width of the dropdown menu
                        child: DropdownButton<String>(
                          isExpanded: true, // Expand the dropdown to full width
                          value: selectedprovince,
                          hint: Text(
                            "ແຂວງ",
                            style: TextStyle(
                                fontFamily: "NotoSansLao", fontSize: 16),
                          ),
                          icon: Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Icon(Icons.expand_more_rounded),
                          ), // Icon on the right side
                          iconSize: 24,
                          elevation: 16,
                          style: TextStyle(color: Colors.black),
                          underline: Container(
                            height: 1,
                            color: Colors.black,
                          ),
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedprovince = newValue;
                            });
                          },
                          items: province
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: TextStyle(
                                    fontFamily: "NotoSansLao", fontSize: 16),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      Container(
                        width: double
                            .infinity, // Set the width of the dropdown menu
                        child: DropdownButton<String>(
                          isExpanded: true, // Expand the dropdown to full width
                          value: selecteddiscricts,
                          hint: Text(
                            "ເມືອງ",
                            style: TextStyle(
                                fontFamily: "NotoSansLao", fontSize: 16),
                          ),
                          icon: Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Icon(Icons.expand_more_rounded),
                          ), // Icon on the right side
                          iconSize: 24,
                          elevation: 16,
                          style: TextStyle(color: Colors.black),
                          underline: Container(
                            height: 1,
                            color: Colors.black,
                          ),
                          onChanged: (String? newValue) {
                            setState(() {
                              selecteddiscricts = newValue;
                            });
                          },
                          items: discricts
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: TextStyle(
                                    fontFamily: "NotoSansLao", fontSize: 16),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      TextFormField(
                        controller: villageController,
                        onChanged: (value) {},
                        decoration: const InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.brown),
                          ),
                          hintText: "ບ້ານ",
                          hintStyle: TextStyle(
                            fontFamily: "NotoSansLao",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'ຂໍ້ມູນເຂົ້າສູ່ລະບົບ',
                        style: TextStyle(
                          fontFamily: "NotoSansLao",
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.4),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Icon(
                          Icons.lock,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'ເບີໂທລະສັບ',
                      style: TextStyle(
                        fontFamily: "NotoSansLao",
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '20 28 442 288',
                      style: TextStyle(
                          fontFamily: "NotoSansLao",
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: pwController,
                        obscureText:
                            pwobscureText, // Set the password visibility
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.brown),
                          ),
                          hintText: 'ລະຫັດຜ່ານ', // Hint text when hinted
                          suffixIcon: IconButton(
                            icon: Icon(
                              pwobscureText
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              setState(() {
                                pwobscureText =
                                    !pwobscureText; // Toggle password visibility
                              });
                            },
                          ),
                        ),
                      ),
                      TextFormField(
                        controller: cpwController,
                        obscureText:
                            cpwobscureText, // Set the password visibility
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.brown),
                          ),
                          hintText: 'ຢືນຢັນລະຫັດຜ່ານ', // Hint text when hinted
                          suffixIcon: IconButton(
                            icon: Icon(
                              cpwobscureText
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              setState(() {
                                cpwobscureText =
                                    !cpwobscureText; // Toggle password visibility
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40, right: 40, bottom: 50),
            child: ButtonAppNext(
              onPressed: () {
                // Navigator.pushNamed(context, '/oTPVerifyScreen');
                Navigator.pushReplacement(
                  context,
                  CustomPageRoute(page: const LoginScreen()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
