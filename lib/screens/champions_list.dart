import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keyboard_service/keyboard_service.dart';

import '../controller/champion_list_controller.dart';
import '../widgets/ChampionsList/champion_container.dart';

class ChampionsList extends GetView<ChampionListController> {
  const ChampionsList({Key? key}) : super(key: key);

  Widget conditionalReturn(ChampionListController customController) {
    return customController.searchResult.isNotEmpty
        ? ListView.builder(
            itemCount: controller.searchResult.length,
            itemBuilder: (_, index) {
              return ChampionContainer(
                championData: controller.searchResult[index],
              );
            },
          )
        : Center(
            child: Image.asset(
              'assets/league-of-flutter-loading-alistar.gif',
              width: 200,
              height: 200,
            ),
          );
  }

  @override
  Widget build(BuildContext context) {
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
      body: Stack(
        children: [
          Container(
            height: 50,
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(left: 30, right: 30),
            padding: const EdgeInsets.only(left: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: const Color(0xFF2d2c2c),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 2.0, bottom: 2.0, right: 9.0),
              child: TextField(
                focusNode: controller.focusNode,
                controller: controller.textController,
                onChanged: controller.filterListOfChampionsByName,
                style: const TextStyle(color: Colors.white, fontSize: 20),
                decoration: const InputDecoration(
                  hintText: 'Search a champion',
                  border: InputBorder.none,
                  hintStyle: TextStyle(
                    color: Color(0xFF474646),
                  ),
                  suffixIcon: Icon(
                    Icons.search,
                    color: Color(0xFF939392),
                    size: 30,
                  ),
                ),
              ),
            ),
          ),
          controller.obx(
            (state) {
              return Container(
                margin: const EdgeInsets.only(top: 70),
                height: MediaQuery.of(context).size.height,
                child: KeyboardService.isVisible(context)
                    ? conditionalReturn(controller)
                    : ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: state!.length,
                        itemBuilder: (_, index) {
                          return ChampionContainer(
                            championData: state[index],
                          );
                        },
                      ),
              );
            },
            onError: (error) {
              return Center(
                child: Text(
                  error.toString(),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
