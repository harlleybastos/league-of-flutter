import 'package:flutter/material.dart';

class PositionedGnar extends StatelessWidget {
  const PositionedGnar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: MediaQuery.of(context).size.height * 0.01,
      left: MediaQuery.of(context).size.width * 0.15,
      right: MediaQuery.of(context).size.width * 0.15,
      child: Container(
        child: Image.asset(
          'assets/gif/gnar_gif.gif',
        ),
      ),
    );
  }
}
