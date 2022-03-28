import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../controller/initial_screen_controller.dart';

import '../constants/languages.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GetStorage _getStorage = GetStorage();
    Map<String, String> data = {
      'version': '',
      'language': '',
    };
    return GetBuilder<InitialScreenController>(builder: (controller) {
      return controller.obx((latestVersionOfApi) {
        return Scaffold(
          body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                Positioned(
                  bottom: MediaQuery.of(context).size.height * 0.09,
                  child: RotatedBox(
                    quarterTurns: 2,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.1,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Color(0xFF010116),
                            Color(0xFF9b455f),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.72,
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: Center(
                    child: Container(
                      width: 100,
                      child: SvgPicture.asset(
                        'assets/constants/logos/logo-single.svg',
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.1,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.1,
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.centerRight,
                          end: Alignment.centerLeft,
                          colors: [
                            Color(0xFF010116),
                            Color(0xFF9b455f),
                          ],
                        ),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        )),
                    child: const Center(
                      child: Text(
                        'SELECT A LANGUAGE',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'BeaufortForLOL',
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.21,
                  left: 0,
                  bottom: MediaQuery.of(context).size.height * 0.2,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.all(15),
                              padding: const EdgeInsets.all(15),
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: Color(0xFF010116).withOpacity(.7),
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xFFb463a4).withOpacity(0.5),
                                    blurRadius: 20,
                                    spreadRadius: 2,
                                  ),
                                ],
                              ),
                              child: Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      String? selectedLanguage =
                                          languages[index]['value'];
                                      if (selectedLanguage!.isNotEmpty) {
                                        controller.updateValues(
                                            latestVersionOfApi,
                                            selectedLanguage);
                                        data = {
                                          'version': latestVersionOfApi!,
                                          'language': selectedLanguage,
                                        };

                                        _getStorage.write('data', data);
                                        Get.offAllNamed("/");
                                      }
                                    },
                                    child: Center(
                                      child: Text(
                                        languages[index]['name']!,
                                        style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w800,
                                            color: Colors.white,
                                            fontFamily: 'Montserrat'),
                                      ),
                                    ),
                                  ),
                                  const Spacer(),
                                  Container(
                                    width: 50,
                                    height: 50,
                                    child: SvgPicture.asset(
                                      languages[index]['url']!.toString(),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                      itemCount: languages.length,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      });
    });
  }
}
