import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:initial_app/controller/champion_list_controller.dart';
import 'package:initial_app/widgets/champion_container.dart';

class ChampionsList extends GetView<ChampionListController> {
  const ChampionsList({Key? key}) : super(key: key);

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
            width: MediaQuery.of(context).size.width ,
            margin: const EdgeInsets.only(left:30,right:30),
            padding: const EdgeInsets.only(left:20),
            child: const TextField(
              decoration: InputDecoration(
                hintText: 'Enter a Champion Name'
              ),
            ),
          ),
          controller.obx(
          (state) {
            return Container(
              margin: const EdgeInsets.only(top:50),
               height:MediaQuery.of(context).size.height,
              child: ListView.builder(
                itemCount: state.length,
                itemBuilder: (_, index) {
                  return ChampionContainer(championData: state[index]);
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
