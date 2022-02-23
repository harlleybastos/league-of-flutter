import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:initial_app/controller/dashboard_page_controller.dart';
import 'package:initial_app/screens/champions_list.dart';
import 'package:initial_app/screens/search_page.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardPageController>(
        builder: (controller) => Scaffold(
              body: SafeArea(
                child: IndexedStack(
                  index: controller.tabIndex,
                  children: [
                    ChampionsList(),
                    SearchPage(),
                  ],
                ),
              ),
              bottomNavigationBar: BottomNavigationBar(
                  onTap: (index) => controller.changeTabIndex(index),
                  currentIndex: controller.tabIndex,
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  items: [
                    _bottomNavigationBarItem(Icons.home_outlined, "Home"),
                    _bottomNavigationBarItem(Icons.search_outlined, "Search"),
                  ]),
            ));
  }

  BottomNavigationBarItem _bottomNavigationBarItem(
      IconData icon, String label) {
    return BottomNavigationBarItem(icon: Icon(icon), label: label);
  }
}
