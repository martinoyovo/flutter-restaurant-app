import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/core/utils/f_class.dart';
import 'package:restaurant_app/core/utils/size_config.dart';

Widget FElevatedButton(BuildContext context, VoidCallback callback, String text) {
  final theme = FClass().getFTheme(context);
  return Container(
    width: double.infinity,
      //padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: ElevatedButton(
        child: Text(text),
        style: ElevatedButton.styleFrom(
            primary: theme.primaryColor,
            elevation: 0,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(getProportionateScreenWidth(15))),
            padding: EdgeInsets.symmetric(vertical: 11),
            textStyle: theme.textTheme.headline5),
        onPressed: callback
      ),
  );
}