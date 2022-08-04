import 'package:biz/utils/colors.dart';
import 'package:biz/utils/form_helper.dart';
import 'package:expand_tap_area/expand_tap_area.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../service_locator.dart';
import '../utils/widgets.dart';

class MyBizCodeScreen extends StatefulWidget {
  MyBizCodeScreen({Key? key}) : super(key: key);

  @override
  State<MyBizCodeScreen> createState() => _MyBizCodeScreenState();
}

class _MyBizCodeScreenState extends State<MyBizCodeScreen> {
  final CustomFormHelper _customFormHelper = getIt<CustomFormHelper>();
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    FocusScopeNode currentFocus = FocusScope.of(context);
    return GestureDetector(
      onTap: () {
        _customFormHelper.checkfocus(context, currentFocus);
      },
      child: MyScaffold(
        backgroundColor: Colors.white,
        body: getBody(size),
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: ExpandTapWidget(
            tapPadding: EdgeInsets.all(10),
            onTap: () {
              Get.back();
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: textColor,
              size: 23,
            ),
          ),
          title: Container(
            margin: EdgeInsets.only(left: 40),
            height: Get.height * 0.04,
            width: Get.width * 0.46,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [BoxShadow(color: Colors.black, spreadRadius: 1)]),
            child: Row(
              children: [
                selectTap(0, "My bizCode"),
                selectTap(1, "Scan"),
              ],
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: Image.asset(
                "assets/images/dottedpic.png",
                scale: 3,
              ),
            )
          ],
        ),
      ),
    );
  }

  getBody(Size size) {
    return SafeArea(
      child: Container(
        height: Get.height,
        width: Get.width,
        child: Column(
          children: [
            SizedBox(
              height: Get.height * 0.2,
            ),
            CircularAvatarWithAssetImage(
              imageSize: 110,
              imagePath: 'assets/images/profile.png',
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Eric Mitro",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: Get.width * 0.04,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "Actor - Producer",
              style: TextStyle(
                color: Colors.grey,
                fontSize: Get.width * 0.04,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            CircularAvatarWithAssetImage(
              imageSize: 160,
              imagePath: 'assets/images/scan.png',
            ),
          ],
        ),
      ),
    );
  }

  Widget selectTap(int index, String name) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        alignment: Alignment.center,
        height: Get.height * 0.04,
        width: Get.width * 0.23,
        decoration: BoxDecoration(
          color: selectedIndex == index ? Colors.black : Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text(
          name,
          style: TextStyle(
              color: selectedIndex == index ? Colors.white : textColor,
              fontSize: Get.width * 0.03),
        ),
      ),
    );
  }
}
