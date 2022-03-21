import 'package:get/get.dart';
import 'package:initial_app/bindings/splash_screen_bindings.dart';
import 'package:initial_app/screens/conditional_login.dart';
import 'package:initial_app/widgets/splash_screen.dart';

import '../bindings/home_section_bindings.dart';
import '../bindings/initial_screen_bindings.dart';
import '../bindings/champion_details_bindings.dart';
import '../bindings/champion_list_bindings.dart';
import '../bindings/dashboard_bindings.dart';
import '../bindings/search_page_bindings.dart';
import '../bindings/summoner_details_bindings.dart';

import '../screens/home_page.dart';
import '../screens/initial_screen.dart';
import '../screens/champions_list.dart';
import '../screens/dashboard_page.dart';
import '../screens/search_page.dart';
import '../screens/summoner_details.dart';
import '../screens/champions_details.dart';

import '../routes/app_routes.dart';

class AppPages {
  static var list = [
    GetPage(
        name: AppRoutes.dashboard,
        page: () => const DashboardPage(),
        binding: DashboardBinding(),
        children: [
          GetPage(
            name: AppRoutes.homeSection,
            page: () => const HomeSection(),
            binding: HomeSectionBindings(),
          ),
          GetPage(
            name: AppRoutes.championList,
            page: () => const ChampionsList(),
            binding: ChampionsListBindings(),
          ),
          GetPage(
            name: AppRoutes.searchSummoner,
            page: () => const SearchPage(),
            binding: SearchPageBindings(),
          ),
          GetPage(
            name: AppRoutes.summonerDetails,
            page: () => const SummonerDetailsScreen(),
            binding: SummonerDetailsBindings(),
          ),
          GetPage(
            name: AppRoutes.championDetails,
            page: () => const ChampionDetails(),
            binding: ChampionDetailsBindings(),
          ),
        ]),
    GetPage(
      name: AppRoutes.initialScreen,
      page: () => const InitialScreen(),
      binding: InitialScreenBindings(),
    ),
    GetPage(
        name: AppRoutes.splashScreen,
        page: () => const SplashScreen(),
        binding: SplashScreenBindings()),
    GetPage(
      name: AppRoutes.conditionalLogin,
      page: () => const ConditionalLogin(),
    ),
  ];
}
