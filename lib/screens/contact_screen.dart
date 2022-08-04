import 'package:animated_widgets/animated_widgets.dart';
import 'package:biz/utils/constants.dart';
import 'package:biz/utils/form_helper.dart';
import 'package:biz/utils/styles.dart';
import 'package:expand_tap_area/expand_tap_area.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../service_locator.dart';
import '../utils/colors.dart';

import '../utils/decorations.dart';
import '../utils/utils.dart';
import '../utils/widgets.dart';

class ContactScreeen extends StatelessWidget {
  ContactScreeen({Key? key}) : super(key: key);
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
            child: Column(
              children: [
                verticalSpace(height: Get.height * 0.02045),
                ContactusAppBar(
                  title: 'Talent',
                ),
                verticalSpace(height: Get.height * 0.02045),
                Row(
                  children: [
                    Text(
                      'Perfectly Natural',
                      style: boldWhiteText22(fieldColor),
                    ),
                    horizontalSpace(width: Get.width * 0.022),
                    Container(
                      width: Get.width * 0.11,
                      child: Stack(children: [
                        Text(
                          'Zach',
                          style: regularWhiteText16(dividerColor),
                        ),
                        Positioned(
                          right: 0,
                          bottom: 2,
                          child: Icon(
                            Icons.edit,
                            size: 14,
                            color: dividerColor,
                          ),
                        ),
                      ]),
                    ),
                  ],
                ),
              ],
            ),
          ),
          verticalSpace(height: Get.height * 0.0145),
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: Get.height * 0.02202,
                vertical: Get.height * 0.02202),
            color: darkGrayColor,
            height: Get.height * 0.09,
            width: Get.width,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 35,
                      width: Get.height * 0.38,
                      decoration:
                          rectangularAppBarBoxDecorationWithRadiusElevation(
                              8, 0,
                              color: searchColor),
                      child: TextFormField(
                        decoration: InputDecoration(
                            isDense: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4.0),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            hintStyle: const TextStyle(
                              color: textFormFieldColor,
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                            ),
                            hintText: 'Search',
                            prefixIconConstraints: const BoxConstraints(),
                            prefixIcon: Padding(
                              padding: const EdgeInsets.only(
                                  top: 12.0, bottom: 12, left: 10, right: 12),
                              child: Image.asset(
                                'assets/images/ic_search.png',
                                height: 16,
                                width: 16,
                              ),
                            )),
                      ),
                    ),
                    ExpandTapWidget(
                      tapPadding: EdgeInsets.all(10),
                      onTap: () {
                        Get.toNamed(NamedRoutes.routeFilter);
                      },
                      child: Image.asset(
                        'assets/images/ic_filter.png',
                        height: 20,
                        color: textColor,
                      ),
                    ),
                  ]),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: Get.height * 0.02202),
                  color: fieldColor4,
                  height: Get.height * 0.035,
                  width: Get.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '1',
                        style: regularWhiteText14(bgColor),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: Get.height * 0.02202),
                  color: fieldColor,
                  child: ListView.builder(
                    itemCount: 4,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          TranslationAnimatedWidget.tween(
                            duration: Duration(milliseconds: 700),
                            translationDisabled: Offset(100, 0),
                            translationEnabled: Offset(0, 0),
                            child: OpacityAnimatedWidget.tween(
                              opacityEnabled: 1,
                              opacityDisabled: 0,
                              child: Container(
                                height: Get.height * 0.09,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Image.asset(
                                          'assets/images/Circle.png',
                                          height: 40,
                                        ),
                                        horizontalSpace(
                                            width: Get.width * 0.02),
                                        Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                'Christy Viola',
                                                style: boldWhiteText15(bgColor),
                                              ),
                                              verticalSpace(
                                                  height: Get.height * 0.002),
                                              Text(
                                                'Actor - Model',
                                                style: regularWhiteText13(
                                                    darkGreyColor),
                                              ),
                                            ])
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          height: 25,
                                          width: 25,
                                          decoration:
                                              rectangularAppBarBoxDecorationWithRadiusElevation(
                                                  12.5, 1,
                                                  color: fieldColor),
                                          child: Center(
                                            child: Text(
                                              '1',
                                              style: boldWhiteText15(bgColor),
                                            ),
                                          ),
                                        ),
                                        horizontalSpace(
                                            width: Get.height * 0.015),
                                        Image.asset(
                                          'assets/images/ic_outline.png',
                                          height: 14,
                                        ),
                                        horizontalSpace(
                                            width: Get.height * 0.015),
                                        Image.asset(
                                          'assets/images/ic_add.png',
                                          height: 13,
                                        ),
                                        horizontalSpace(
                                            width: Get.height * 0.015),
                                        Image.asset(
                                          'assets/images/ic_more.png',
                                          height: 12,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Divider(
                            color: dividerColor,
                            thickness: 1,
                          ),
                        ],
                      );
                    },
                  ),
                ),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: Get.height * 0.02202),
                  color: fieldColor4,
                  height: Get.height * 0.035,
                  width: Get.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '2',
                        style: regularWhiteText14(bgColor),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: Get.height * 0.02202),
                  color: fieldColor,
                  child: ListView.builder(
                    itemCount: 4,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          TranslationAnimatedWidget.tween(
                            duration: Duration(milliseconds: 700),
                            translationDisabled: Offset(100, 0),
                            translationEnabled: Offset(0, 0),
                            child: OpacityAnimatedWidget.tween(
                              opacityEnabled: 1,
                              opacityDisabled: 0,
                              child: Container(
                                height: Get.height * 0.09,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Image.asset(
                                          'assets/images/Circle2.png',
                                          height: 40,
                                        ),
                                        horizontalSpace(
                                            width: Get.width * 0.02),
                                        Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                'Christy Viola',
                                                style: boldWhiteText15(bgColor),
                                              ),
                                              verticalSpace(
                                                  height: Get.height * 0.002),
                                              Text(
                                                'Actor - Model',
                                                style: regularWhiteText13(
                                                    darkGreyColor),
                                              ),
                                            ])
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          height: 25,
                                          width: 25,
                                          decoration:
                                              rectangularAppBarBoxDecorationWithRadiusElevation(
                                                  12.5, 1,
                                                  color: fieldColor),
                                          child: Center(
                                            child: Text(
                                              '2',
                                              style: boldWhiteText15(bgColor),
                                            ),
                                          ),
                                        ),
                                        horizontalSpace(
                                            width: Get.height * 0.015),
                                        Image.asset(
                                          'assets/images/ic_outline.png',
                                          height: 14,
                                        ),
                                        horizontalSpace(
                                            width: Get.height * 0.015),
                                        Image.asset(
                                          'assets/images/ic_add.png',
                                          height: 13,
                                        ),
                                        horizontalSpace(
                                            width: Get.height * 0.015),
                                        Image.asset(
                                          'assets/images/ic_more.png',
                                          height: 12,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Divider(
                            color: dividerColor,
                            thickness: 1,
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
