import 'package:animations/animations.dart';
import 'package:biz/screens/my_biz_code_screen.dart';
import 'package:biz/utils/form_helper.dart';
import 'package:expand_tap_area/expand_tap_area.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../service_locator.dart';
import '../utils/colors.dart';

import '../utils/constants.dart';
import '../utils/decorations.dart';
import '../utils/styles.dart';
import '../utils/utils.dart';
import '../utils/widgets.dart';
import 'filter_screen.dart';

class ScanScreen extends StatelessWidget {
  ScanScreen({Key? key}) : super(key: key);
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
                  title: 'Film & Photography',
                ),
                verticalSpace(height: Get.height * 0.02045),
                Row(
                  children: [
                    Text(
                      'All Contacts',
                      style: boldWhiteText22(fieldColor),
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
              physics: ClampingScrollPhysics(),
              children: [
                Container(
                  padding: EdgeInsets.only(
                      top: Get.height * 0.02202,
                      left: Get.height * 0.02202,
                      right: Get.height * 0.02202),
                  color: fieldColor,
                  child: GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 0.79,
                        crossAxisSpacing: Get.height * 0.02502,
                        mainAxisSpacing: Get.height * 0.02502,
                      ),
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return AnimatedContainerWrapper(
                          openBuilder: MyBizCodeScreen(),
                          onClosed: (bool? data) {},
                          transitionType: ContainerTransitionType.fade,
                          closedBuilder: Container(
                            height: Get.height * 0.2,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset(
                                  'assets/images/Circle.png',
                                  height: 80,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/images/ic_outline.png',
                                      height: 14,
                                    ),
                                    horizontalSpace(width: Get.height * 0.015),
                                    Image.asset(
                                      'assets/images/ic_add.png',
                                      height: 13,
                                    ),
                                    horizontalSpace(width: Get.height * 0.015),
                                    Image.asset(
                                      'assets/images/ic_more.png',
                                      height: 12,
                                    ),
                                  ],
                                ),
                                Text(
                                  'Christy Viola',
                                  style: boldWhiteText13(textColor),
                                ),
                                Text(
                                  'Actor - Model',
                                  style: regularWhiteText11(textColor),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
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
                        'B',
                        style: regularWhiteText14(bgColor),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                      top: Get.height * 0.02202,
                      left: Get.height * 0.02202,
                      right: Get.height * 0.02202),
                  color: fieldColor,
                  child: GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 0.79,
                        crossAxisSpacing: Get.height * 0.02502,
                        mainAxisSpacing: Get.height * 0.02502,
                      ),
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return AnimatedContainerWrapper(
                          openBuilder: MyBizCodeScreen(),
                          onClosed: (bool? data) {},
                          transitionType: ContainerTransitionType.fade,
                          closedBuilder: Container(
                            height: Get.height * 0.2,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset(
                                  'assets/images/Circle.png',
                                  height: 80,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/images/ic_outline.png',
                                      height: 14,
                                    ),
                                    horizontalSpace(width: Get.height * 0.015),
                                    Image.asset(
                                      'assets/images/ic_add.png',
                                      height: 13,
                                    ),
                                    horizontalSpace(width: Get.height * 0.015),
                                    Image.asset(
                                      'assets/images/ic_more.png',
                                      height: 12,
                                    ),
                                  ],
                                ),
                                Text(
                                  'Christy Viola',
                                  style: boldWhiteText13(textColor),
                                ),
                                Text(
                                  'Actor - Model',
                                  style: regularWhiteText11(textColor),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
