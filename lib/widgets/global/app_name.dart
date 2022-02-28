import 'package:flutter/material.dart';

class AppName extends StatelessWidget {
  const AppName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Container(
        width: 250,
        child: const Text(
          'Welcome to League Of Flutter',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w600,
            color: Color(0xFFc4f1fc),
            fontFamily: 'AvantGarde',
          ),
        ),
      ),
    );
  }
}
