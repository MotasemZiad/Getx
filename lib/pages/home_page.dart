import 'package:flutter/material.dart';
import 'package:getx_app/responsive/desktop_body.dart';
import 'package:getx_app/responsive/mobile_body.dart';
import 'package:getx_app/responsive/responsive_layout.dart';
import 'package:getx_app/responsive/tablet_body.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ResponsiveLayout(
        mobileBody: MobileBody(),
        tabletBody: TabletBody(),
        desktopBody: DesktopBody(),
      ),
    );
  }
}
