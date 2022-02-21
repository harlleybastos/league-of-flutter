import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:initial_app/controller/search_section_controller.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchSectionController>(
      builder: (controller) => Scaffold(
        body: Container(
          child: Text("Eae men"),
        ),
      ),
    );
  }
}
