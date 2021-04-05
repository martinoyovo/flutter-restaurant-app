import 'package:flutter/material.dart';
import 'package:food_mobile/core/utils/f_class.dart';
import 'package:food_mobile/core/utils/size_config.dart';
import 'package:food_mobile/widgets/svg_image.dart';

import 'f_elevated_button.dart';

Widget fModalDialog(BuildContext context) {
  final theme = FClass().getFTheme(context);
  final size = FClass().getFSize(context);
  return Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
            margin: EdgeInsets.only(bottom: getProportionateScreenWidth(10)),
            child: SvgImage("assets/icons/validate.svg")
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width*0.3, vertical: getProportionateScreenWidth(10)),
          child: Center(
            child: Text(
              "Thank you for your order!",
              style: theme.textTheme.headline6.copyWith(color: Color(0xFF0C0B52)),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width*0.25),
          child: Center(
            child: Text(
              "Rate us so that we can improve our service",
              style: theme.textTheme.subtitle2.copyWith(color: Colors.grey.shade600),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        SizedBox(height: 3,),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: FElevatedButton(
            context,
                () {
            },
            "Rate us",
          ),
        ),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          margin: EdgeInsets.only(top: getProportionateScreenWidth(5), bottom: getProportionateScreenWidth(10)),
          child: FlatButton(
            onPressed: () {
            },
            textColor: theme.primaryColor,
            padding: EdgeInsets.symmetric(vertical: 11),
            child: Text("Maybe next time", style: theme.textTheme.headline4),
            highlightColor: theme.primaryColor.withOpacity(0.2),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(getProportionateScreenWidth(15))),
          ),
        )
      ],
    ),
  );
}