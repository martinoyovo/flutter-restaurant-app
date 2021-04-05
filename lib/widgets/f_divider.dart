import 'package:flutter/material.dart';
import 'package:food_mobile/core/utils/size_config.dart';

Widget FCustomDivider() => Padding(
  padding: EdgeInsets.symmetric(vertical: getProportionateScreenWidth(10)),
  child: Divider(
    thickness: 7,
    color: Colors.grey.shade200,
  ),
);