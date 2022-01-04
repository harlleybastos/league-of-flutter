import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:initial_app/bindings/http_bindings.dart';
import 'package:initial_app/home.dart';
import 'package:initial_app/http/http_page.dart';
import 'package:initial_app/widgets/champions_details.dart';

void main () => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(
          name: '/',
          page: () => Home(),
          children: [
            GetPage(
              name: '/http',
              page: () => HttpPage(),
              binding: HttpBindings(),
            ),
            GetPage(
              name: '/details',
              page: () => ChampionDetails(),
            ),
          ]
        ),
      ],
    );
  }
}