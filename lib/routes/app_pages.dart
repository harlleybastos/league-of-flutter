import 'package:get/get.dart';

import '../bindings/champion_details_bindings.dart';
import '../bindings/champion_list_bindings.dart';
import '../bindings/dashboard_bindings.dart';
import '../bindings/search_page_bindings.dart';
import '../bindings/summoner_details_bindings.dart';

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
              name: AppRoutes.championList,
              page: () => const ChampionsList(),
              binding: ChampionsListBindings()),
          GetPage(
              name: AppRoutes.searchSummoner,
              page: () => const SearchPage(),
              binding: SearchPageBindings()),
          GetPage(
              name: AppRoutes.summonerDetails,
              page: () => const SummonerDetailsScreen(),
              binding: SummonerDetailsBindings()),
          GetPage(
            name: AppRoutes.championDetails,
            page: () => const ChampionDetails(),
            binding: ChampionDetailsBindings(),
          ),
        ]),
  ];
}
