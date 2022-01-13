import 'package:get/get.dart';

class Counter2Controller extends GetxController {
  // another way of managing state with GetX using GetBuilder
  int counter = 0;

  void increment() {
    counter++;
    update();
  }
}
