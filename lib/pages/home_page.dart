import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_sm/counter/cubit/counter_cubit.dart';
import 'package:learning_sm/pages/child_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final myController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // Start listening to changes.
    myController.addListener(_printLatestValue);
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    // This also removes the _printLatestValue listener.
    myController.dispose();
    super.dispose();
  }

  void _printLatestValue() {
    print('Second text field: ${myController.text}');
  }

  @override
  Widget build(BuildContext context) {
    //final counterCubit = BlocProvider.of<CounterCubit>(context);

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("State Management")),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          BlocBuilder<CounterCubit, CounterState>(
            builder: (context, state) {
              return Text("${state.count}");
            },
          ),
          SizedBox(height: 20),
          Center(
            child: Container(
              color: Colors.amber,
              width: 200,
              child: TextFormField(
                controller: myController,
              ),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                context
                    .read<CounterCubit>()
                    .newValue(myController.text.toString());
              },
              child: Text("press")),
          Container(child: ChildPage())
        ],
      ),
    );
  }
}
