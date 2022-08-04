import 'package:animations/animations.dart';
import 'package:biz/utils/form_helper.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../service_locator.dart';
import '../utils/colors.dart';

import '../utils/styles.dart';
import '../utils/utils.dart';
import '../utils/widgets.dart';
import 'my_biz_code_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
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
                HomeAppBar(),
                verticalSpace(height: Get.height * 0.02045),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    children: [
                      Container(
                        height: Get.height * 0.14,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Image.asset(
                                  'assets/images/ic_mybiz.png',
                                  height: Get.height * 0.09,
                                  width: Get.height * 0.09,
                                ),
                                verticalSpace(height: Get.height * 0.00345),
                                Text('Add bizCard',
                                    style: regularWhiteText15(fieldColor)),
                              ],
                            ),
                            AnimatedContainerWrapper(
                              openBuilder: MyBizCodeScreen(),
                              onClosed: (bool? data) {},
                              transitionType: ContainerTransitionType.fade,
                              closedBuilder: Column(
                                children: [
                                  Image.asset(
                                    'assets/images/Circle2.png',
                                    height: Get.height * 0.09,
                                    width: Get.height * 0.09,
                                  ),
                                  verticalSpace(height: Get.height * 0.00345),
                                  Text('Eric Mitro',
                                      style: regularWhiteText15(textColor)),
                                  verticalSpace(height: Get.height * 0.00245),
                                  Text('My bizCard',
                                      style: regularWhiteText13(textColor)),
                                ],
                              ),
                            ),
                            Column(
                              children: [
                                Image.asset(
                                  'assets/images/ic_biz_qr.png',
                                  height: Get.height * 0.09,
                                  width: Get.height * 0.09,
                                ),
                                verticalSpace(height: Get.height * 0.00345),
                                Text('Add bizCard',
                                    style: regularWhiteText15(fieldColor)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                verticalSpace(height: Get.height * 0.02045),
              ],
            ),
          ),
          verticalSpace(height: Get.height * 0.0145),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                padding: EdgeInsets.only(
                    top: Get.height * 0.005, left: 10, right: 10),
                color: fieldColor,
                child: Column(
                  children: List.generate(
                      10,
                      (index) => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: Get.height * 0.0175),
                                child: ListTile(
                                  leading: Image.asset(
                                    'assets/images/Circle2.png',
                                    height: Get.height * 0.09,
                                    width: Get.height * 0.09,
                                  ),
                                  title: RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'You',
                                          style: boldWhiteText13(bgColor),
                                        ),
                                        TextSpan(
                                          text: ' updated your headshot',
                                          style: regularWhiteText13(bgColor),
                                        ),
                                        TextSpan(
                                          text: ' 1h',
                                          style:
                                              regularWhiteText11(darkGreyColor),
                                        ),
                                      ],
                                    ),
                                  ),
                                  trailing: Image.asset(
                                    'assets/images/ic_more.png',
                                    height: Get.height * 0.015,
                                    width: Get.height * 0.015,
                                  ),
                                ),
                              ),
                              Divider(
                                color: dividerColor,
                                thickness: 1.2,
                              ),
                            ],
                          )),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
