import 'package:animated_widgets/animated_widgets.dart';
import 'package:biz/stores/main_screen_store.dart';
import 'package:biz/utils/colors.dart';
import 'package:expand_tap_area/expand_tap_area.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../service_locator.dart';
import '../../utils/constants.dart';
import '../../utils/decorations.dart';
import '../../utils/json_utils.dart';
import '../../utils/styles.dart';
import '../../utils/utils.dart';

class TalentListPopup extends StatelessWidget {
  final MainScreenStore _mainScreenStore = getIt<MainScreenStore>();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      width: Get.width,
      decoration: rectangularAppBarBoxDecorationWithRadiusElevation(0, 4,
          color: Colors.black.withOpacity(0.9)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          verticalSpace(height: 20),
          Text(
            'Bizlist',
            style: boldWhiteText22(fieldColor),
          ),
          verticalSpace(height: 4),
          Text(
            'Please select a rolodex',
            style: regularWhiteText11(fieldColor4),
          ),
          verticalSpace(height: 20),
          Container(
            height: Get.height * 0.21,
            width: Get.width,
            child: ListView.builder(
              itemCount: 4,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ExpandTapWidget(
                          tapPadding: const EdgeInsets.all(10),
                          onTap: () {
                            _mainScreenStore.isfirst = false;
                            Get.offAllNamed(NamedRoutes.routeTalent);
                          },
                          child: TranslationAnimatedWidget.tween(
                            duration: Duration(milliseconds: 900),
                            translationDisabled: Offset(0, 50),
                            translationEnabled: Offset(0, 0),
                            child: OpacityAnimatedWidget.tween(
                              opacityEnabled: 1,
                              opacityDisabled: 0,
                              child: Text(
                                TalentListDetail[index]['Text'].toString(),
                                style: boldWhiteText15(textColor),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    verticalSpace(height: 20),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
