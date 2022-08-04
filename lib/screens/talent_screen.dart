import 'package:animated_widgets/widgets/opacity_animated.dart';
import 'package:animated_widgets/widgets/translation_animated.dart';
import 'package:biz/utils/constants.dart';
import 'package:biz/utils/form_helper.dart';
import 'package:biz/utils/styles.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/items/items.dart';
import '../service_locator.dart';
import '../stores/main_screen_store.dart';
import '../utils/colors.dart';

import '../utils/decorations.dart';
import '../utils/json_utils.dart';
import '../utils/utils.dart';
import '../utils/widgets.dart';

class TalentScreen extends StatelessWidget {
  TalentScreen({Key? key}) : super(key: key);
  final CustomFormHelper _customFormHelper = getIt<CustomFormHelper>();
  final MainScreenStore _mainScreenStore = getIt<MainScreenStore>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    FocusScopeNode currentFocus = FocusScope.of(context);
    return GestureDetector(
      onTap: () {
        _customFormHelper.checkfocus(context, currentFocus);
      },
      child: MyScaffold(
        backgroundColor: bgColor,
        body: getBody(size),
        resizeToAvoidBottomInset: false,
      ),
    );
  }

  getBody(Size size) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Get.height * 0.02202),
            child: MyTalentAppBar(
              isBackRequired: true,
              isCenteredLogoRequired: true,
              isTalentScreen: true,
            ),
          ),
          Container(
            decoration: rectangularWhiteBoxDecorationWithRadiusElevation(0, 4),
            child: Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 10),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(icons.length, (index) {
                      return Column(
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration:
                                rectangularAppBarBoxDecorationWithRadiusElevation(
                                    20, 4,
                                    color: (_mainScreenStore.talentIndexPage ==
                                            index)
                                        ? fieldColor
                                        : fieldColor4),
                            child: IconButton(
                              onPressed: () async {},
                              icon: Image.asset(
                                icons2[index]['Icon'].toString(),
                                width: 21,
                                height: 21,
                              ),
                            ),
                          ),
                          verticalSpace(height: 3),
                          Text(
                            icons2[index]['Title'].toString(),
                            style: regularWhiteText10(
                                (_mainScreenStore.talentIndexPage == index)
                                    ? fieldColor
                                    : fieldColor4),
                          ),
                        ],
                      );
                    }))),
          ),
          verticalSpace(height: Get.height * 0.013),
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: Get.height * 0.02202,
                vertical: Get.height * 0.02202),
            color: darkGrayColor,
            height: Get.height * 0.13,
            width: Get.width,
            child: Row(
              children: [
                CircularAvatarWithAssetImage(
                  imagePath: 'assets/images/Circle.png',
                  imageSize: 30,
                  imageHeight: 60,
                  imageWidth: 60,
                ),
                horizontalSpace(width: Get.height * 0.007),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Tiffany Kontoyiannis',
                      style: boldWhiteText15(fieldColor),
                    ),
                    verticalSpace(height: Get.height * 0.005),
                    Text(
                      'Producer',
                      style: boldWhiteText13(fieldColor4),
                    ),
                    verticalSpace(height: Get.height * 0.002),
                    Text(
                      'PGA',
                      style: boldWhiteText13(fieldColor),
                    ),
                  ],
                )
              ],
            ),
          ),
          verticalSpace(height: Get.height * 0.005),
          Expanded(
            child: ListView.builder(
                itemCount: eventlist.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: (() {
                      _mainScreenStore.indexPage = 1;
                      Get.toNamed(NamedRoutes.routeMain);
                    }),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: Get.height * 0.0202,
                              vertical: Get.height * 0.0202),
                          color: darkGrayColor,
                          height: Get.height * 0.26,
                          width: Get.width,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    eventlist[index].name,
                                    style: boldWhiteText13(textColor),
                                  ),
                                ],
                              ),
                              Divider(
                                color: dividerColor,
                                thickness: 1,
                              ),
                              TranslationAnimatedWidget.tween(
                                duration: Duration(milliseconds: 800),
                                translationDisabled: Offset(100, 0),
                                translationEnabled: Offset(0, 0),
                                child: OpacityAnimatedWidget.tween(
                                  opacityEnabled: 1,
                                  opacityDisabled: 0,
                                  child: Container(
                                    width: Get.width,
                                    child: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: (eventlist[index]
                                                    .images
                                                    .isNotEmpty)
                                                ? List.generate(
                                                    (eventlist[index]
                                                            .images
                                                            .length)
                                                        .toInt(),
                                                    (idx) => Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Container(
                                                          width:
                                                              Get.height * .17,
                                                          height:
                                                              Get.height * .17,
                                                          decoration:
                                                              rectangularWhiteBoxDecorationWithRadiusElevation(
                                                            16,
                                                            2,
                                                          ),
                                                          child:
                                                              AnimatedContainer(
                                                            duration: Duration(
                                                                milliseconds:
                                                                    200),
                                                            child: Container(
                                                              width:
                                                                  Get.height *
                                                                      .15,
                                                              height:
                                                                  Get.height *
                                                                      .15,
                                                              decoration:
                                                                  rectangularWhiteBoxDecorationWithRadiusElevationwithBackgroundImage(
                                                                0,
                                                                0,
                                                                eventlist[index]
                                                                    .images
                                                                    .elementAt(
                                                                        idx)
                                                                    .toString(),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 5,
                                                        )
                                                      ],
                                                    ),
                                                  )
                                                : [
                                                    Text(
                                                        'you did\'t have any events'),
                                                  ])),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        verticalSpace(height: Get.height * 0.005),
                      ],
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
