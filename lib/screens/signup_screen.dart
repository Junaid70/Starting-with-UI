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

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);
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
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Get.height * 0.02202),
        child: Column(
          children: [
            verticalSpace(height: Get.height * 0.03045),
            GestureDetector(
              onTap: () {},
              child: MyAppBar(
                isBackRequired: true,
                isCenteredLogoRequired: false,
                isSignUpScreen: true,
              ),
            ),
            Expanded(
              child: Center(
                child: Container(
                    height: Get.height * 0.35,
                    decoration:
                        rectangularContainerBoxDecorationWithRadiusElevation(
                            12, 0),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: Get.height * .021,
                          horizontal: Get.height * .023),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "My Account",
                              style: boldWhiteText14(bgColor),
                            ),
                            verticalSpace(height: Get.height * .007),
                            Text(
                              'Before we start creating your account we need to know which account we’ll be creating and where you’ll be based at!',
                              style: regularWhiteText11(darkGreyColor),
                              textAlign: TextAlign.center,
                            ),
                            verticalSpace(height: Get.height * .015),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: Get.height * .091),
                              child: Divider(
                                thickness: 1.5,
                                color: dividerColor,
                              ),
                            ),
                            verticalSpace(height: Get.height * .015),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    decoration:
                                        rectangularCustomTextColorBoxDecorationWithRadiusElevation(
                                            4, 1, bgColor),
                                    child: CustomizedButton(
                                      text: "Independent",
                                      buttonWidth: Get.height * 0.125,
                                      textStyle: regularWhiteText13(fieldColor),
                                    ),
                                  ),
                                ),
                                horizontalSpace(width: Get.height * 0.007),
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    decoration:
                                        rectangularCustomTextColorBoxDecorationWithRadiusElevation(
                                            4, 1, fieldColor3),
                                    child: CustomizedButton(
                                      text: "Company / Organization",
                                      buttonWidth: Get.height * 0.2,
                                      textStyle: regularWhiteText13(bgColor),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            verticalSpace(height: Get.height * .007),
                            Divider(
                              color: dividerColor,
                              thickness: 1.5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Text('Basecamp',
                                          style: regularWhiteText15(bgColor),
                                          textAlign: TextAlign.start),
                                    ),
                                    Text(
                                      'Where is your business located',
                                      style: regularWhiteText11(darkGreyColor),
                                    ),
                                  ],
                                ),
                                Text(
                                  'Los Angeles, CA',
                                  style: regularWhiteText13(darkGreyColor),
                                ),
                              ],
                            ),
                            Divider(
                              color: dividerColor,
                              thickness: 1.5,
                            ),
                            verticalSpace(height: Get.height * .025),
                            ExpandTapWidget(
                              tapPadding: const EdgeInsets.all(10),
                              onTap: () {
                                Get.toNamed(NamedRoutes.routeHome);
                              },
                              child: Text(
                                "Next",
                                style: boldWhiteText17(bgColor),
                              ),
                            ),
                          ]),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
