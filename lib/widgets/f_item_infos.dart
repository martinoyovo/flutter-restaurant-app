import 'package:flutter/material.dart';
import 'package:food_mobile/core/utils/colors.dart';
import 'package:food_mobile/core/utils/f_class.dart';
import 'package:food_mobile/core/utils/size_config.dart';

Widget FHomeSlider({BuildContext context, Map<String, String> list}) {
  final theme = FClass().getFTheme(context);
  final size = FClass().getFSize(context);
  return SizedBox(
    height: getProportionateScreenHeight(170),
    child: Container(
        margin: EdgeInsets.fromLTRB(getProportionateScreenWidth(15),0,getProportionateScreenWidth(15),getProportionateScreenWidth(10),),
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
              Text(list["titre"], style: theme.textTheme.headline5),
              Text(list["soutitre"], style: theme.textTheme.bodyText1.copyWith(color: Colors.grey)),
              Divider(thickness: 0.5, color: Colors.grey),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                        children: [
                          Icon(Icons.star_rounded, color: Colors.yellow),
                          Text(list["review"], style: theme.textTheme.subtitle1.copyWith(color: blueColor))
                        ]
                    ),
                    Row(
                        children: [
                          Icon(Icons.alarm_rounded, color: blueColor),
                          Text(list["status"], style: theme.textTheme.subtitle1.copyWith(color: blueColor))
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
    ),
  );
}