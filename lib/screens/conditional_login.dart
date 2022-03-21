import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ConditionalLogin extends StatelessWidget {
  const ConditionalLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Positioned(
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
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.45,
                left: 0,
                right: 0,
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFF9b455f),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFFb463a4).withOpacity(0.5),
                        blurRadius: 20,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    'I would like to see my summoner\'s Informations.'
                        .toUpperCase(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: 'ITC_Avant_Garde_Gothic'),
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.60,
                left: 0,
                right: 0,
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFF010116).withOpacity(.7),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFFb463a4).withOpacity(0.5),
                        blurRadius: 20,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    'I wouldn\'t like to see my summoner\'s Informations.'
                        .toUpperCase(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontFamily: 'ITC_Avant_Garde_Gothic',
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: MediaQuery.of(context).size.height * 0.01,
                left: MediaQuery.of(context).size.width * 0.15,
                right: MediaQuery.of(context).size.width * 0.15,
                child: Container(
                  child: Image.asset(
                    'assets/gif/gnar_gif.gif',
                  ),
                ),
              )
            ],
          )),
    );
  }
}
