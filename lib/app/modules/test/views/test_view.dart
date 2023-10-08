import 'package:ahmed_training/app/modules/test/views/file_list.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/test_controller.dart';

class TestView extends GetView<TestController> {
  const TestView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TestView'),
        centerTitle: true,
      ),
      body: GetBuilder(
        init: TestController (),
        builder: (controller){
          return FileList();
        },
      ),
    );
  }
}
