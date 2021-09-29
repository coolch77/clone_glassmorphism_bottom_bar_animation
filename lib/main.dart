import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bottom_navi_sample/controller.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:get/get.dart';

import 'constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  final Controller _controller = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    var iconSize = Get.height * 0.055;
    var iconImageSize = Get.height * 0.035;
    var textSize = Get.height * 0.015;

    return Obx(
      () => Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              pinned: true,
              stretch: true,
              // floating: true,
              // snap: true,
              elevation: 0.0,
              backgroundColor: Colors.white,
              expandedHeight: Get.height * 0.3,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  'Sliver',
                  style: TextStyle(color: Colors.black),
                ),

                centerTitle: true,
                background: Image.network(
                  'https://nystudio107-ems2qegf7x6qiqq.netdna-ssl.com/img/blog/_1200x675_crop_center-center_82_line/image_optimzation.jpg',
                  fit: BoxFit.cover,
                ),
                //  Container(
                //   color: Colors.black,
                // ),
                stretchModes: [
                  StretchMode.fadeTitle,
                  StretchMode.zoomBackground,
                  StretchMode.blurBackground,
                ],
              ),
            ),
            SliverFillRemaining(
              child: Center(
                child: Text(
                  'Center',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: Container(
          width: Get.width,
          margin: EdgeInsets.only(
            left: Get.width * 0.12,
            right: Get.width * 0.12,
            bottom: Get.height * 0.02,
          ),
          height: Get.height * 0.1,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50),
              topRight: Radius.circular(50),
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  _controller.state.value = BottomNaviState.HOME;
                  Vibrate.feedback(FeedbackType.impact);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        AnimatedContainer(
                          duration: Duration(
                            milliseconds: 300,
                          ),
                          transform: Matrix4.rotationZ(
                              (_controller.state.value == BottomNaviState.HOME ? -20 : 0) * pi / 360),
                          width: iconSize,
                          height: iconSize,
                          decoration: BoxDecoration(
                            color: _controller.state.value == BottomNaviState.HOME
                                ? pointColors[BottomNaviState.HOME.index]
                                : Colors.black26,
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(14),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(
                              sigmaX: 5,
                              sigmaY: 5,
                            ),
                            child: Container(
                              width: iconSize,
                              height: iconSize,
                              child: Icon(
                                Icons.home,
                                size: iconImageSize,
                                color: _controller.state.value == BottomNaviState.HOME
                                    ? Colors.white
                                    : Colors.black38,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: Get.height * 0.002,
                    ),
                    Text(
                      'Home',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: textSize,
                        color: _controller.state.value == BottomNaviState.HOME
                            ? pointColors[BottomNaviState.HOME.index]
                            : Colors.black38,
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  _controller.state.value = BottomNaviState.APPS;
                  Vibrate.feedback(FeedbackType.impact);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        AnimatedContainer(
                          duration: Duration(
                            milliseconds: 300,
                          ),
                          transform: Matrix4.rotationZ(
                              (_controller.state.value == BottomNaviState.APPS ? -20 : 0) * pi / 360),
                          width: iconSize,
                          height: iconSize,
                          decoration: BoxDecoration(
                            color: _controller.state.value == BottomNaviState.APPS
                                ? pointColors[BottomNaviState.APPS.index]
                                : Colors.black26,
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(14),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(
                              sigmaX: 5,
                              sigmaY: 5,
                            ),
                            child: Container(
                              width: iconSize,
                              height: iconSize,
                              child: Icon(
                                Icons.apps,
                                size: iconImageSize,
                                color: _controller.state.value == BottomNaviState.APPS
                                    ? Colors.white
                                    : Colors.black38,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: Get.height * 0.002,
                    ),
                    Text(
                      'Apps',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: textSize,
                        color: _controller.state.value == BottomNaviState.APPS
                            ? pointColors[BottomNaviState.APPS.index]
                            : Colors.black38,
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  _controller.state.value = BottomNaviState.SETTING;
                  Vibrate.feedback(FeedbackType.impact);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        AnimatedContainer(
                          duration: Duration(
                            milliseconds: 300,
                          ),
                          transform: Matrix4.identity()
                            ..translate(
                              _controller.state.value == BottomNaviState.SETTING ? 5.0 : 0.0,
                              _controller.state.value == BottomNaviState.SETTING ? -5.0 : 0.0,
                            ),
                          width: iconSize,
                          height: iconSize,
                          decoration: BoxDecoration(
                            color: _controller.state.value == BottomNaviState.SETTING
                                ? pointColors[BottomNaviState.SETTING.index]
                                : Colors.black26,
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(
                              sigmaX: 5,
                              sigmaY: 5,
                            ),
                            child: Container(
                              width: iconSize,
                              height: iconSize,
                              child: Icon(
                                Icons.settings,
                                size: iconImageSize,
                                color: _controller.state.value == BottomNaviState.SETTING
                                    ? Colors.white
                                    : Colors.black38,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: Get.height * 0.002,
                    ),
                    Text(
                      'Setting',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: textSize,
                        color: _controller.state.value == BottomNaviState.SETTING
                            ? pointColors[BottomNaviState.SETTING.index]
                            : Colors.black38,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
