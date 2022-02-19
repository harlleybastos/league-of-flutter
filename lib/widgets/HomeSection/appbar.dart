import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

PreferredSizeWidget customAppBar(BuildContext context, String title) {
  return AppBar(
    titleSpacing: 0,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 55,
          height: 50,
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Color(0xFF17407d), width: 2),
          ),
          child: ClipOval(
            child: CachedNetworkImage(
              imageUrl:
                  "https://ddragon.leagueoflegends.com/cdn/12.4.1/img/champion/Aatrox.png",
              fit: BoxFit.fitWidth,
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
