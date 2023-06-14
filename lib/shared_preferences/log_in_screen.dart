import 'package:flutter/material.dart';
import 'package:learning_sm/shared_preferences/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogInScreen extends StatelessWidget {
  LogInScreen({Key? key}) : super(key: key);
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('keep user logged in with shared preferences'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () async {
                final email = _emailController.text;
                final password = _passwordController.text;
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.setBool(SplashScreenState.KeyLogin, true);

                Navigator.pushNamed(
                  context as BuildContext,
                  '/home',
                  arguments: {'user': email},
                );
              },
              child: Text('Login'),
            ),
            SizedBox(height: 16.0),
          ],
        ),
      ),
    );
    ;
  }
}
