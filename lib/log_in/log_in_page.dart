import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_sm/log_in/cubit/login_cubit.dart';
import 'package:learning_sm/countPages/child_page.dart';
import 'package:learning_sm/countPages/home_page.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final loginCubit = BlocProvider.of<LoginCubit>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('BLoC Cubit Login Example'),
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
              onPressed: () {
                final email = _emailController.text;
                final password = _passwordController.text;
                loginCubit.login(email, password);
              },
              child: Text('Login'),
            ),
            SizedBox(height: 16.0),
            BlocBuilder<LoginCubit, LoginState>(
              builder: (context, state) {
                if (state is LoginLoading) {
                  return CircularProgressIndicator();
                } else if (state is LoginSuccess) {
                  // Navigate to the HomePage
                  Future.delayed(Duration(seconds: 2), () {
                    Navigator.pushReplacementNamed(context, '/home',
                        arguments: _emailController.text);
                  });

                  return Text('Login successful!');
                } else if (state is LoginError) {
                  return Text(state.errorMessage);
                } else {
                  return Container();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
