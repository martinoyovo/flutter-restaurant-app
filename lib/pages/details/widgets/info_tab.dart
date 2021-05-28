import 'package:flutter/material.dart';
import 'package:restaurant_app/core/utils/colors.dart';
import 'package:restaurant_app/core/utils/size_config.dart';

class InfoTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListView(
      physics: BouncingScrollPhysics(),
      children: [
        Container(
          margin: EdgeInsets.only(bottom: getProportionateScreenWidth(10)),
          height: getProportionateScreenWidth(110),
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.circular(getProportionateScreenWidth(20)),
              color: primaryColor),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.0),
          child: Text(
            "American Restaurant - Diner",
            style: theme.textTheme.bodyText1.copyWith(color: Colors.black),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.0),
          child: Text(
            "Address: 189 Avenue Street",
            style: theme.textTheme.bodyText1.copyWith(color: Colors.black),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.0),
          child: Text(
            "Phone: 0123.456.789",
            style: theme.textTheme.bodyText1.copyWith(color: Colors.black),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.0),
          child: Text(
            "Working hours: Daily from 10AM - 10.30PM",
            style: theme.textTheme.bodyText1.copyWith(color: Colors.black),
          ),
        ),
      ],
    );
  }
}
