import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/core/utils/colors.dart';
import 'package:restaurant_app/core/utils/f_class.dart';
import 'package:restaurant_app/core/utils/size_config.dart';
import 'package:restaurant_app/pages/details/widgets/rate_driver.dart';
import 'package:restaurant_app/widgets/f_app_bar.dart';
import 'package:restaurant_app/widgets/f_divider.dart';
import 'package:restaurant_app/widgets/f_elevated_button.dart';
import 'package:restaurant_app/widgets/f_dialogs.dart';
import 'package:restaurant_app/widgets/svg_image.dart';

class OrderDetails extends StatefulWidget {
  OrderDetails({Key key}) : super(key: key);

  @override
  _OrderDetailsState createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {

  @override
  Widget build(BuildContext context) {
    final theme = FClass().getFTheme(context);
    final size = FClass().getFSize(context);
    SizeConfig().init(context);
    return Scaffold(
      appBar: FAppBar("Order Details", context),
      body: Stack(
        children: [
          ListView(
            physics: BouncingScrollPhysics(),
            children: [
              SizedBox(height: getProportionateScreenWidth(10),),
              Container(
                padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Order Competed", style: theme.textTheme.bodyText1.copyWith(color: primaryColor),),
                    Text("See chat history", style: theme.textTheme.subtitle1.copyWith(color: Colors.grey.shade600),),
                  ],
                ),
              ),
              SizedBox(height: getProportionateScreenWidth(25),),
              Container(
                padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
                child: Text("Deliver to", style: theme.textTheme.bodyText1.copyWith(color: Colors.black),),
              ),
              SizedBox(height: getProportionateScreenWidth(15),),
              Container(
                padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
                child: Row(
                  children: [
                    Container(
                      height: getProportionateScreenWidth(90),
                      width: getProportionateScreenWidth(90),
                      margin: EdgeInsets.only(right: getProportionateScreenWidth(20)),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(getProportionateScreenWidth(10)),
                        color: primaryColor,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Michael - 0356634221", style: theme.textTheme.bodyText1.copyWith(color: Colors.black),),
                        Text("123 Avenue Street", style: theme.textTheme.bodyText1.copyWith(color: Colors.black),),
                        GestureDetector(
                          child: Text("Add details", style: theme.textTheme.subtitle2.copyWith(color: Colors.black),
                          )
                        ),
                      ],
                    )
                  ],
                ),
              ),
              FCustomDivider(),
              ListTile(
                leading: Container(
                  padding: EdgeInsets.all(getProportionateScreenWidth(12)),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(getProportionateScreenWidth(6)),
                    border: Border.all(color: blueColor, width: 2)
                  ),
                  child: Text("1x",),
                ),
                title: Text("Fried Chicken", style: theme.textTheme.bodyText2,),
                subtitle: Text('Teriyaki sauce', style: theme.textTheme.subtitle2.copyWith(color: blueColor)),
                trailing: Text("\$150"),
              ),
              FCustomDivider(),
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Payment Method", style: theme.textTheme.bodyText1.copyWith(color: Colors.black),),
                        Text("Change", style: theme.textTheme.bodyText1.copyWith(color: primaryColor),),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: getProportionateScreenWidth(9)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: getProportionateScreenWidth(100),
                          height: getProportionateScreenHeight(50),
                          child: SvgImage("assets/icons/mastercard.svg"),
                        ),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(text: "••••••••", style: theme.textTheme.bodyText2.copyWith(letterSpacing: 2.0, fontSize: 20.0),),
                              TextSpan(
                                text: " 914",

                              )
                            ]
                          )
                        )
                      ],
                    ),
                  ),
                ],
              ),
              FCustomDivider(),
              Container(
                padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Subtotal (1 item)", style: theme.textTheme.subtitle2.copyWith(color: Colors.black),),
                    Text("\$150", style: theme.textTheme.subtitle2.copyWith(color: Colors.black),),
                  ],
                ),
              ),
              SizedBox(height: getProportionateScreenWidth(9),),
              Container(
                padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Ship Fee (1.5km)", style: theme.textTheme.subtitle2.copyWith(color: Colors.black),),
                    Text("\$10", style: theme.textTheme.subtitle2.copyWith(color: Colors.black),),
                  ],
                ),
              ),
              SizedBox(height: getProportionateScreenWidth(15),),
              Container(
                padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Total", style: theme.textTheme.headline4.copyWith(color: Colors.black),),
                    Text("\$160", style: theme.textTheme.headline4.copyWith(color: primaryColor),),
                  ],
                ),
              ),
              FCustomDivider(),
              ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
                leading: Icon(Icons.assignment),
                title: Text("Note", style: theme.textTheme.bodyText2),
                trailing: Text("None", style: theme.textTheme.bodyText2),
              ),
              SizedBox(
                height: getProportionateScreenWidth(50),
              )
            ],
          ),
          Positioned(
            bottom: getProportionateScreenWidth(10),
            left: getProportionateScreenWidth(20),
            right: getProportionateScreenWidth(20),
            child: FittedBox(
              child: Row(
                children: [
                  Container(
                    width: size.width/2,
                    child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: primaryColor, width: 1.5),
                          padding: EdgeInsets.symmetric( vertical: getProportionateScreenWidth(11)),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),

                        ),
                        onPressed: () {
                          showDialog(context: context, builder: (context) {
                            return Container(
                              color: Colors.transparent,
                              margin: EdgeInsets.symmetric(
                                vertical: getProportionateScreenWidth(50),
                                horizontal: getProportionateScreenWidth(20),
                              ),
                                child: RateDriver());
                          });
                        },
                        child: Text("Rate us", style: theme.textTheme.headline5
                            .copyWith(color: primaryColor),)
                    ),
                  ),
                  SizedBox(width: getProportionateScreenWidth(10),),
                  Container(
                    width: size.width/2,
                    child: ElevatedButton(
                        child: Text("Re-Order"),
                        style: ElevatedButton.styleFrom(
                            primary: theme.primaryColor,
                            elevation: 0,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(getProportionateScreenWidth(15))),
                            padding: EdgeInsets.symmetric(vertical: 11),
                            textStyle: theme.textTheme.headline5),
                        onPressed: () {
                          showModalBottomSheet(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(getProportionateScreenWidth(20)),
                                    topRight: Radius.circular(getProportionateScreenWidth(20)),
                                  )
                              ),
                              context: context,
                              builder: (context) => fSuccessDialog(context)
                          );
                        },
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}