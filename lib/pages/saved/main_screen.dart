import 'package:flutter/material.dart';
import 'package:food_mobile/core/utils/colors.dart';
import 'package:food_mobile/core/utils/f_class.dart';
import 'package:food_mobile/core/utils/size_config.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final theme = FClass().getFTheme(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
          title: Text(
            "Latest",
            style: theme.textTheme.headline5.copyWith(color: Colors.black),
          )
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(15)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
           mainAxisAlignment: MainAxisAlignment.start,
           children: [
            Expanded(
              child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount:  2,
                  itemBuilder: (index, context) {
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: getProportionateScreenWidth(7)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: getProportionateScreenWidth(100),
                            width: getProportionateScreenWidth(100),
                            margin: EdgeInsets.only(right: getProportionateScreenWidth(20)),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
                              color: blueColor,
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Daruma", style: theme.textTheme.bodyText1.copyWith(color: Colors.black),),
                                  SizedBox(width: getProportionateScreenWidth(50),),
                                  Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Icon(Icons.star_rounded, color: Colors.yellow),
                                        Text("4.9 (284)", style: theme.textTheme.subtitle1.copyWith(color: blueColor))
                                      ]
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: getProportionateScreenWidth(10)),
                                child: Text("189 Giang Vo", style: theme.textTheme.subtitle1.copyWith(color: Colors.grey),),
                              ),
                              Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.symmetric(vertical: getProportionateScreenWidth(5), horizontal: getProportionateScreenWidth((15))),
                                      margin: EdgeInsets.only(right: getProportionateScreenWidth((15))),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(11),
                                          color: Colors.grey.shade200
                                      ),
                                      child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Icon(Icons.alarm_rounded, color: theme.primaryColor),
                                            Text("5 mins", style: theme.textTheme.subtitle1.copyWith(color: purpleColor))
                                          ]
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(vertical: getProportionateScreenWidth(5), horizontal: getProportionateScreenWidth((15))),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(11),
                                          color: Colors.grey.shade200
                                      ),
                                      child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Icon(Icons.location_on_outlined, color: theme.primaryColor),
                                            Text("250 m", style: theme.textTheme.subtitle1.copyWith(color: purpleColor))
                                          ]
                                      ),
                                    ),
                                  ]
                              )
                            ],
                          )
                        ],
                      ),
                    );
                  }
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                  vertical: getProportionateScreenWidth(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "You often order...",
                    style: theme.textTheme.headline5,
                  ),
                  InkWell(
                    onTap: () => Navigator.pushNamed(context, "/seeAll"),
                    child: Text("Show all",
                        style: theme.textTheme.subtitle1
                            .copyWith(color: primaryColor)),
                  )
                ],
              ),
            ),
            Row(
              children: [
                order(),
              ],
            ),
            SizedBox(height: getProportionateScreenWidth(10),)
          ]
        ),
      )
    );
  }

  Widget order() {
    final theme = FClass().getFTheme(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: getProportionateScreenWidth(120),
          width: getProportionateScreenWidth(120),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
                getProportionateScreenWidth(10)),
            color: blueColor,
          ),
        ),
        SizedBox(height: getProportionateScreenWidth(8)),
        Text(
          "La Dabiane",
          style: theme.textTheme.bodyText1
              .copyWith(color: Colors.black),
        ),
        SizedBox(height: getProportionateScreenWidth(5)),
        Text(
          "Western Cuisine",
          style: theme.textTheme.subtitle1
              .copyWith(color: Colors.grey),
        ),
        SizedBox(height: getProportionateScreenWidth(5)),
        Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.star_rounded, color: Colors.yellow),
              Text("4.9 (284)",
                  style: theme.textTheme.subtitle1
                      .copyWith(color: blueColor))
            ]),
      ],
    );
  }
}
