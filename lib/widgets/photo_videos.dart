import 'package:flutter/material.dart';
import 'package:food_mobile/core/utils/size_config.dart';

Widget photosnVideos(item) {
  return Container(
    height: getProportionateScreenWidth(95),
    width: getProportionateScreenWidth(95),
    margin: EdgeInsets.only(right: getProportionateScreenWidth(8), bottom: getProportionateScreenWidth(10)),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(getProportionateScreenWidth(10)),
        image: DecorationImage(
            image: NetworkImage(item),
            fit: BoxFit.cover
        )
    ),
  );
}