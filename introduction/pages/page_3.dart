import 'package:flutter/material.dart';

class Page3 extends StatelessWidget {
  const Page3({Key? key, required this.flag}) : super(key: key);
  final bool flag;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            color: Colors.deepPurple[400],
          ),
        ),
      ),
    );
  }
}
