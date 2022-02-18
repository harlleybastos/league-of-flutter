import 'package:flutter/material.dart';

class ChampionGradientBackground extends StatelessWidget {
  const ChampionGradientBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 30,
      right: 30,
      child: Container(
        height: 180,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Colors.black.withOpacity(0.9),
              Colors.transparent,
            ],
          ),
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.black.withOpacity(0.7),
          //     blurRadius: 20,
          //     offset: Offset(0, 10),
          //   ),
          // ],
        ),
      ),
    );
  }
}
