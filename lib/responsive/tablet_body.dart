import 'package:flutter/material.dart';

class TabletBody extends StatelessWidget {
  const TabletBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TABLET'),
        centerTitle: true,
      ),
      backgroundColor: Colors.deepPurple[200],
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: Container(
                height: 250.0,
                color: Colors.deepPurple[400],
              ),
            ),
          ),
          Expanded(
              child: ListView.builder(
            itemCount: 8,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 120.0,
                  color: Colors.deepPurple[300],
                ),
              );
            },
          ))
        ],
      ),
    );
  }
}
