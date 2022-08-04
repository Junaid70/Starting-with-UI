import 'package:expand_tap_area/expand_tap_area.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../service_locator.dart';
import '../utils/colors.dart';
import '../utils/constants.dart';
import '../utils/form_helper.dart';
import '../utils/styles.dart';
import '../utils/utils.dart';
import '../utils/widgets.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
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
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Get.height * 0.04202),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/ic_logo.png',
            width: Get.height * 0.1,
            height: Get.height * 0.0725,
            fit: BoxFit.contain,
          ),
          verticalSpace(height: Get.height * 0.03045),
          Container(
            height: Get.height * 0.04,
            child: CutomizedTextField(
              hintText: 'Username',
              autoFocus: false,
              passwordVisible: false,
              keyboard: TextInputType.name,
              saveData: (Value) {},
            ),
          ),
          verticalSpace(height: Get.height * 0.006),
          Container(
            height: Get.height * 0.04,
            child: CutomizedTextField(
              hintText: 'Password',
              autoFocus: false,
              passwordVisible: true,
              keyboard: TextInputType.visiblePassword,
              saveData: (Value) {},
            ),
          ),
          verticalSpace(height: Get.height * 0.01),
          TextButton(
            onPressed: () {
              Get.toNamed(NamedRoutes.routeMain);
            },
            child: Text(
              'Login',
              style: regularWhiteText13(textColor),
            ),
          ),
          verticalSpace(height: Get.height * 0.02),
          Text('Forgot Password', style: regularWhiteText13(fieldColor2)),
          verticalSpace(height: Get.height * 0.03),
          Row(children: <Widget>[
            Expanded(
              child: new Container(
                  margin: const EdgeInsets.only(right: 20.0),
                  child: Divider(
                    thickness: 1,
                    color: fieldColor,
                    height: 36,
                  )),
            ),
            TextButton(
              onPressed: () {
                Get.toNamed(NamedRoutes.routeMain);
              },
              child: Text(
                'Sign Up',
                style: regularWhiteText13(textColor),
              ),
            ),
            Expanded(
              child: new Container(
                  margin: const EdgeInsets.only(
                    left: 20.0,
                  ),
                  child: Divider(
                    thickness: 1,
                    color: fieldColor,
                    height: 36,
                  )),
            ),
          ]),
        ],
      ),
    );
  }
}
