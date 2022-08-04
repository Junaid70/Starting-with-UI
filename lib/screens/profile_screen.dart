import 'package:biz/utils/form_helper.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../service_locator.dart';
import '../utils/colors.dart';
import '../utils/widgets.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
        child: Scaffold(
          body: Container(
            height: Get.height,
            width: Get.width,
            child: Column(
              children: [
                Container(
                  height: Get.height * 0.35,
                  width: Get.width,
                  color: bgColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "My bizCard",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: Get.width * 0.04,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "Eric Mitro",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: Get.width * 0.055,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              CircularAvatarWithAssetImage(
                                imageSize: 80,
                                imagePath: 'assets/images/profile.png',
                              ),
                              Text(
                                "Actor",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: Get.width * 0.04,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              CircularAvatarWithAssetImage(
                                imageSize: 60,
                                imagePath: 'assets/images/profilepic.png',
                              ),
                              Text(
                                "Producer",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: Get.width * 0.04,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  height: Get.height * 0.17,
                  width: Get.width,
                  color: darkGrayColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ListTile(
                        leading: CircularAvatarWithAssetImage(
                          imageSize: 40,
                          imagePath: 'assets/images/profile.png',
                        ),
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Eric Mitro",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: Get.width * 0.03,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Actor",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: Get.width * 0.03,
                                  ),
                                ),
                                Text(
                                  "Male",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: Get.width * 0.03,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "SAG-AFTRA",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: Get.width * 0.03,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  "Age:25-35",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: Get.width * 0.03,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        endIndent: Get.width * 0.04,
                        indent: Get.width * 0.04,
                        thickness: 1.2,
                        color: dividerColor,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "H: 6’2     S: L     Hair: Brown     Eyes: Green     Ethnicity: Caucaisian",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: Get.width * 0.03,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 15),
                  height: Get.height * 0.08,
                  width: Get.width,
                  color: bgColor,
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/images/check.png",
                        scale: 3,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Edit bizCard",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
                cardList(
                    "assets/images/subscription.png", "Manage Subscription",
                    disc: 'Platinum'),
                cardList("assets/images/password.png", "Privacy Settings"),
                cardList("assets/images/bizcard.png", "Share bizCard"),
                cardList("assets/images/logout.png", "Log Out"),
                cardList("assets/images/delete.png", "Delete bizCard"),
              ],
            ),
          ),
        ));
  }
}
