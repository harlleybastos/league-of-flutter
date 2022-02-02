import 'package:flutter/material.dart';

class SkinsButtons extends StatelessWidget {
  final Color color;
  String? text;
  IconData? icon;
  final Color backgroundColor;
  final Color borderColor;
  double size;
  bool? isIcon;

  SkinsButtons({
    Key? key,
    this.isIcon = false,
    this.text = 'Hi',
    this.icon,
    required this.color,
    required this.backgroundColor,
    required this.borderColor,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: borderColor,
          width: 1,
        ),
      ),
      child: Center(
        child: isIcon == true
            ? Icon(
                icon,
                color: color,
              )
            : Text(
                text!,
                style: TextStyle(
                  color: color,
                  fontSize: size * 0.4,
                ),
              ),
      ),
    );
  }
}
