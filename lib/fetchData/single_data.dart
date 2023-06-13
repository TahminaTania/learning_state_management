import 'package:flutter/material.dart';

class SingleData extends StatelessWidget {
  const SingleData({Key? key, required this.pass}) : super(key: key);
  final pass;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("single page no- ${pass.id}"),
    );
  }
}
