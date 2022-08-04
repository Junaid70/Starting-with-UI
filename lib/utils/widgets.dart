// ignore_for_file: unused_field, must_be_immutable
import 'dart:developer';

import 'package:biz/utils/styles.dart';
import 'package:biz/utils/utils.dart';
import 'package:expand_tap_area/expand_tap_area.dart';
import 'package:animations/animations.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_shadow/simple_shadow.dart';
import '../controllers/state_controllers/main_screen_controller.dart';
import 'colors.dart';
import 'decorations.dart';

class MyScaffold extends StatelessWidget {
  final Widget? body, drawer, bottomNavigationBar;
  final PreferredSizeWidget? appBar;
  final Color backgroundColor;
  final Key? scaffoldKey;
  bool? resizeToAvoidBottomInset = true;

  MyScaffold({
    Key? key,
    this.body,
    this.drawer,
    this.appBar,
    this.bottomNavigationBar,
    this.backgroundColor = appBarColor,
    this.scaffoldKey,
    this.resizeToAvoidBottomInset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      key: scaffoldKey,
      backgroundColor: backgroundColor,
      appBar: appBar,
      body: body,
      drawer: drawer,
      bottomNavigationBar: bottomNavigationBar,
      extendBody: true,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
    );
  }
}

class CircularAvatarWithAssetImage extends StatelessWidget {
  final String imagePath;
  final double imageSize, imageWidth, imageHeight;

  const CircularAvatarWithAssetImage({
    Key? key,
    required this.imagePath,
    required this.imageSize,
    this.imageWidth = 0.0,
    this.imageHeight = 0.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: (imageWidth > 0) ? imageWidth : imageSize,
      height: (imageHeight > 0) ? imageHeight : imageSize,
      child: ClipRRect(
          borderRadius: BorderRadius.circular(imageSize),
          child: Image.asset(imagePath)),
    );
  }
}

class CircularAvatar extends StatelessWidget {
  final String imagePath;
  final double imageSize, imageWidth, imageHeight;

  const CircularAvatar({
    Key? key,
    required this.imagePath,
    required this.imageSize,
    this.imageWidth = 0.0,
    this.imageHeight = 0.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: (imageWidth > 0) ? imageWidth : imageSize,
      height: (imageHeight > 0) ? imageHeight : imageSize,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(imageSize),
        child: GenericCachedNetworkImage(
          imagePath: imagePath,
        ),
      ),
    );
  }
}

class CustomizedTouchEventIconButton extends StatelessWidget {
  final String path;
  final double width;
  final double height;
  final VoidCallback callback;
  final color;

  const CustomizedTouchEventIconButton(
      {Key? key,
      required this.path,
      required this.width,
      required this.height,
      this.color = null,
      required this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Image.asset(
        path,
        width: width,
        height: height,
        color: color,
      ),
      onPressed: callback,
    );
  }
}

class GenericCachedNetworkImage extends StatelessWidget {
  final String imagePath;

  const GenericCachedNetworkImage({Key? key, required this.imagePath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imagePath,
      placeholder: (_, url) => const PlaceholderWidget(),
      errorWidget: (_, url, error) => const PlaceholderWidget(),
      fit: BoxFit.fill,
    );
  }
}

class PlaceholderWidget extends StatelessWidget {
  const PlaceholderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/ic_placeholder_thumbnail.png',
      fit: BoxFit.fill,
    );
  }
}

