import 'package:flutter/material.dart';

class FirstCardText extends StatelessWidget {
  const FirstCardText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.13,
      bottom: 0,
      left: MediaQuery.of(context).size.width * 0.23,
      child: Container(
        color: Colors.transparent,
        width: MediaQuery.of(context).size.width,
        child: Text(
          'Main Chamption'.toUpperCase(),
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
