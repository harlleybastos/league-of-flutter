import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:initial_app/controller/search_section_controller.dart';
import 'package:initial_app/widgets/global/app_name.dart';
import 'package:initial_app/widgets/global/app_bar.dart';
import 'package:initial_app/widgets/global/app_input.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchSectionController>(
      builder: (controller) => Scaffold(
        appBar: customAppBar(context, 'Harlley'),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              const AppName(),
              Positioned(
                left: 0,
                right: 0,
                child: AppInput(
                  focusNode: controller.focusNode,
                  textEditingController: controller.textController,
                  hintText: 'Search a summoner',
                  onChanged: (e) {
                    print(e);
                    if (e.isNotEmpty && e.length > 6) {
                      controller.findSummoner();
                    }
                  },
                  onSubmitted: (e) => controller.findSummoner,
                ),
              ),
              Positioned(
                top: 210,
                left: MediaQuery.of(context).size.width * 0.05,
                right: MediaQuery.of(context).size.width * 0.05,
                child: controller.obx((state) {
                  return (KeyboardVisibilityBuilder(
                    builder: (builder, visible) {
                      if (!visible) {
                        return ListView.builder(
                          scrollDirection: Axis.vertical,
                          physics: const AlwaysScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (_, index) {
                            return Container(
                              height: 50,
                              color: Colors.white,
                              child: Text(
                                state![0].summonerLevel.toString(),
                                style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.black,
                                    fontFamily: 'Roboto'),
                              ),
                            );
                          },
                          itemCount: state!.length,
                        );
                      }
                      return Container();
                    },
                  ));
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
