import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/core/utils/colors.dart';
import 'package:restaurant_app/core/utils/f_class.dart';
import 'package:restaurant_app/core/utils/size_config.dart';
import 'package:restaurant_app/widgets/f_app_bar.dart';
import 'package:restaurant_app/widgets/svg_image.dart';

class DetailsChangePayment extends StatefulWidget {
  DetailsChangePayment({Key key}) : super(key: key);

  @override
  _DetailsChangePaymentState createState() => _DetailsChangePaymentState();
}

class _DetailsChangePaymentState extends State<DetailsChangePayment> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final theme = FClass().getFTheme(context);
    final size = FClass().getFSize(context);
    return Scaffold(
      appBar: FAppBar("Choose a Payment", context),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: getProportionateScreenWidth(5)),
            child: Text("Cash", style: theme.textTheme.bodyText1),
          ),
          Divider(
            thickness: 2,
            color: Colors.grey.shade200,
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Payment Method", style: theme.textTheme.bodyText1.copyWith(color: Colors.black),),
                Checkbox(
                  value: true,
                  onChanged: (val) {
                    print(val);
                  },
                ),
              ],
            ),
          ),
          Row(
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
          Padding(
            padding: EdgeInsets.only(top: getProportionateScreenWidth(10)),
            child: Text("+ Add new card", style: theme.textTheme.subtitle1.copyWith(color: primaryColor),),
          ),
        ],
      ),
    );
  }
}