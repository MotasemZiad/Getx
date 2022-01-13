import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/controllers/counter2_controller.dart';
import 'package:getx_app/views/other_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  // final CounterController counterController = Get.put(CounterController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GetX Home'),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GetBuilder<Counter2Controller>(
              init: Counter2Controller(),
              builder: (controller) {
                return Text(
                  'Number of Clicks: ${controller.counter}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 18.0,
                  ),
                );
              },
            ),
            // Obx(() => Text(
            //       'Number of Clicks: ${counterController.counter}',
            //       textAlign: TextAlign.center,
            //       style: const TextStyle(
            //         fontSize: 18.0,
            //       ),
            //     )),
            const SizedBox(
              height: 6.0,
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(() => OtherView());
              },
              child: const Text('Go To Other Screen'),
            ),
          ],
        ),
      ),
      floatingActionButton: GetBuilder<Counter2Controller>(
        builder: (controller) => FloatingActionButton(
          onPressed: () {
            // counterController.increment();
            controller.increment();
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
