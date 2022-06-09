import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class InfinityShimmerMainChampionImage extends StatelessWidget {
  const InfinityShimmerMainChampionImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.20,
      left: MediaQuery.of(context).size.width * 0.05,
      right: MediaQuery.of(context).size.width * 0.05,
      child: Shimmer.fromColors(
        baseColor: Colors.transparent,
        highlightColor: Colors.grey[100]!.withOpacity(0.3),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            width: double.infinity,
            height: 180,
            color: Colors.grey[300],
          ),
        ),
      ),
    );
    ;
  }
}
