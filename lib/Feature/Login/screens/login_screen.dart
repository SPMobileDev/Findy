import 'dart:io';

import 'package:findy/Feature/Register/screens/register_screen.dart';
import 'package:findy/Feature/Register/widget/appbar_app.dart';
import 'package:findy/Feature/Register/widget/buttom_app.dart';
import 'package:findy/Feature/Register/widget/button_app.dart';
import 'package:flutter/material.dart';

import '../../Register/screens/otp_verify_screen.dart';
import '../../Register/widget/route_page.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController pwController = TextEditingController();
  bool pwobscureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppBar(
          onLeadingPressed: () {
            exit(0);
          },
        ),
        body: body(),
        bottomNavigationBar: ButtomApp(
          textleft: "ບໍມີບັນຊີ",
          textright: "ລົງທະບຽນ",
          onPressed: () {
            Navigator.push(
              context,
              CustomPageRoute(page: const RegisterScreen()),
            );
          },
        ));
  }

  Widget body() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Center(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 50, bottom: 20),
                  child: Text(
                    'ເຂົ້າສູ່ລະບົບ',
                    style: TextStyle(
                      fontFamily: "NotoSansLao",
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Text(
                  'ປ້ອນເບີໂທ ແລະ ລະຫັດຜ່ານເພື່ອເຂົ້າໃຊ້ງານ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: "NotoSansLao",
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Colors.grey),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50, left: 40, right: 40),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: phoneNumberController,
                        keyboardType: TextInputType.phone,
                        onChanged: (value) {},
                        decoration: const InputDecoration(
                          prefixIcon: Padding(
                            padding:
                                EdgeInsets.only(left: 8.0, right: 8.0, top: 12),
                            child: Text('+85620',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold)),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.brown),
                          ),
                          hintText:
                              'XXXX XXXX', // Optional: You can add a hint text
                        ),
                      ),
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
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 50, left: 40, right: 40, bottom: 50),
            child: ButtonAppNext(
              onPressed: () {
                // Navigator.pushNamed(context, '/oTPVerifyScreen');
                Navigator.push(
                  context,
                  CustomPageRoute(page: OTPVerifyScreen()),
                );
              },
            ),
          ),
          Text(
            'ລືມລະຫັດຜ່ານ',
            style: TextStyle(
              fontFamily: "NotoSansLao",
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(21, 90, 168, 1),
            ),
          ),
        ],
      ),
    );
  }
}
