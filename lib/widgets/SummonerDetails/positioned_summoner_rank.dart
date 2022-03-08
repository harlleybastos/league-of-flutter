import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PositionedSummonerRank extends StatelessWidget {
  final String? rankUrl;
  const PositionedSummonerRank({Key? key, required this.rankUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: MediaQuery.of(context).size.width * 0.50,
      right: 0,
      top: MediaQuery.of(context).size.height * 0.40,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.2,
        height: MediaQuery.of(context).size.height * 0.2,
        child: SvgPicture.asset(
          rankUrl!,
        ),
      ),
    );
  }
}
