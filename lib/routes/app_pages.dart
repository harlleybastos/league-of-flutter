import 'package:get/get.dart';
import 'package:initial_app/bindings/champion_details_bindings.dart';
import 'package:initial_app/bindings/champion_list_bindings.dart';
import 'package:initial_app/bindings/dashboard_bindings.dart';
import 'package:initial_app/screens/champions_list.dart';
import 'package:initial_app/routes/app_routes.dart';
import 'package:initial_app/screens/dashboard_page.dart';
import 'package:initial_app/widgets/ChampionDetails/champions_details.dart';

class AppPages {
  static var list = [
    GetPage(
        name: AppRoutes.Dashboard,
        page: () => const DashboardPage(),
        binding: DashboardBinding(),
        children: [
          GetPage(
            name: AppRoutes.ChampionList,
            page: () => const ChampionsList(),
            binding:ChampionsListBindings()
          ),
          GetPage(
            name: AppRoutes.ChampionDetails,
            page: () => const ChampionDetails(),
            binding: ChampionDetailsBindings(),
          ),
        ]),
  ];
}
