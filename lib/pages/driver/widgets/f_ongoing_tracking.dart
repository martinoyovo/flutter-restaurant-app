import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_mobile/core/utils/colors.dart';
import 'package:food_mobile/core/utils/f_class.dart';
import 'package:food_mobile/core/utils/size_config.dart';
import 'package:food_mobile/widgets/f_dialogs.dart';

class FOngoingTracking extends StatefulWidget {
  FOngoingTracking({Key key}) : super(key: key);

  @override
  _FOngoingTrackingState createState() => _FOngoingTrackingState();
}

class _FOngoingTrackingState extends State<FOngoingTracking> {
  @override
  Widget build(BuildContext context) {
    final theme = FClass().getFTheme(context);
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(top: getProportionateScreenWidth(20)),
          color: primaryColor,
        ),
        Positioned(
          right: getProportionateScreenWidth(20),
          left: getProportionateScreenWidth(20),
          bottom: getProportionateScreenWidth(20),
          child: Container(
            padding: EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(getProportionateScreenWidth(15))
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Arriving in 8 minutes", style: theme.textTheme.bodyText2.copyWith(color: Colors.black)),
                    Text("Picked", style: theme.textTheme.subtitle2.copyWith(color: primaryColor)),
                  ],
                ),
                Divider(
                  color: Colors.grey.shade200,
                  thickness: 2,
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: getProportionateScreenWidth(7)),
                  child: InkWell(
                    onTap: () => Navigator.pushNamed(context, "/trackOrder"),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Food | S&L Diner", style: theme.textTheme.subtitle2.copyWith(color: Colors.black),),
                            Text("\$150 - 1 item - Cash", style: theme.textTheme.subtitle1.copyWith(color: Colors.black),),
                            Text("Michael - 0356634221", style: theme.textTheme.subtitle1.copyWith(color: Colors.black),),
                          ],
                        ),
                        Icon(CupertinoIcons.chevron_forward)
                      ],
                    ),
                  ),
                ),
                trackHeaderPrimary(context)
              ],
            ),
          ),
        )
      ],
    );
  }
}

Widget trackHeaderPrimary(context) {
  final theme = FClass().getFTheme(context);
  return FittedBox(
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: getProportionateScreenWidth(52),
          width: getProportionateScreenWidth(52),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                  getProportionateScreenWidth(30)),
              color: blueColor),
        ),
        SizedBox(width: getProportionateScreenWidth(10),),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("John Nguyen (Driver)"),
            Text("is heading to you", style: theme.textTheme.subtitle2.copyWith(color: Colors.black),),
          ],
        ),
        SizedBox(width: getProportionateScreenWidth(30),),
        Row(
          children: [
            InkWell(
                child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            getProportionateScreenWidth(30)),
                        color: primaryColor),
                    child: Icon(
                      Icons.call,
                      color: Colors.white,
                    )),
                onTap: () {}),
            SizedBox(width: getProportionateScreenWidth(10),),
            InkWell(
                child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            getProportionateScreenWidth(30)),
                        color: primaryColor),
                    child: Icon(
                      Icons.mail,
                      color: Colors.white,
                    )),
                onTap: () {
                }),
          ],
        ),
      ],
    ),
  );
}