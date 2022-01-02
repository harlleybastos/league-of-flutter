import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:initial_app/controller/http_controller.dart';
import 'package:initial_app/models/champion.dart';

class HttpPage extends GetView<HttpController> {
  const HttpPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Http'),
      ),
      // With that we can controlle all the structures of the StateMixin with the responses of loading, success or error;
      body: controller.obx(
        (state) {
          return ListView.builder(
            itemCount: state.length,
            itemBuilder: (_, index) {
              final List<Map<String, dynamic>> item = [];
              state.keys.forEach((key) {
                item.add(state[key]);
              });
              return ListTile(
                title: Text(item[index]['name']),
                subtitle: Text(item[index]['title']),
              );
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
