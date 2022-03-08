import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PostionedMainChampionImage extends StatelessWidget {
  final String imageUrl;
  const PostionedMainChampionImage({Key? key, required this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      child: Container(
        width: double.maxFinite,
        height: 360,
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          progressIndicatorBuilder: (context, url, downloadProgress) => Center(
            child: Image.asset(
              'assets/gif/league-of-flutter-loading-image.gif',
              fit: BoxFit.cover,
              filterQuality: FilterQuality.high,
              width: double.maxFinite,
              height: double.maxFinite,
            ),
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
