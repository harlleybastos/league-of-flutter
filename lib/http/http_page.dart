import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:initial_app/controller/http_controller.dart';
import 'package:initial_app/repository/i_champions_repository.dart';
import 'package:initial_app/widgets/champion_container.dart';

class HttpPage extends GetView<HttpController> {
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        actionsIconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          'Champions',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
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
