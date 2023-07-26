import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

import '../../../App/appversion.dart';

class ButtomApp extends StatelessWidget {
  const ButtomApp(
      {super.key,
      this.textleft = "ມີບັນຊີແລ້ວ",
      this.textright = "ເຂົ້າສູ່ລະບົບ",
     required this.onPressed});
  final String textleft;
  final String textright;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    final appVersion = Provider.of<AppVersion>(context).appVersion;
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        height: 90,
        color: Color.fromRGBO(233, 233, 233, 1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  textleft, // Display the app version
                  style: TextStyle(
                    fontFamily: "NotoSansLao",
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  textright, // Display the app version
                  style: TextStyle(
                      fontFamily: "NotoSansLao",
                      fontSize: 16,
                      color: Color.fromRGBO(21, 90, 168, 1),
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'V $appVersion', // Display the app version
              style: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
