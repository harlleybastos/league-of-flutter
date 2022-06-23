import 'package:flutter/material.dart';

class SecondCardText extends StatelessWidget {
  const SecondCardText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.47,
      bottom: 0,
      left: MediaQuery.of(context).size.width * 0.25,
      child: Container(
        color: Colors.transparent,
        width: MediaQuery.of(context).size.width,
        child: Text(
          'Last Matches'.toUpperCase(),
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
