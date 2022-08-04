import 'package:biz/screens/Dialogues/talent_list_dailog.dart';
import 'package:biz/screens/chat_screen.dart';
import 'package:biz/screens/contact_screen.dart';
import 'package:biz/screens/profile_screen.dart';
import 'package:biz/screens/scan_screen.dart';
import 'package:biz/utils/form_helper.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';

import '../controllers/state_controllers/main_screen_controller.dart';
import '../service_locator.dart';
import '../stores/main_screen_store.dart';
import '../utils/colors.dart';

import '../utils/decorations.dart';
import '../utils/dialogs.dart';
import '../utils/json_utils.dart';
import '../utils/styles.dart';
import '../utils/utils.dart';
import '../utils/widgets.dart';
import 'home_screen.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final CustomFormHelper _customFormHelper = getIt<CustomFormHelper>();
  final MainScreenStore _mainScreenStore = getIt<MainScreenStore>();
  var pages = [
    HomeScreen(),
    ContactScreeen(),
    ScanScreen(),
    ChatScreeen(),
    ProfileScreen(),
  ];
  late MainScreenController mainScreenController;
  Widget child = TalentListPopup();
  @override
  void initState() {
    super.initState();
    mainScreenController = Get.put(MainScreenController());
    Future.delayed(Duration(microseconds: 10), () async {
      if (_mainScreenStore.isfirst) {
        showDialogwithnoPadding(
          context,
          child,
          true,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    FocusScopeNode currentFocus = FocusScope.of(context);
    return GestureDetector(
      onTap: () {
        _customFormHelper.checkfocus(context, currentFocus);
      },
      child: MyScaffold(
        scaffoldKey: mainScreenController.scaffoldState,
        drawer: getDrawer(size),
        backgroundColor: bgColor,
        body: getBody(size),
        bottomNavigationBar: getBottomNavigationBar(),
      ),
    );
  }

  getDrawer(Size size) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          // Container(
          //   height: size.height * 0.25,
          //   child: DrawerHeader(
          //     child: Stack(
          //       children: [
          //         Center(child: Observer(builder: (_) {
          //           return Row(
          //             children: [
          //               Container(
          //                 margin: EdgeInsets.only(left: 5),
          //                 width: 76,
          //                 height: 76,
          //                 decoration: BoxDecoration(
          //                     shape: BoxShape.rectangle,
          //                     color: Colors.white,
          //                     borderRadius: BorderRadius.circular(10)),
          //                 child: Container(
          //                   width: 76,
          //                   height: 76,
          //                   decoration: BoxDecoration(
          //                     shape: BoxShape.rectangle,
          //                   ),
          //                   child: ClipRRect(
          //                     borderRadius: BorderRadius.circular(10),
          //                     child: CachedNetworkImage(
          //                       imageUrl: _authStore
          //                               .userProfileData?.userProfileImage ??
          //                           '',
          //                       placeholder: (context, value) =>
          //                           Image.asset('assets/images/ic_profile.png'),
          //                       errorWidget: (context, url, error) =>
          //                           Image.asset('assets/images/ic_profile.png'),
          //                       fit: BoxFit.cover,
          //                     ),
          //                   ),
          //                 ),
          //               ),
          //               SizedBox(
          //                 width: Get.height * 0.008,
          //               ),
          //               Column(
          //                 crossAxisAlignment: CrossAxisAlignment.start,
          //                 mainAxisAlignment: MainAxisAlignment.center,
          //                 children: [
          //                   Expanded(
          //                     flex: 0,
          //                     child: Text(
          //                       _authStore.userProfileData?.displayName ??
          //                           'Hello',
          //                       // "${globalUserModel?.userName}",
          //                       maxLines: 2,
          //                       softWrap: false,
          //                       overflow: TextOverflow.ellipsis,
          //                       style: TextStyle(
          //                         fontSize: 18,
          //                         color: Colors.white,
          //                         fontWeight: FontWeight.w500,
          //                       ),
          //                     ),
          //                   ),
          //                   Expanded(
          //                     flex: 0,
          //                     child: Text(
          //                       _authStore.userProfileData?.email ??
          //                           "Hello@gmail.com",
          //                       // "${globalUserModel?.userName}",
          //                       maxLines: 2,
          //                       softWrap: true,
          //                       overflow: TextOverflow.ellipsis,
          //                       style: TextStyle(
          //                         fontSize: 11,
          //                         color: Colors.white,
          //                         fontWeight: FontWeight.w500,
          //                       ),
          //                     ),
          //                   ),
          //                 ],
          //               )
          //             ],
          //           );
          //         }))
          //       ],
          //     ),
          //     decoration: BoxDecoration(color: darkAppBarColor),
          //   ),
          // ),
          verticalSpace(height: Get.height * 0.02),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    _mainScreenStore.indexPage = 0;
                    MainScreenController controller = Get.find();

                    controller.closeDrawer();
                  },
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Image.asset(
                            "assets/images/ic_inactive_home.png",
                            height: 20,
                            width: 20,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'Home',
                            style: boldWhiteText14(darkGrayColor),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          verticalSpace(height: Get.height * 0.4),
          // if app is in debug mode, show the debug menu
          Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            child: (kReleaseMode != false)
                ? Column(
                    children: [
                      Text('version 1.0'),
                      Text('29:07:2022'),
                    ],
                  )
                : Container(),
          )
        ],
      ),
    );
  }

  getBody(Size size) {
    return SafeArea(
      child: Observer(builder: (_) {
        return FadeIndexedStack(
          index: _mainScreenStore.indexPage,
          children: pages,
        );
      }),
    );
  }

  getBottomNavigationBar() {
    return Container(
      decoration: rectangularWhiteBoxDecorationWithRadiusElevation(0, 4),
      child: Padding(
        padding: const EdgeInsets.only(top: 5, bottom: 10),
        child: Observer(builder: (_) {
          return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(icons.length, (index) {
                return IconButton(
                  onPressed: () async {
                    FocusScopeNode currentFocus = FocusScope.of(context);
                    _customFormHelper.checkfocus(context, currentFocus);

                    _mainScreenStore.indexPage = index;
                  },
                  icon: Image.asset(
                    _mainScreenStore.indexPage == index
                        ? icons[index]['active'].toString()
                        : icons[index]['inactive'].toString(),
                    width: 25,
                    height: 25,
                  ),
                );
              }));
        }),
      ),
    );
  }
}
