import 'package:flutter/material.dart';
import 'package:food_mobile/core/utils/size_config.dart';

InputDecoration fInputDecoration(text, theme, suffix) {
  return InputDecoration(
    labelText: text,
    hintText: text,
    errorStyle: theme.inputDecorationTheme.errorStyle,
    labelStyle: theme.inputDecorationTheme.labelStyle,
    contentPadding: EdgeInsets.all(getProportionateScreenWidth(10)),
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(getProportionateScreenWidth(15))),
    suffixIcon: suffix?? Container()
  );
}