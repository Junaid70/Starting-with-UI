import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/widgets.dart';

class ContactInfo extends StatefulWidget {
  const ContactInfo({Key? key}) : super(key: key);

  @override
  State<ContactInfo> createState() => _ContactInfoState();
}

class _ContactInfoState extends State<ContactInfo> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
          size: 23,
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
      body: Container(
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
              color: selectedIndex == index ? Colors.white : Colors.black,
              fontSize: Get.width * 0.03),
        ),
      ),
    );
  }
}
