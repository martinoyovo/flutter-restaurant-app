import 'package:flutter/material.dart';
import 'package:food_mobile/core/utils/colors.dart';
import 'package:food_mobile/core/utils/f_class.dart';
import 'package:food_mobile/core/utils/size_config.dart';
import 'package:food_mobile/widgets/f_app_bar.dart';
import 'package:geolocator/geolocator.dart';

class TrackOrder extends StatefulWidget {
  TrackOrder({Key key}) : super(key: key);

  @override
  _TrackOrderState createState() => _TrackOrderState();
}

class _TrackOrderState extends State<TrackOrder> {
  bool _isChecked = false;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: FAppBar("Track your order", context),
      body: Container(
        padding:
        EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: Column(
          children: [
            trackHeader(),
            SizedBox(height: getProportionateScreenWidth(30),),
            trackStatus()
          ],
        ),
      ),
    );
  }

  Widget trackHeader() {
    final theme = FClass().getFTheme(context);
    return Container(
        padding: EdgeInsets.all(14),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius:
          BorderRadius.circular(getProportionateScreenWidth(5)),
          color: Colors.grey.shade300,
        ),
        child: FittedBox(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: getProportionateScreenWidth(55),
                width: getProportionateScreenWidth(55),
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
                  Text("Delivery Time: 10.45 AM", style: theme.textTheme.subtitle2.copyWith(color: Colors.black),),
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
                              color: blueColor),
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
                              color: blueColor),
                          child: Icon(
                            Icons.messenger,
                            color: Colors.white,
                          )),
                      onTap: () {
                        Navigator.pushNamed(context, "/orderMessage");
                      }),
                ],
              ),
            ],
          ),
        ));
  }
  Widget trackStatus() {
    final theme = FClass().getFTheme(context);
    final size = FClass().getFSize(context);
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(top: getProportionateScreenWidth(13), left: getProportionateScreenWidth(11)),
          width: getProportionateScreenWidth(2),
          height: size.height*0.46,
          decoration: BoxDecoration(
              color: Colors.grey.shade400
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            trackItem("Order Confirmed", "Your Order has been received", context),
            trackItem("Order Prepared", "Your Order has been prepared", context),
            trackItem("Order In Progress", "Your food is on the way to you", context),
            trackItem("Delivered", "Wish you have an interesting experience", context),
            trackItem("Rate Us", "Help us improve our service", context)
          ],
        ),
      ],
    );
  }

  Widget trackItem(title, subtitle, context) {
    final theme = FClass().getFTheme(context);
    return Container(
      margin: EdgeInsets.only(bottom: getProportionateScreenWidth(30)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            child: Icon(_isChecked?Icons.check_box_rounded:Icons.check_box_outline_blank_rounded, color: blueColor,),
            onTap: () {
              setState(() {
                _isChecked =!_isChecked;
              });
            },
          ),
          SizedBox(width: getProportionateScreenWidth(10),),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title),
              Text(subtitle, style: theme.textTheme.subtitle2.copyWith(color: Colors.grey.shade600),),
            ],
          ),
        ],
      ),
    );
  }
}
