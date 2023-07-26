import 'dart:io';
import 'package:findy/Feature/Login/screens/login_screen.dart';
import 'package:findy/Feature/Register/screens/otp_verify_screen.dart';
import 'package:findy/Feature/Register/widget/buttom_app.dart';
import 'package:findy/Feature/Register/widget/route_page.dart';
import 'package:flutter/material.dart';
import '../widget/appbar_app.dart';
import '../widget/button_app.dart'; // Import the package_info library

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController phoneNumberController = TextEditingController();
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
          onPressed: () {
            Navigator.pushReplacement(
              context,
              CustomPageRoute(page: const LoginScreen()),
            );
          },
        ));
  }

  Widget body() {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Row(
          //   children: [
          //     CloseButtonApp(
          //       onPressed: () {},
          //     ),
          //   ],
          // ),
          Center(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 50, bottom: 20),
                  child: Text(
                    'ລົງທະບຽນ',
                    style: TextStyle(
                      fontFamily: "NotoSansLao",
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Text(
                  'ປ້ອນເບີໂທເພື່ອລົງທະບຽນເຂົ້າໃຊ້ງານ',
                     textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: "NotoSansLao",
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Colors.grey),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 40, right: 40),
                  child: TextFormField(
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
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30, left: 40, right: 40),
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
        ],
      ),
    );
  }
}
