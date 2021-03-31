import 'package:flutter/material.dart';
import 'package:food_mobile/core/utils/colors.dart';
import 'package:food_mobile/core/utils/f_class.dart';
import 'package:food_mobile/core/utils/size_config.dart';

Widget FHomeSlider(BuildContext context) {
  final theme = FClass().getFTheme(context);
  final size = FClass().getFSize(context);
  return Container(
      height: size.height*0.176,
      margin: EdgeInsets.fromLTRB(getProportionateScreenWidth(20),getProportionateScreenWidth(20),getProportionateScreenWidth(20),getProportionateScreenWidth(20),),
      padding: EdgeInsets.all(getProportionateScreenWidth(10)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            spreadRadius: 3
          )
        ]
      ),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("S&L Diner", style: theme.textTheme.headline5),
            Text("189 Avenue Street Edinbugh", style: theme.textTheme.bodyText1.copyWith(color: Colors.grey)),
            Divider(thickness: 0.5, color: Colors.grey),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                      children: [
                        Icon(Icons.star_rounded, color: Colors.yellow),
                        Text("4.0 (230)", style: theme.textTheme.subtitle1.copyWith(color: blueColor))
                      ]
                  ),
                  Row(
                      children: [
                        Icon(Icons.alarm_rounded, color: blueColor),
                        Text("15-25 mins", style: theme.textTheme.subtitle1.copyWith(color: blueColor))
                      ]
                  ),
                  Row(
                      children: [
                        Container(
                          height: 14,
                          width: 20,
                          margin: EdgeInsets.only(right: getProportionateScreenHeight(4)),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2),
                              color: blueColor
                          ),
                        ),
                        Text("Free", style: theme.textTheme.subtitle1.copyWith(color: blueColor))
                      ]
                  ),
                ]
            )
          ]
      )
  );
}