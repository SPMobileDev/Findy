import 'package:findy/Feature/Register/screens/persona_info_screen.dart';
import 'package:findy/Feature/Register/widget/appbar_app.dart';
import 'package:findy/Feature/Register/widget/route_page.dart';
import 'package:flutter/material.dart';
import 'package:findy/Feature/Register/widget/buttom_app.dart';
import 'package:findy/Feature/Register/widget/button_app.dart';

import '../../../Ui/utils/app_colors.dart';
import '../../Login/screens/login_screen.dart';

class OTPVerifyScreen extends StatefulWidget {
  const OTPVerifyScreen({Key? key}) : super(key: key);

  @override
  _OTPVerifyScreenState createState() => _OTPVerifyScreenState();
}

class _OTPVerifyScreenState extends State<OTPVerifyScreen> {
  TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: const CustomAppBar(customIconData: Icons.arrow_back_ios_rounded),
      body: body(),
      bottomNavigationBar: ButtomApp(
        onPressed: () {
        //        Navigator.of(context).pushReplacement(
        //   MaterialPageRoute(builder: (_) => LoginScreen()),
        // );
          Navigator.pushReplacement(
            context,
            CustomPageRoute(page: const LoginScreen()),
          );
        },
      ),
    );
  }

  Widget body() {
    return Padding(
      padding: const EdgeInsets.only(left: 40,right: 40),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 50, bottom: 20),
                    child: Text(
                      'OTP Verify',
                      style: TextStyle(
                        fontFamily: "NotoSansLao",
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Text(
                    'ລະບົບໄດ້ສົ່ງ OTP ໄປຫາເບີ 20 XXXX XXXX ແລ້ວ',
                       textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "NotoSansLao",
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: AppColors.greyColor,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, ),
                    child: TextFormField(
                      controller: otpController,
                      keyboardType: TextInputType.phone,
                      onChanged: (value) {},
                      decoration: const InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: AppColors.greyColor),
                        ),
                        hintText:
                            'ປ້ອນລະຫັດ OTP 6 ຕົວເລກ', // Optional: You can add a hint text
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, ),
              child: ButtonAppNext(
                onPressed: () {
                  Navigator.push(
                    context,
                    CustomPageRoute(page: const PersonaInfoScreen()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
