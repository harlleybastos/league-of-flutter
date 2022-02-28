import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';

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
            padding: const EdgeInsets.only(left: 10, right: 10),
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
            child: SvgPicture.asset('assets/gear.svg'),
          ),
        ),
      ],
    ),
    automaticallyImplyLeading: true,
  );
}

PreferredSizeWidget shimmerCustomAppBar(BuildContext context, String title) {
  return AppBar(
    titleSpacing: 0,
    title: Container(
      width: MediaQuery.of(context).size.width,
      height: 55,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                width: 55,
                height: 55,
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
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Padding(
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
            ),
          ),
          Positioned(
            left: 80,
            top: 15,
            right: 120,
            child: Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                width: 165,
                height: 35,
                color: Colors.grey[300],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
