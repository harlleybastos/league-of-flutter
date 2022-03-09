import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PositionedSummonerRank extends StatelessWidget {
  final String? rankUrl;
  const PositionedSummonerRank({Key? key, required this.rankUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: MediaQuery.of(context).size.width * 0.50,
      left: 25,
      top: MediaQuery.of(context).size.height * 0.53,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.3,
        height: MediaQuery.of(context).size.height * 0.3,
        child: SvgPicture.asset(
          rankUrl!,
        ),
      ),
    );
  }
}
