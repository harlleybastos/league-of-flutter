import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:initial_app/controller/summoner_details_controller.dart';

class SummonerDetailsScreen extends StatelessWidget {
  const SummonerDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SummonerDetailsController>(
      builder: (controller) {
        return Scaffold(
          body: Container(
            color: Colors.white,
            width: double.maxFinite,
            height: double.maxFinite,
          ),
        );
      },
    );
  }
}
