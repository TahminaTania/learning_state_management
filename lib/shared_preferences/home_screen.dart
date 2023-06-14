import 'package:flutter/material.dart';
import 'package:learning_sm/shared_preferences/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    return Container(
        child: Column(
      children: [
        Text("Home Page"),
        ElevatedButton(
            onPressed: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.setBool(SplashScreenState.KeyLogin, false);
              Navigator.pushNamed(context, '/login');
            },
            child: Text("Log Out, ${arguments["user"]}")),
      ],
    ));
  }
}
