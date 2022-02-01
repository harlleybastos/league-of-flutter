import 'package:flutter/material.dart';

PreferredSizeWidget customAppBar(BuildContext context, String title) {
  return AppBar(
    titleSpacing: 0,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            height: 45,
            width: 45,
            margin: EdgeInsets.only(top: 10, bottom: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Color(0xFF2263b3),
            ),
          ),
        ),
        Text(
          "Hello, ${title}",
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            height: 45,
            width: 45,
            padding: const EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: const Color.fromRGBO(0, 1, 22, .9),
              boxShadow: [
                BoxShadow(
                  color: Colors.white.withOpacity(0.2),
                  blurRadius: 5,
                  offset: const Offset(-2, -1),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
    automaticallyImplyLeading: true,
  );
}
