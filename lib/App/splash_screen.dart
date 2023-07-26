import 'dart:async';
import 'package:findy/App/appversion.dart';
import 'package:findy/Feature/Login/screens/login_screen.dart';
import 'package:findy/Feature/Register/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isVisible = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        Provider.of<AppVersion>(context, listen: false).getAppVersion();
      },
    );
    Timer(Duration(seconds: 3), () {
      setState(() {
        _isVisible = true;
      });
      Timer(Duration(seconds: 3), () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => LoginScreen()),
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedOpacity(
          opacity: _isVisible ? 1.0 : 0.0,
          duration: Duration(
              seconds: 3), // Duration for fade-in and fade-out animations
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                'https://seeklogo.com/images/R/rounded-design-company-logo-58FEBA6563-seeklogo.com.png',
                width: 150,
                height: 150,
              ),
              SizedBox(height: 16),
              Text(
                'Findy',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
