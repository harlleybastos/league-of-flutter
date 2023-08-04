import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:league_of_flutter/models/champion.dart';

class ChampionContainerRoleName extends StatelessWidget {
  final Champion championData;

  const ChampionContainerRoleName({Key? key, required this.championData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 15,
      left: 0,
      right: 0,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 50,
        child: SvgPicture.asset(
          'assets/roles/${championData.tags[0].toLowerCase()}.svg',
        ),
      ),
    );
  }
}
