import 'dart:async';

import 'package:flutter/material.dart';
import 'package:learning_sm/shared_preferences/log_in_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => SplashScreenState();
}

// _SplashScreenState was private so couldn't access KeyLogin from the loginScreen, had to make it public by removing "_" , next time try to take the var globally
class SplashScreenState extends State<SplashScreen> {
  static const String KeyLogin = 'login';
  @override
  void initState() {
    super.initState();
    GoToNextScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text("Splash Screen")),
    );
  }

  void GoToNextScreen() async {
    SharedPreferences isLoggedIn = await SharedPreferences.getInstance();

    var loggedUser = isLoggedIn.getBool(KeyLogin);
    Timer(
      Duration(seconds: 2),
      () {
        if (loggedUser != null) {
          if (loggedUser) {
            Navigator.pushNamed(context as BuildContext, '/home');
          } else {
            Navigator.pushNamed(context as BuildContext, '/login');
          }
        } else {
          Navigator.pushNamed(context as BuildContext, '/login');
        }
      },
    );
  }
}
