import 'package:flutter/material.dart';
import 'package:restaurant_app/core/utils/colors.dart';
import 'package:restaurant_app/core/utils/f_class.dart';
import 'package:restaurant_app/core/utils/size_config.dart';

Widget ItemInfos({BuildContext context, Map<String, dynamic> item}) {
  final theme = FClass().getFTheme(context);
  final size = FClass().getFSize(context);
  return SizedBox(
    height: getProportionateScreenHeight(160),
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
              Text(item["title"], style: theme.textTheme.headline5),
              SizedBox(height: getProportionateScreenHeight(5),),
              Text(item["address"], style: theme.textTheme.bodyText1.copyWith(color: Colors.grey)),
              Divider(thickness: 0.5, color: Colors.grey),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                        children: [
                          Icon(Icons.star_rounded, color: Colors.yellow),
                          Text("${item["rate"]}", style: theme.textTheme.subtitle1.copyWith(color: blueColor))
                        ]
                    ),
                    Row(
                        children: [
                          Icon(Icons.alarm_rounded, color: blueColor),
                          Text("${item["time"]} mins", style: theme.textTheme.subtitle1.copyWith(color: blueColor))
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
                          Text("${item["status"]}", style: theme.textTheme.subtitle1.copyWith(color: blueColor))
                        ]
                    ),
                  ]
              )
            ]
        )
    ),
  );
}