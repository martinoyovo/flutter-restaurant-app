import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_mobile/core/utils/colors.dart';
import 'package:food_mobile/core/utils/f_class.dart';
import 'package:food_mobile/core/utils/size_config.dart';
import 'package:food_mobile/widgets/f_app_bar.dart';
import 'package:food_mobile/widgets/f_divider.dart';
import 'package:food_mobile/widgets/f_elevated_button.dart';
import 'package:food_mobile/widgets/f_modal_dialog.dart';
import 'package:food_mobile/widgets/svg_image.dart';

class DetailsMyOrder extends StatefulWidget {
  DetailsMyOrder({Key key}) : super(key: key);

  @override
  _DetailsMyOrderState createState() => _DetailsMyOrderState();
}

class _DetailsMyOrderState extends State<DetailsMyOrder> {
  @override
  Widget build(BuildContext context) {
    final theme = FClass().getFTheme(context);
    SizeConfig().init(context);
    return Scaffold(
      appBar: FAppBar("Confirm Order", context),
      body: Stack(
        children: [
          ListView(
            physics: BouncingScrollPhysics(),
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Deliver to", style: theme.textTheme.bodyText1.copyWith(color: Colors.black),),
                    Text("Edit", style: theme.textTheme.subtitle1.copyWith(color: primaryColor),),
                  ],
                ),
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
              ListTile(
                title: Text("Promotion code", style: theme.textTheme.bodyText2,),
                trailing: InkWell(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20), vertical: getProportionateScreenWidth(6)),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.grey.shade200
                    ),
                    child: Text('Enter code', style: theme.textTheme.subtitle2.copyWith(color: blueColor),)
                  ),
                  onTap: () {

                  },
                )
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
            child: FElevatedButton(context, () {
              showModalBottomSheet(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(getProportionateScreenWidth(20)),
                    topRight: Radius.circular(getProportionateScreenWidth(20)),
                  )
                ),
                context: context,
                builder: (context) => fModalDialog(context)
              );
            }, "Submit - \$160"),
          )
        ],
      ),
    );
  }
}