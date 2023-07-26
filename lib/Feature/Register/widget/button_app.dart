import 'package:flutter/material.dart';

class ButtonAppNext extends StatelessWidget {
  ButtonAppNext({
    Key? key,
    required this.onPressed,
    this.fontsize = 16,
    this.height = 40,
    this.width = double.infinity,
    this.colorBackground = const Color.fromRGBO(
            21, 90, 168, 1),
    this.text = 'ຕໍ່ໄປ',
  }) : super(key: key);

 
  final Function()? onPressed;
  final String text;
  final double fontsize;
  final double width;
  final double height;
  final Color colorBackground;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: colorBackground, // Set the background color of the button
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5), // Button border radius
        ),
      ),
      child: Container(
        width: width,
        height: height,
        padding: EdgeInsets.all(8.0),
        child:  Center(
          child: Text(
            text,
            style: TextStyle(
              fontFamily: "NotoSansLao",
              fontSize: fontsize,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
