import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_sm/counter/cubit/counter_cubit.dart';

class ChildPage extends StatelessWidget {
  const ChildPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: BlocBuilder<CounterCubit, CounterState>(
        builder: (context, state) {
          return Text('${state.count}');
        },
      ),
    );
  }
}
