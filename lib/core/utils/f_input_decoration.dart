import 'package:flutter/material.dart';
import 'package:restaurant_app/core/utils/size_config.dart';

InputDecoration fInputDecoration(text, theme, suffix) {
  return InputDecoration(
    labelText: text,
    hintText: text,
    errorStyle: theme.inputDecorationTheme.errorStyle,
    labelStyle: theme.inputDecorationTheme.labelStyle,
    hintStyle: theme.inputDecorationTheme.hintStyle,
    contentPadding: EdgeInsets.all(getProportionateScreenWidth(10)),
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(getProportionateScreenWidth(15))),
    suffixIcon: suffix?? Container()
  );
}