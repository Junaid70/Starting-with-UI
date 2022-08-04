import 'package:animated_widgets/animated_widgets.dart';
import 'package:biz/utils/form_helper.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/chat/message.dart';
import '../service_locator.dart';
import '../utils/colors.dart';
import '../utils/widgets.dart';

class ChatScreeen extends StatelessWidget {
  ChatScreeen({Key? key}) : super(key: key);
  final CustomFormHelper _customFormHelper = getIt<CustomFormHelper>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    FocusScopeNode currentFocus = FocusScope.of(context);
    return GestureDetector(
      onTap: () {
        _customFormHelper.checkfocus(context, currentFocus);
      },
      child: MyScaffold(
        backgroundColor: darkGrayColor,
        body: getBody(size),
        resizeToAvoidBottomInset: false,
      ),
    );
  }

  getBody(Size size) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(),
        child: Column(
          children: [
            AppBar(
              backgroundColor: bgColor,
              leading: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
                size: 23,
              ),
              title: Text(
                "Messenger",
                style:
                    TextStyle(color: Colors.white, fontSize: Get.width * 0.04),
              ),
              centerTitle: true,
              actions: [
                Image.asset(
                  "assets/images/check.png",
                  scale: 3,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: Get.height * 0.02),
              child: Container(
                color: bgColor,
                width: Get.width * 0.9,
                child: TextFormField(
                  style: TextStyle(color: Colors.white),
                  autocorrect: false,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.black,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                        10,
                      )),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      isDense: true,
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                      hintText: 'Search',
                      hintStyle: TextStyle(color: Colors.white),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      suffixIcon: Icon(
                        Icons.mic,
                        color: Colors.white,
                      )),
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                    children: List.generate(messengerList.length, (index) {
                  return Container(
                    child: Container(
                      height: Get.height * 0.11,
                      width: Get.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: TranslationAnimatedWidget.tween(
                        duration: Duration(milliseconds: 700),
                        translationDisabled: Offset(100, 0),
                        translationEnabled: Offset(0, 0),
                        child: OpacityAnimatedWidget.tween(
                          opacityEnabled: 1,
                          opacityDisabled: 0,
                          child: ListTile(
                            leading: CircularAvatarWithAssetImage(
                              imageSize: 50,
                              imagePath: messengerList[index].Image,
                            ),
                            title: Text(
                              messengerList[index].name,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: Get.width * 0.04,
                                  fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              messengerList[index].disc,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: Get.width * 0.027),
                            ),
                            trailing: Text(
                              messengerList[index].day,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: Get.width * 0.03),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                })),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
