import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:initial_app/controller/champion_list_controller.dart';
import 'package:initial_app/widgets/champion_container.dart';
import 'package:initial_app/widgets/champion_gradient_background.dart';
import 'package:initial_app/widgets/champion_image_background.dart';

class ChampionsList extends GetView<ChampionListController> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Champions',
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
          ),
          onPressed: () => Get.back(),
        ),
      ),
      // With that we can controlle all the structures of the StateMixin with the responses of loading, success or error;
      body: controller.obx(
        (state) {
          return ListView.builder(
            itemCount: state.length,
            itemBuilder: (_, index) {
              return ChampionContainer(championData: state[index]);
            },
          );
        },
        onError: (error) {
          return Center(
            child: Text(
              error.toString(),
            ),
          );
        },
      ),
    );
  }
}
