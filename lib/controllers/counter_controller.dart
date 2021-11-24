import 'package:get/get.dart';

class CounterController extends GetxController {
  // obs it means observable variable, which is any variable that can be changed during run-time
  var counter = 0.obs;

  void increment() {
    counter++;
  }
}
