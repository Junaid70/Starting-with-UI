import 'package:flutter/material.dart';

import 'colors.dart';

appCounterDecoration(color) => BoxDecoration(
      shape: BoxShape.circle,
      color: color,
    );
var appSeparationLineDecoration = BoxDecoration(
  shape: BoxShape.rectangle,
  color: Colors.grey.withOpacity(0.3),
);

var appSeparationDarkLineDecoration = const BoxDecoration(
  shape: BoxShape.rectangle,
  color: Colors.grey,
);

rectangularWhiteBoxDecorationWithRadius(double radius) => BoxDecoration(
    shape: BoxShape.rectangle,
    borderRadius: BorderRadius.circular(radius),
    color: Colors.white);

rectangularWhiteBoxDecorationWithRadiusElevation(
        double radius, double elevation) =>
    BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(radius),
        color: bgColor,
        boxShadow: [
          BoxShadow(
            color: bgColor,
            offset: const Offset(0.0, 0.0), //(x,y)
            blurRadius: elevation,
          ),
        ]);
rectangularWhiteBoxDecorationWithRadiusElevationwithBackgroundImage(
        double radius, double elevation, String image) =>
    BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(radius),
        color: Colors.white,
        image: DecorationImage(fit: BoxFit.fill, image: AssetImage(image)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: const Offset(0.0, 0.0), //(x,y)
            blurRadius: elevation,
          ),
        ]);
rectangularWhiteBoxDecorationWithRadiusElevationwithBackgroundNetworkImage(
        double radius, double elevation, String image) =>
    BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(radius),
        color: Colors.white,
        image: DecorationImage(
          fit: BoxFit.fill,
          image: NetworkImage(image),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: const Offset(0.0, 0.0), //(x,y)
            blurRadius: elevation,
          ),
        ]);

rectangularAppBarBoxDecorationWithRadiusElevation(
        double radius, double elevation, {Color? color}) =>
    BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(radius),
        color: (color != null) ? color : appBarColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: const Offset(0.0, 0.0), //(x,y)
            blurRadius: elevation,
          ),
        ]);

rectangularAppBarBoxDecorationWithBlackRadiusElevation(
        double radius, double elevation, {Color? color}) =>
    BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(radius),
        color: (color != null) ? color : appBarColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            offset: const Offset(0.0, 0.0), //(x,y)
            blurRadius: elevation,
          ),
        ]);

rectangularGreyBoxDecorationWithRadiusElevation(
        double radius, double elevation) =>
    BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(radius),
        color: appBarColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: const Offset(0.0, 0.0), //(x,y)
            blurRadius: elevation,
          ),
        ]);

rectangularDarkGreyBoxDecorationWithRadiusElevation(
        double radius, double elevation) =>
    BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(radius),
        color: darkGreyColor.withOpacity(0.4),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: const Offset(0.0, 0.0), //(x,y)
            blurRadius: elevation,
          ),
        ]);

rectangularDarkAppBarColorBoxDecorationWithRadiusElevation(
        double radius, double elevation) =>
    BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(radius),
        color: darkGrayColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: const Offset(0.0, 0.0), //(x,y)
            blurRadius: elevation,
          ),
        ]);

densedFieldDecorationWithoutPadding(
        {hint, verticalPad = 0.0, horizontalPad = 0.0}) =>
    InputDecoration(
      isDense: true,
      counterText: '',
      contentPadding: EdgeInsets.symmetric(
          vertical: verticalPad, horizontal: horizontalPad),
      border: InputBorder.none,
      hintText: hint,
    );

rectangularTextColorBoxDecorationWithRadiusElevation(
        double radius, double elevation) =>
    BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(radius),
        color: bgColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: const Offset(0.0, 1.0), //(x,y)
            blurRadius: elevation,
          ),
        ]);
rectangularCustomTextColorBoxDecorationWithRadiusElevation(
        double radius, double elevation, Color color) =>
    BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(radius),
        color: color,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: const Offset(0.0, 1.0), //(x,y)
            blurRadius: elevation,
          ),
        ]);
rectangularFieldColorBoxDecorationWithRadiusElevation(
        double radius, double elevation) =>
    BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(radius),
        color: fieldColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: const Offset(0.0, 1.0), //(x,y)
            blurRadius: elevation,
          ),
        ]);

rectangularContainerBoxDecorationWithRadiusElevation(
        double radius, double elevation) =>
    BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(radius),
        color: containerColor,
        boxShadow: [
          BoxShadow(
            color: surveyListContainerColor,
            offset: const Offset(0.0, 0.0), //(x,y)
            blurRadius: elevation,
          ),
        ]);

rectangularCustomColorBoxDecorationWithRadius(
  double topLeft,
  double bottomLeft,
  double bottomRight,
  double topRight,
  Color color,
) =>
    BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(topLeft),
            bottomLeft: Radius.circular(bottomLeft),
            bottomRight: Radius.circular(bottomRight),
            topRight: Radius.circular(topRight)),
        color: color);

optionsBoxDecoration() => BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(30),
    border: Border.all(
      color: Colors.black,
      width: 0.6,
    ));

selectedOptionsBoxDecoration() => BoxDecoration(
    borderRadius: BorderRadius.circular(30),
    border: Border.all(color: appBarColor, width: 2.0),
    color: Colors.white);

ellipticalCustomColorBoxDecorationWithRadius(
  double x,
  double y,
  Color color,
) =>
    BoxDecoration(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.elliptical(
            x,
            y,
          ),
        ),
        color: color);

rectangularTextColorBoxDecorationWithDarkRadiusElevation(
        double radius, double elevation) =>
    BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(radius),
        color: darkGrayColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: const Offset(0.0, 0.0), //(x,y)
            blurRadius: elevation,
          ),
        ]);

rectangularTransparentBoxDecorationWithRadiusElevation(
        double radius, double elevation) =>
    BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(radius),
        color: Colors.transparent,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: const Offset(0.0, 0.0), //(x,y)
            blurRadius: elevation,
          ),
        ]);

rectangularGreyBorderDecorationWithRadius(double radius) => BoxDecoration(
      shape: BoxShape.rectangle,
      borderRadius: BorderRadius.all(Radius.circular(radius)),
      border: Border.all(color: textColor),
    );

rectangularAppBarColorBoxDecorationWithRadius(
  double topLeft,
  double bottomLeft,
  double bottomRight,
  double topRight,
  Color color,
) =>
    BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(topLeft),
            bottomLeft: Radius.circular(bottomLeft),
            bottomRight: Radius.circular(bottomRight),
            topRight: Radius.circular(topRight)),
        color: color);

rectangularOrangeColorBoxDecorationWithRadius(
  double topLeft,
  double bottomLeft,
  double bottomRight,
  double topRight,
) =>
    BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(topLeft),
            bottomLeft: Radius.circular(bottomLeft),
            bottomRight: Radius.circular(bottomRight),
            topRight: Radius.circular(topRight)),
        color: orangeColor);
ellipticalCustomColorBoxDecorationWithRadiusTop(
  double x,
  double y,
  double elevation,
  Color color,
) =>
    BoxDecoration(
        borderRadius: BorderRadius.vertical(
          top: Radius.elliptical(
            x,
            y,
          ),
        ),
        color: color,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: const Offset(-1, -1), //(x,y)
            blurRadius: elevation,
          ),
        ]);
