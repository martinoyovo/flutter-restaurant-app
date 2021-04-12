import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_mobile/core/utils/colors.dart';
import 'package:food_mobile/core/utils/f_class.dart';
import 'package:food_mobile/core/utils/size_config.dart';
import 'package:food_mobile/widgets/f_app_bar.dart';
import 'package:food_mobile/widgets/svg_image.dart';

import 'f_elevated_button.dart';

Widget fSuccessDialog(BuildContext context) {
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

Widget fOrderDialog(BuildContext context) {
  final theme = FClass().getFTheme(context);
  final size = FClass().getFSize(context);
  return Container(
    padding: EdgeInsets.only(bottom: getProportionateScreenWidth(10)),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FAppBar("Customize the item", context),
          FittedBox(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20), vertical: getProportionateScreenWidth(7)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: getProportionateScreenWidth(70),
                    width: getProportionateScreenWidth(70),
                    margin: EdgeInsets.only(
                        right: getProportionateScreenWidth(15)),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                          getProportionateScreenWidth(8)),
                      color: primaryColor,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Fried Chicken",
                        style: theme.textTheme.bodyText2
                            .copyWith(color: Colors.black),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical:
                            getProportionateScreenWidth(2)),
                        child: Text(
                          "Always a picnic favorite",
                          style: theme.textTheme.subtitle1.copyWith(
                              color: Colors.grey.shade600),
                        ),
                      ),
                      Text(
                        "D150",
                        style: theme.textTheme.bodyText2
                            .copyWith(color: primaryColor),
                      ),
                    ],
                  ),
                  IconButton(
                    icon: Icon(Icons.remove_circle_outline_rounded),
                    color: Colors.grey.shade400,
                    iconSize: getProportionateScreenWidth(35),
                    onPressed: () {
                      showBottomSheet(
                        context: context,
                        builder: (context) => Container(
                          padding: EdgeInsets.symmetric(vertical: getProportionateScreenWidth(5), horizontal: getProportionateScreenWidth(10)),
                          color: primaryColor,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal:
                                    getProportionateScreenWidth(
                                        12),
                                    vertical:
                                    getProportionateScreenWidth(
                                        7)),
                                decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(3),
                                    color: Colors.white
                                        .withOpacity(0.4)),
                                child: Text(
                                  "1",
                                  style: theme.textTheme.bodyText2
                                      .copyWith(
                                      color: Colors.white,
                                      fontWeight:
                                      FontWeight.bold),
                                ),
                              ),
                              InkWell(
                                child: Text(
                                  "View Order",
                                  style: theme.textTheme.bodyText2
                                      .copyWith(
                                      color: Colors.white),
                                ),
                                onTap: () {
                                  showModalBottomSheet(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(getProportionateScreenWidth(20)),
                                            topRight: Radius.circular(getProportionateScreenWidth(20)),
                                          )
                                      ),
                                      context: context,
                                      builder: (context) => fOrderDialog(context)
                                  );
                                },
                              ),
                              OutlinedButton(
                                onPressed: () {},
                                child: Text("\$150",
                                    style: theme
                                        .textTheme.bodyText2
                                        .copyWith(
                                        color: Colors.white)),
                                style: OutlinedButton.styleFrom(
                                  primary: blueColor,
                                  elevation: 0,
                                  side: BorderSide(
                                      color: Colors.white,
                                      width: 1),
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.circular(
                                          getProportionateScreenWidth(
                                              3))),
                                  padding: EdgeInsets.symmetric(
                                      vertical: 0),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  Text(
                    "1",
                    style: theme.textTheme.headline5
                        .copyWith(color: Colors.black),
                  ),
                  IconButton(
                    icon: Icon(Icons.add_circle_rounded),
                    color: primaryColor,
                    iconSize: getProportionateScreenWidth(35),
                    onPressed: () {
                      showBottomSheet(
                        context: context,
                        builder: (context) => Container(
                          padding: EdgeInsets.symmetric(vertical: getProportionateScreenWidth(5), horizontal: getProportionateScreenWidth(10)),
                          color: primaryColor,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal:
                                    getProportionateScreenWidth(
                                        12),
                                    vertical:
                                    getProportionateScreenWidth(
                                        7)),
                                decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(3),
                                    color: Colors.white
                                        .withOpacity(0.4)),
                                child: Text(
                                  "1",
                                  style: theme.textTheme.bodyText2
                                      .copyWith(
                                      color: Colors.white,
                                      fontWeight:
                                      FontWeight.bold),
                                ),
                              ),
                              InkWell(
                                child: Text(
                                  "View Order",
                                  style: theme.textTheme.bodyText2
                                      .copyWith(
                                      color: Colors.white),
                                ),
                                onTap: () {
                                  showModalBottomSheet(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(getProportionateScreenWidth(20)),
                                            topRight: Radius.circular(getProportionateScreenWidth(20)),
                                          )
                                      ),
                                      context: context,
                                      builder: (context) => fOrderDialog(context)
                                  );
                                },
                              ),
                              OutlinedButton(
                                onPressed: () {},
                                child: Text("\$150",
                                    style: theme
                                        .textTheme.bodyText2
                                        .copyWith(
                                        color: Colors.white)),
                                style: OutlinedButton.styleFrom(
                                  primary: blueColor,
                                  elevation: 0,
                                  side: BorderSide(
                                      color: Colors.white,
                                      width: 1),
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.circular(
                                          getProportionateScreenWidth(
                                              3))),
                                  padding: EdgeInsets.symmetric(
                                      vertical: 0),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
            child: Divider(
              thickness: 1.2,
              color: Colors.grey.shade400,
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
            child: Text(
              "Choose sauce",
              style: theme.textTheme.bodyText2
                  .copyWith(color: Colors.black),
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
              physics: BouncingScrollPhysics(),
              children: [
                ListTile(
                  contentPadding: EdgeInsets.all(0),
                  leading: Checkbox(
                    value: false,
                    onChanged: (val) {
                      print(val);
                    },
                  ),
                  title: Text("Honey BBQ", style: theme.textTheme.bodyText1.copyWith(color: Colors.black)),
                  trailing: Text("+ \$0", style: theme.textTheme.bodyText1.copyWith(color: Colors.black)),
                ),
                ListTile(
                  contentPadding: EdgeInsets.all(0),
                  leading: Checkbox(
                    value: true,
                    onChanged: (val) {
                      print(val);
                    },
                  ),
                  title: Text("Teriyaki sauce", style: theme.textTheme.bodyText1.copyWith(color: Colors.black)),
                  trailing: Text("+ \$0", style: theme.textTheme.bodyText1.copyWith(color: Colors.black)),
                ),
                ListTile(
                  contentPadding: EdgeInsets.all(0),
                  leading: Checkbox(
                    value: false,
                    onChanged: (val) {
                      print(val);
                    },
                  ),
                  title: Text("Honey Mustard", style: theme.textTheme.bodyText1.copyWith(color: Colors.black)),
                  trailing: Text("+ \$0", style: theme.textTheme.bodyText1.copyWith(color: Colors.black)),
                ),
                ListTile(
                  contentPadding: EdgeInsets.all(0),
                  leading: Checkbox(
                    value: false,
                    onChanged: (val) {
                      print(val);
                    },
                  ),
                  title: Text("Chilli sauce", style: theme.textTheme.bodyText1.copyWith(color: Colors.black)),
                  trailing: Text("+ \$0", style: theme.textTheme.bodyText1.copyWith(color: Colors.black)),
                ),
              ],
            ),
          ),
          Container(
              padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
              child: FElevatedButton(context, () {}, "Add to cart"))
        ],
      ),
  );
}