class CustomizedButton extends StatelessWidget {
  final String text;
  final String imgb;
  final String imgf;
  final double verticalPadding;
  final Color textColor;
  final double buttonWidth;
  final double buttonHeight;
  final Color imageColor;
  final double imageHeight;
  final double imageWidth;
  final TextStyle? textStyle;
  const CustomizedButton(
      {Key? key,
      required this.text,
      this.verticalPadding = 0,
      this.textColor = Colors.white,
      this.imgf = '',
      this.imgb = '',
      this.buttonWidth = 130,
      this.buttonHeight = 35,
      this.imageHeight = 20,
      this.imageWidth = 20,
      this.textStyle,
      this.imageColor = Colors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: verticalPadding),
        child: SizedBox(
          height: buttonHeight,
          width: buttonWidth,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              isEmpty(imgb)
                  ? Container()
                  : Row(
                      children: [
                        Image.asset(
                          imgb,
                          height: imageHeight,
                          width: imageWidth,
                          color: imageColor,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                      ],
                    ),
              Text(
                text,
                style: textStyle,
              ),
              isEmpty(imgf)
                  ? Container()
                  : Row(
                      children: [
                        const SizedBox(
                          width: 5,
                        ),
                        Image.asset(
                          imgf,
                          height: imageHeight,
                          width: imageWidth,
                          color: imageColor,
                        ),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

class GenericProgressBar extends StatelessWidget {
  const GenericProgressBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      color: orangeColor,
    );
  }
}

class CutomizedTextField extends StatelessWidget {
  String prefixImage, hintText, _phone = "", _password = "";
  bool passwordVisible;
  TextInputType? keyboard;
  TextEditingController? descriptionController;
  final FormFieldValidator<String>? validator;
  // final Function(bool)? callbackFocus;
  void Function(String? data)? saveData;
  bool autoFocus;

  CutomizedTextField({
    Key? key,
    required this.passwordVisible,
    required this.keyboard,
    this.descriptionController,
    this.prefixImage = "",
    this.hintText = "",
    required this.saveData,
    this.validator,
    this.autoFocus = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleShadow(
      opacity: 0.3, // Default: 0.5

      offset: const Offset(1.5, 1.5), // Default: Offset(2, 2)
      sigma: 4,
      child: TextFormField(
        autofocus: autoFocus,
        onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
        textInputAction: TextInputAction.next,
        validator: validator,
        controller: descriptionController,
        keyboardType: keyboard,
        obscureText: passwordVisible,
        cursorColor: appBarColor,
        decoration: InputDecoration(
          isDense: true,
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.0),
            borderSide: BorderSide.none,
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          hintStyle: const TextStyle(
            color: textFormFieldColor,
            fontWeight: FontWeight.w400,
            fontSize: 14,
          ),
          hintText: hintText,
          prefixIconConstraints: const BoxConstraints(),
          // prefixIcon: (prefixImage.isNotEmpty)
          //     ? Padding(
          //         padding: const EdgeInsets.only(
          //             top: 12.0, bottom: 12, left: 30, right: 12),
          //         child: Image.asset(
          //           prefixImage,
          //           height: 16,
          //           width: 16,
          //         ),
          //       )
          //     : ,
        ),
        onSaved: saveData,
        onChanged: (value) {
          _password = value;
        },
      ),
    );
  }
}

class CutomizedSearchTextField extends StatelessWidget {
  String prefixImage, hintText, _phone = "", _password = "";
  bool passwordVisible;
  TextInputType? keyboard;
  TextEditingController? descriptionController;
  final FormFieldValidator<String>? validator;
  // final Function(bool)? callbackFocus;
  void Function(String? data)? saveData;
  bool autoFocus;

  CutomizedSearchTextField({
    Key? key,
    required this.passwordVisible,
    required this.keyboard,
    this.descriptionController,
    this.prefixImage = "",
    this.hintText = "",
    required this.saveData,
    this.validator,
    this.autoFocus = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleShadow(
      opacity: 0.3, // Default: 0.5

      offset: const Offset(1.5, 1.5), // Default: Offset(2, 2)
      sigma: 4,
      child: TextFormField(
        autofocus: autoFocus,
        onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
        textInputAction: TextInputAction.next,
        validator: validator,
        controller: descriptionController,
        keyboardType: keyboard,
        obscureText: passwordVisible,
        cursorColor: appBarColor,
        decoration: InputDecoration(
            isDense: true,
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4.0),
              borderSide: BorderSide.none,
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            hintStyle: const TextStyle(
              color: textFormFieldColor,
              fontWeight: FontWeight.w400,
              fontSize: 14,
            ),
            hintText: hintText,
            prefixIconConstraints: const BoxConstraints(),
            prefixIcon: Padding(
              padding: const EdgeInsets.only(
                  top: 12.0, bottom: 12, left: 30, right: 12),
              child: Image.asset(
                prefixImage,
                height: 16,
                width: 16,
              ),
            )),
        onSaved: saveData,
        onChanged: (value) {
          _password = value;
        },
      ),
    );
  }
}

class GenericCard extends StatelessWidget {
  const GenericCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 13,
      color: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(50)),
      ),
      child: Image.asset(
        'assets/images/ic_circular_logo.png',
        height: 96,
        width: 96,
      ),
    );
  }
}

