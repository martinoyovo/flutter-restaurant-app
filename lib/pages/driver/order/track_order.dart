import 'package:flutter/material.dart';
import 'package:food_mobile/core/utils/colors.dart';
import 'package:food_mobile/core/utils/f_class.dart';
import 'package:food_mobile/core/utils/size_config.dart';
import 'package:food_mobile/widgets/f_app_bar.dart';

class TrackOrder extends StatefulWidget {
  TrackOrder({Key key}) : super(key: key);

  @override
  _TrackOrderState createState() => _TrackOrderState();
}

class _TrackOrderState extends State<TrackOrder> {
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
          color: Colors.grey.shade200,
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
                      onTap: () {}),
                ],
              ),
            ],
          ),
        ));
  }
  Widget trackStatus() {
    final theme = FClass().getFTheme(context);
    final size = FClass().getFSize(context);
    return Container(
      margin: EdgeInsets.only(left: getProportionateScreenWidth(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                margin: EdgeInsets.only(top: getProportionateScreenWidth(10)),
                width: getProportionateScreenWidth(2),
                height: size.height*0.48,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300
                ),
              ),
              Positioned(
                top: 0,
                left: 10,
                right: getProportionateScreenWidth(60),
                child: Icon(Icons.check_box_rounded, color: primaryColor,),
              )
            ],
          ),
          SizedBox(width: getProportionateScreenWidth(50),),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Order Confirmed"),
                    Text("Your Order has been received", style: theme.textTheme.subtitle2.copyWith(color: Colors.grey.shade600),),
                  ],
                ),
                SizedBox(height: getProportionateScreenWidth(30),),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Order Prepared"),
                    Text("Your Order has been prepared", style: theme.textTheme.subtitle2.copyWith(color: Colors.grey.shade600),),
                  ],
                ),
                SizedBox(height: getProportionateScreenWidth(30),),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Order In Progress"),
                    Text("Your food is on the way to you", style: theme.textTheme.subtitle2.copyWith(color: Colors.grey.shade600),),
                  ],
                ),
                SizedBox(height: getProportionateScreenWidth(30),),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Delivered"),
                    Text("Wish you have an interesting experience", style: theme.textTheme.subtitle2.copyWith(color: Colors.grey.shade600),),
                  ],
                ),
                SizedBox(height: getProportionateScreenWidth(30),),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Rate Us"),
                    Text("Help us improve our service", style: theme.textTheme.subtitle2.copyWith(color: Colors.grey.shade600),),
                  ],
                ),
              ],
            )
          )
        ],
      ),
    );
  }
}
