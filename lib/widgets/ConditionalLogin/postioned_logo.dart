import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PostionedLogo extends StatelessWidget {
  const PostionedLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.1,
      left: MediaQuery.of(context).size.width * 0.1,
      right: MediaQuery.of(context).size.width * 0.1,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.6,
        height: MediaQuery.of(context).size.height * 0.3,
        child: SvgPicture.asset(
          'assets/constants/logos/logo-single.svg',
        ),
      ),
    );
  }
}
