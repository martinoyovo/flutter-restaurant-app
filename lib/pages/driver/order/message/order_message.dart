import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/core/utils/colors.dart';
import 'package:restaurant_app/core/utils/f_class.dart';
import 'package:restaurant_app/core/utils/size_config.dart';
import 'package:restaurant_app/widgets/f_app_bar.dart';

class OrderMessage extends StatefulWidget {
  @override
  _OrderMessageState createState() => _OrderMessageState();
}

class _OrderMessageState extends State<OrderMessage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final theme = FClass().getFTheme(context);
    final size = FClass().getFSize(context);
    return Scaffold(
      appBar: FAppBar("Message", context),
      body: Stack(
        children: [
          ListView(
            padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
            physics: BouncingScrollPhysics(),
            children: [
              Container(
                margin: EdgeInsets.only(bottom: getProportionateScreenHeight(40),),
                child: Row(
                  children: [
                    Container(
                      height: getProportionateScreenWidth(44),
                      width: getProportionateScreenWidth(44),
                      margin: EdgeInsets.only(bottom: getProportionateScreenHeight(30), right: getProportionateScreenHeight(12)),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(getProportionateScreenWidth(30)),
                        color: primaryColor
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.all(getProportionateScreenWidth(13)),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            color: Colors.grey.shade200
                          ),
                          child: SizedBox(
                            width: size.width*0.69,
                            child: Text(
                              "I’m on my way. Do you need any further assistance?",
                              softWrap: true,
                              style: theme.textTheme.bodyText2.copyWith(color: purpleColor),),
                          ),
                        ),
                        SizedBox(height: getProportionateScreenHeight(12),),
                        Text("2 minutes ago", style: theme.textTheme.subtitle2.copyWith(color: Colors.grey),)
                      ],
                    ),
                    SizedBox(width: getProportionateScreenWidth(15),),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: getProportionateScreenHeight(40),),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(width: getProportionateScreenWidth(15),),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          padding: EdgeInsets.all(getProportionateScreenWidth(13)),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            color: primaryColor
                          ),
                          child: Flex(
                            direction: Axis.horizontal,
                            children: [
                              Text("No thanks ^^", style: theme.textTheme.bodyText2.copyWith(color: Colors.white),),
                            ],
                          ),
                        ),
                        SizedBox(height: getProportionateScreenHeight(12),),
                        Text("2 minutes ago", style: theme.textTheme.subtitle2.copyWith(color: Colors.grey),)
                      ],
                    ),
                    Container(
                      height: getProportionateScreenWidth(44),
                      width: getProportionateScreenWidth(44),
                      margin: EdgeInsets.only(bottom: getProportionateScreenHeight(30), left: getProportionateScreenHeight(12)),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(getProportionateScreenWidth(30)),
                          color: blueColor
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20), vertical: getProportionateScreenWidth(15)),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(color: Colors.grey.shade200, blurRadius: 7, spreadRadius: 7)
                ],
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(getProportionateScreenWidth(20)),
                      topRight: Radius.circular(getProportionateScreenWidth(20),)
                  ),
                color: Colors.white
              ),
              child: ListTile(
                leading: Container(
                  child: InkWell(
                    child: Icon(CupertinoIcons.photo, color: Colors.black87, size: getProportionateScreenWidth(25),),
                  ),
                ),
                title: Flexible(
                  child: TextField(
                    style: theme.textTheme.bodyText2.copyWith(color: Colors.black87),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(0),
                      hintText: "Enter your message...",
                      hintStyle: theme.textTheme.bodyText2.copyWith(color: Colors.black87),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                trailing: InkWell(
                  child: Text('Send', style: theme.textTheme.bodyText2.copyWith(color: primaryColor),)
                )
              ),
            ),
          )
        ],
      ),
    );
  }
}
