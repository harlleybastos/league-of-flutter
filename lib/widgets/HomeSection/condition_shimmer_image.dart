import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ConditionalRenderingImage extends StatelessWidget {
  final String mainChampion;
  const ConditionalRenderingImage({Key? key, required this.mainChampion})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return mainChampion == ''
        ? Positioned(
            top: MediaQuery.of(context).size.height * 0.12,
            left: MediaQuery.of(context).size.width * 0.05,
            right: MediaQuery.of(context).size.width * 0.05,
            child: Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  width: double.infinity,
                  height: 180,
                  color: Colors.grey[300],
                ),
              ),
            ),
          )
        : Positioned(
            top: MediaQuery.of(context).size.height * 0.12,
            left: MediaQuery.of(context).size.width * 0.05,
            right: MediaQuery.of(context).size.width * 0.05,
            child: Container(
              width: double.infinity,
              height: 180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  20,
                ),
                image: DecorationImage(
                    image: CachedNetworkImageProvider(
                      mainChampion,
                    ),
                    fit: BoxFit.cover,
                    alignment: const Alignment(-1, -1)),
              ),
            ),
          );
  }
}