class IntroScreen extends StatelessWidget {
  final VoidCallback moveBack, moveForward;

  const IntroScreen(
      {Key? key, required this.moveBack, required this.moveForward})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          elevation: 13,
          color: Colors.white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(60)),
          ),
          child: Image.asset(
            'assets/images/ic_circular_logo.png',
            height: Get.height * 0.110,
          ),
        ),
        verticalSpace(height: Get.height * .04),
        Text(
          'How it Works',
          style: boldWhiteText18(darkGrayColor),
          textAlign: TextAlign.center,
        ),
        verticalSpace(height: Get.height * .021),
        Text(
          'Create Your Profile',
          style: regularWhiteText18(textColor),
          textAlign: TextAlign.center,
        ),
        verticalSpace(height: Get.height * .012),
        Text(
          'Answer Surveys',
          style: regularWhiteText18(textColor),
          textAlign: TextAlign.center,
        ),
        verticalSpace(height: Get.height * .012),
        Text(
          'Support Your Causes',
          style: regularWhiteText18(textColor),
          textAlign: TextAlign.center,
        ),
        verticalSpace(height: Get.height * .020),
        Text(
          'I am over the age of 18',
          style: boldWhiteText18(darkGrayColor),
          textAlign: TextAlign.center,
        ),
        verticalSpace(height: Get.height * .047),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // GestureDetector(
            //   onTap: moveBack,
            //   child: Image.asset(
            //     'assets/images/ic_move_back.png',
            //     height: 69.92,
            //   ),
            // ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: moveForward,
                    child: Container(
                      decoration:
                          rectangularTextColorBoxDecorationWithRadiusElevation(
                              8, 4),
                      child: CustomizedButton(
                        text: 'Continue',
                        buttonWidth: 94,
                        textStyle: regularWhiteText14(fieldColor),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // GestureDetector(
            //   onTap: moveForward,
            //   child: Image.asset(
            //     'assets/images/ic_move_forward.png',
            //     height: 69.92,
            //   ),
            // ),
          ],
        ),
      ],
    );
  }
}

class HomeAppBar extends StatelessWidget {
  final Color drawerColor;
  final Color logoColor;

  double logoHieght;

  HomeAppBar({
    Key? key,
    this.logoHieght = .088,
    this.drawerColor = Colors.white,
    this.logoColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ExpandTapWidget(
          tapPadding: EdgeInsets.all(10),
          onTap: () {},
          child: Container(
            child: Image.asset(
              "assets/images/ic_setting.png",
              height: 25,
              width: 25,
            ),
          ),
        ),
        Row(
          children: [
            Image.asset(
              'assets/images/ic_logo.png',
              height: 25,
              width: 35,
              color: fieldColor,
            ),
          ],
        ),
        Row(
          children: [
            Image.asset(
              'assets/images/ic_profile_dot.png',
              height: 25,
              width: 28,
            ),
          ],
        ),
      ],
    );
  }
}

class MyAppBar extends StatelessWidget {
  final Color drawerColor;
  final Color logoColor;
  bool isBackRequired,
      isCenteredLogoRequired,
      isBackLogoRequired,
      isQuestionScreen,
      isSignUpScreen,
      appdrawer;
  double logoHieght;

