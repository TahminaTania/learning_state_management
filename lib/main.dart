import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_sm/counter/cubit/counter_cubit.dart';
import 'package:learning_sm/log_in/cubit/login_cubit.dart';
import 'package:learning_sm/log_in/home_page.dart';
import 'package:learning_sm/log_in/log_in_page.dart';
//import 'package:learning_sm/pages/home_page.dart';

void main() {
  runApp(MyApp());
}

//-------------- changing Counter Value
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: Scaffold(
//           body: BlocProvider(
//         create: (context) => CounterCubit(),
//         child: HomePage(),
//       )),
//     );
//   }
// }

//--------------- logging in and showing value after logged in
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: MaterialApp(
        title: 'BLoC Cubit Login Example',
        home: LoginPage(),
        routes: {
          '/home': (context) => HomePage(),
        },
      ),
    );
  }
}
