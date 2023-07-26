import 'package:findy/App/appversion.dart';
import 'package:findy/Feature/Register/screens/persona_info_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:findy/App/splash_screen.dart';
import 'package:findy/Feature/Login/screens/login_screen.dart';
import 'package:findy/Feature/Register/screens/register_screen.dart';
import 'package:findy/Feature/Register/screens/otp_verify_screen.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppVersion()),
        
      ],
      child: MaterialApp(
        title: 'Findy app',
        debugShowCheckedModeBanner: false,
        initialRoute: "/", // Set the initial route
        routes: {
          // Define named routes and their corresponding screen classes
          '/': (context) => SplashScreen(),
          '/loginScreen': (context) => const LoginScreen(),
          '/registerScreen': (context) => const RegisterScreen(),
          '/oTPVerifyScreen': (context) => const OTPVerifyScreen(),
          '/personaInfoScreen': (context) => const PersonaInfoScreen(),
        },
      ),
    );
  }
}
