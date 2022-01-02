import 'package:get/get.dart';
import 'package:initial_app/controller/http_controller.dart';
import 'package:initial_app/repository/i_champions_repository.dart';
import 'package:initial_app/service/champions_repository.dart';

class HttpBindings implements Bindings{
  @override
  void dependencies() {
    // Runs before the app starts for populating the dependencies
    Get.put<IChampionsRepository>(ChampionsHttpRepository());
    // Add the controller for execute the access for repository
    Get.put(HttpController(Get.find()));
  }

}