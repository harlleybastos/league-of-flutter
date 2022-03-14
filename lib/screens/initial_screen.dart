import 'package:flutter/material.dart';
import '../constants/languages.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Positioned(
              top: MediaQuery.of(context).size.height * 0.5,
              left: 0,
              child: Container(
                color: Colors.red,
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Text('$index');
                  },
                  itemCount: languages.length,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
