import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final IconData customIconData; // New parameter for the custom icon
  final Color backgroundColor;
  final Color iconColor;
  final void Function()? onLeadingPressed;

  const CustomAppBar({super.key, 
    this.title = "",
    this.customIconData = Icons.close, // Default to Icons.close if not provided
    this.backgroundColor = Colors.white,
    this.iconColor = Colors.black,
    this.onLeadingPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(
          customIconData, // Use the custom icon provided
        ),
        onPressed: onLeadingPressed ?? () => Navigator.pop(context),
      ),
      iconTheme: IconThemeData(color: iconColor),
      backgroundColor: backgroundColor,
      title: Text(
        title,
        style: TextStyle(
          fontFamily: "NotoSansLao",
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: iconColor,
        ),
      ),
      centerTitle: true,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      elevation: 0.0,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