  MyAppBar({
    Key? key,
    this.logoHieght = .088,
    this.drawerColor = Colors.white,
    this.logoColor = Colors.white,
    this.isBackRequired = false,
    this.isBackLogoRequired = true,
    this.isCenteredLogoRequired = true,
    this.isQuestionScreen = false,
    this.isSignUpScreen = false,
    this.appdrawer = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        isBackLogoRequired
            ? ExpandTapWidget(
                tapPadding: EdgeInsets.all(10),
                onTap: () {
                  log('message');
                  Get.back();
                  // Navigator.pop(context);
                },
                child: appdrawer
                    ? Container(
                        child: Image.asset(
                          isBackRequired
                              ? "assets/images/ic_back_button.png"
                              : "assets/images/ic_drawer_menu.png",
                          height: isBackRequired ? 20.62 : 20,
                          width: isBackRequired ? 13.15 : 20,
                          color: fieldColor,
                        ),
                      )
                    : Container(),
              )
            : Opacity(
                opacity: 0.0,
                child: Image.asset(
                  "assets/images/ic_drawer_menu.png",
                  height: 20,
                  width: 20,
                ),
              ),
        isSignUpScreen
            ? Container(
                width: Get.width * .23,
                padding: EdgeInsets.only(left: appdrawer ? 0 : 20),
                child: Text(
                  'Sign Up',
                  style: boldWhiteText22(fieldColor),
                ),
              )
            : Container(),
        isCenteredLogoRequired
            ? GestureDetector(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.only(left: appdrawer ? 0 : 13),
                  height: Get.height * logoHieght,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.asset(
                        "assets/images/ic_app_logo.png",
                        height: 46.43,
                        width: 82.34,
                        color: logoColor,
                      ),
                    ],
                  ),
                ),
              )
            : Container(),
      ],
    );
  }
}

class ContactusAppBar extends StatelessWidget {
  final Color drawerColor;
  final Color logoColor;
  final String title;
  double logoHieght;

  ContactusAppBar({
    Key? key,
    this.logoHieght = .088,
    this.drawerColor = Colors.white,
    this.logoColor = Colors.white,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ExpandTapWidget(
          tapPadding: EdgeInsets.all(10),
          onTap: () {
            MainScreenController controller = Get.find();
            controller.openDrawer();
            // Navigator.pop(context);
          },
          child: Container(
            child: Image.asset(
              "assets/images/ic_drawer_menu.png",
              height: 25,
              width: 25,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 10),
          child: Row(
            children: [
              Text(
                title,
                style: regularWhiteText17(fieldColor),
              ),
              horizontalSpace(width: 5),
              Image.asset(
                'assets/images/ic_down.png',
                height: 15,
                width: 7.4,
                color: fieldColor,
              ),
            ],
          ),
        ),
        Row(
          children: [
            Image.asset(
              'assets/images/ic_phone_icon.png',
              height: 25,
              width: 25,
              color: fieldColor4,
            ),
            horizontalSpace(width: 10),
            Image.asset(
              'assets/images/ic_list_icon.png',
              height: 25,
              width: 25,
              color: fieldColor4,
            ),
          ],
        ),
      ],
    );
  }
}

class MyTalentAppBar extends StatelessWidget {
  final Color drawerColor;
  final Color logoColor;
  bool isBackRequired,
      isCenteredLogoRequired,
      isBackLogoRequired,
      isQuestionScreen,
      isTalentScreen,
      appdrawer;
  double logoHieght;

  MyTalentAppBar({
    Key? key,
    this.logoHieght = .088,
    this.drawerColor = Colors.white,
    this.logoColor = Colors.white,
    this.isBackRequired = false,
    this.isBackLogoRequired = true,
    this.isCenteredLogoRequired = true,
    this.isQuestionScreen = false,
    this.isTalentScreen = false,
    this.appdrawer = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        isBackLogoRequired
            ? ExpandTapWidget(
                tapPadding: EdgeInsets.all(10),
                onTap: () {
                  log('message');
                  Get.back();
                  // Navigator.pop(context);
                },
                child: appdrawer
                    ? Container(
                        child: Image.asset(
                          isBackRequired
                              ? "assets/images/ic_back_button.png"
                              : "assets/images/ic_drawer_menu.png",
                          height: isBackRequired ? 20.62 : 20,
                          width: isBackRequired ? 13.15 : 20,
                          color: fieldColor,
                        ),
                      )
                    : Container(),
              )
            : Opacity(
                opacity: 0.0,
                child: Image.asset(
                  "assets/images/ic_drawer_menu.png",
                  height: 20,
                  width: 20,
                ),
              ),
        isTalentScreen
            ? Container(
                width: Get.width * .42,
                padding: EdgeInsets.only(left: appdrawer ? 0 : 20),
                child: Column(
                  children: [
                    Text(
                      'Tiffany Kontoyiannis',
                      style: regularWhiteText17(fieldColor),
                    ),
                    verticalSpace(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Producer',
                          style: boldWhiteText13(fieldColor4),
                        ),
                        horizontalSpace(width: 3),
                        Image.asset(
                          'assets/images/ic_down.png',
                          height: 14,
                          width: 9,
                          color: fieldColor4,
                        ),
                      ],
                    ),
                  ],
                ),
              )
            : Container(),
        isCenteredLogoRequired
            ? GestureDetector(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.only(left: appdrawer ? 0 : 13),
                  height: Get.height * logoHieght,
                  child: Image.asset(
                    "assets/images/ic_three_dots.png",
                    height: 22,
                    width: 22,
                    color: logoColor,
                  ),
                ),
              )
            : Container(),
      ],
    );
  }
}

