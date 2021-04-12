import 'package:flutter/material.dart';
import 'package:food_mobile/core/utils/colors.dart';
import 'package:food_mobile/core/utils/f_class.dart';
import 'package:food_mobile/core/utils/size_config.dart';
import 'package:food_mobile/widgets/f_app_bar.dart';

class SeeAll extends StatefulWidget {
  SeeAll({Key key}) : super(key: key);

  @override
  _SeeAllState createState() => _SeeAllState();
}

class _SeeAllState extends State<SeeAll> {
  @override
  Widget build(BuildContext context) {
    final theme = FClass().getFTheme(context);
    final size = FClass().getFSize(context);
    SizeConfig().init(context);
    return Scaffold(
      appBar: FAppBar("You often order...", context),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(15)),
          physics: BouncingScrollPhysics(),
          itemCount:  4,
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
    );
  }
}