import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/controllers/counter_controller.dart';

class OtherView extends StatelessWidget {
  OtherView({Key? key}) : super(key: key);
  // Here we can apply the Singleton Design Pattern so we instantiate one instance of the controller class and use it as many time as we want
  final CounterController counterController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Other Screen'),
      ),
      backgroundColor: Colors.deepPurple[50],
      body: Center(
        child: Text(
          'Other Screen: ${counterController.counter}',
          style: const TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: Colors.deepPurpleAccent,
          ),
        ),
      ),
    );
  }
}
