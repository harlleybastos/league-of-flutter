import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:initial_app/routes/app_pages.dart';
import 'package:initial_app/routes/app_routes.dart';
import 'package:flutter/services.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.Dashboard,
      getPages: AppPages.list,
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFF111E2B),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF111E2B),
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
