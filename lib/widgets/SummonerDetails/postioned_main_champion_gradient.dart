import 'package:flutter/material.dart';

class PositionedMainChampionGradient extends StatelessWidget {
  const PositionedMainChampionGradient({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      top: 50,
      child: Container(
        height: 350,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Color(0xFF040316),
              Colors.transparent,
            ],
          ),
        ),
      ),
    );
  }
}
