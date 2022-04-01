import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:initial_app/routes/app_pages.dart';
import 'package:initial_app/routes/app_routes.dart';
import 'package:flutter/services.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.splashScreen,
      getPages: AppPages.list,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF010116),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 6, 6, 22),
          elevation: 0,
          centerTitle: true,
          textTheme: TextTheme(
            headline6: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          foregroundColor: Colors.white,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.transparent,
          elevation: 0,
          selectedItemColor: Colors.white,
          unselectedItemColor: Color(0xFF6190a1),
          showUnselectedLabels: false,
          showSelectedLabels: false,
        ),
      ),
    );
  }
}
