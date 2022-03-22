import 'package:flutter/material.dart';

class PostionedButtonAffirmativeAnswer extends StatelessWidget {
  Function responseSetter;
  PostionedButtonAffirmativeAnswer({Key? key, required this.responseSetter})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.45,
      left: 0,
      right: 0,
      child: GestureDetector(
        onTap: () => responseSetter('true'),
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
            'I would like to see my summoner\'s Informations.'.toUpperCase(),
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: 'ITC_Avant_Garde_Gothic'),
          ),
        ),
      ),
    );
  }
}
