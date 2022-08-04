import 'package:biz/utils/form_helper.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../service_locator.dart';
import '../utils/colors.dart';

import '../utils/utils.dart';
import '../utils/widgets.dart';

class GeneralScreen extends StatelessWidget {
  GeneralScreen({Key? key}) : super(key: key);
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
            MyAppBar(
              isBackRequired: true,
              isBackLogoRequired: true,
              isCenteredLogoRequired: false,
              isSignUpScreen: true,
            ),
          ],
        ),
      ),
    );
  }
}