class MyTextField extends StatelessWidget {
  bool obscureText;
  int textLength;
  TextInputType keyboardType;
  TextAlign textAlign;
  String? hint;
  double verticalPad, horizontalPad;
  Function(String)? onChanged;
  TextEditingController? controller = TextEditingController();
  MyTextField({
    Key? key,
    this.obscureText = false,
    this.textLength = 100,
    this.keyboardType = TextInputType.text,
    this.textAlign = TextAlign.start,
    this.hint,
    this.verticalPad = 0.0,
    this.horizontalPad = 0.0,
    this.onChanged,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextField(
        decoration: densedFieldDecorationWithoutPadding(
            hint: hint, verticalPad: verticalPad, horizontalPad: horizontalPad),
        keyboardType: keyboardType,
        obscureText: obscureText,
        textAlign: textAlign,
        maxLength: textLength,
        onChanged: onChanged,
        controller: controller,
      ),
    );
  }
}

class AnimatedContainerWrapper extends StatelessWidget {
  const AnimatedContainerWrapper({
    Key? key,
    required this.closedBuilder,
    required this.openBuilder,
    required this.transitionType,
    required this.onClosed,
  }) : super(key: key);

  final Widget closedBuilder;
  final Widget openBuilder;
  final ContainerTransitionType transitionType;
  final ClosedCallback<bool?> onClosed;

  @override
  Widget build(BuildContext context) {
    return OpenContainer<bool>(
      closedColor: Colors.transparent,
      openElevation: 0,
      closedElevation: 0,
      transitionType: transitionType,
      openBuilder: (_, v) => openBuilder,
      onClosed: onClosed,
      tappable: true,
      closedBuilder: (_, v) => closedBuilder,
    );
  }
}

class FadeIndexedStack extends StatefulWidget {
  final int index;
  final List<Widget> children;
  final Duration duration;

  const FadeIndexedStack({
    Key? key,
    required this.index,
    required this.children,
    this.duration = const Duration(
      milliseconds: 100,
    ),
  }) : super(key: key);

  @override
  _FadeIndexedStackState createState() => _FadeIndexedStackState();
}

class _FadeIndexedStackState extends State<FadeIndexedStack>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void didUpdateWidget(FadeIndexedStack oldWidget) {
    if (widget.index != oldWidget.index) {
      _controller.forward(from: 0.0);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _controller,
      child: IndexedStack(
        index: widget.index,
        children: widget.children,
      ),
    );
  }
}

class HideScrollBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}

BoxDecoration backgroundImage() {
  return const BoxDecoration(
    image: DecorationImage(
      image: AssetImage('assets/images/ic_background.png'),
      fit: BoxFit.fill,
    ),
  );
}

Widget cardList(String img, String name, {String? disc}) {
  return Expanded(
    child: Container(
      child: ListTile(
        leading: Image.asset(
          img,
          scale: 3,
        ),
        title: Text(
          name,
          style: TextStyle(color: Colors.black, fontSize: Get.width * 0.045),
        ),
        trailing: Text(
          (disc != null) ? disc : '',
          style: TextStyle(
              color: Colors.grey.withOpacity(0.30),
              fontSize: Get.width * 0.035),
        ),
      ),
    ),
  );
}
