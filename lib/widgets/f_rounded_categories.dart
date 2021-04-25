
import 'package:flutter/material.dart';
import 'package:food_mobile/core/utils/size_config.dart';
import 'package:food_mobile/widgets/svg_image.dart';

Widget FRoundedCategories(String svgPath) {
  return Container(
    height: getProportionateScreenHeight(75),
    width: getProportionateScreenHeight(75),
    alignment: Alignment.center,
    decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
              spreadRadius: 2,
              blurRadius: 2,
              color: Colors.black12
          )
        ],
        color: Colors.white
    ),
    child: SvgImage(svgPath),
  );
}