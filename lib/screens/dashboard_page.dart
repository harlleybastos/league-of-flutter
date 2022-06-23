import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../widgets/global/app_bar.dart';
import '../widgets/global/app_name.dart';

import '../controller/dashboard_page_controller.dart';

import '../screens/champions_list.dart';
import '../screens/home_page.dart';
import '../screens/search_page.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PageController customController = PageController(
      initialPage: 0,
    );

    return GetBuilder<DashboardPageController>(
        builder: (controller) => Scaffold(
              appBar: customAppBar(context, controller.summonerData['name']),
              body: Stack(children: [
                SafeArea(
                  child: PageView.builder(
                    controller: customController,
                    physics: const AlwaysScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    onPageChanged: (int index) =>
                        controller.changeTabIndex(index),
                    itemBuilder: (context, index) {
                      if (controller.answer == 'true') {
                        return index == 0
                            ? HomeSection(
                                language: controller.language,
                                version: controller.apiVersion,
                              )
                            : index == 1
                                ? ChampionsList(
                                    language: controller.language,
                                    version: controller.apiVersion,
                                  )
                                : SearchPage(
                                    language: controller.language,
                                    version: controller.apiVersion,
                                  );
                      }
                      return index == 0
                          ? ChampionsList(
                              language: controller.language,
                              version: controller.apiVersion,
                            )
                          : SearchPage(
                              language: controller.language,
                              version: controller.apiVersion,
                            );
                    },
                  ),
                ),
                const AppName(),
              ]),
              bottomNavigationBar: BottomNavigationBar(
                  onTap: (currentIndex) {
                    customController.animateToPage(currentIndex,
                        duration: const Duration(milliseconds: 1000),
                        curve: Curves.easeInOutCubicEmphasized);
                    controller.changeTabIndex(currentIndex);
                  },
                  currentIndex: controller.tabIndex,
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  items: controller.answer == 'true'
                      ? [
                          _bottomNavigationBarItem(
                              Icons.account_circle_outlined, "Home"),
                          _customBottomNavigationBarItem(
                              SvgPicture.asset(
                                'assets/constants/img/champion-icon.svg',
                                width: 20,
                              ),
                              "Champions"),
                          _bottomNavigationBarItem(
                              Icons.search_outlined, "Search"),
                        ]
                      : [
                          // _bottomNavigationBarItem(
                          //     Icons.account_circle_outlined, "Home"),
                          _bottomNavigationBarItem(
                              Icons.home_outlined, "Champions"),
                          _bottomNavigationBarItem(
                              Icons.search_outlined, "Search"),
                        ]),
            ));
  }

  BottomNavigationBarItem _bottomNavigationBarItem(
      IconData icon, String label) {
    return BottomNavigationBarItem(icon: Icon(icon), label: label);
  }

  BottomNavigationBarItem _customBottomNavigationBarItem(
      SvgPicture svgPicture, String label) {
    return BottomNavigationBarItem(icon: svgPicture, label: label);
  }
}
