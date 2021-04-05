import 'package:flutter/material.dart';
import 'package:food_mobile/core/utils/colors.dart';
import 'package:food_mobile/core/utils/f_class.dart';
import 'package:food_mobile/core/utils/f_input_decoration.dart';
import 'package:food_mobile/core/utils/size_config.dart';
import 'package:food_mobile/widgets/f_app_bar.dart';

class DetailsAddPromotionCode extends StatefulWidget {
  DetailsAddPromotionCode({Key key}) : super(key: key);

  @override
  _DetailsAddPromotionCodeState createState() =>
      _DetailsAddPromotionCodeState();
}

class _DetailsAddPromotionCodeState extends State<DetailsAddPromotionCode> {
  @override
  Widget build(BuildContext context) {
    final theme = FClass().getFTheme(context);
    final size = FClass().getFSize(context);
    SizeConfig().init(context);
    return Scaffold(
      appBar: FAppBar("Add Promotion Code", context),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        children: [
          TextFormField(
              decoration: InputDecoration(
              labelText: "Enter Promo Code",
              hintText: "Enter Promo Code",
              labelStyle: theme.inputDecorationTheme.labelStyle,
              prefixIcon: Icon(Icons.search_rounded),
              contentPadding: EdgeInsets.all(getProportionateScreenWidth(10)),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(getProportionateScreenWidth(15))),
            )
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: getProportionateScreenWidth(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Free Shipping Code", style: theme.textTheme.subtitle2),
                Text("Show more", style: theme.textTheme.subtitle2.copyWith(color: primaryColor),),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(getProportionateScreenWidth(20)),
              color: Colors.grey.shade200
            ),
            child: ListTile(
              leading: Icon(Icons.map),
              title: Text("Code \$10 off on shipping fee", style: theme.textTheme.bodyText2,),
              subtitle: Text("Expiring in 2 days", style: theme.textTheme.subtitle2.copyWith(color: primaryColor),),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: getProportionateScreenWidth(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Discount and Cashback", style: theme.textTheme.subtitle2),
                Text("Show more", style: theme.textTheme.subtitle2.copyWith(color: primaryColor),),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(getProportionateScreenWidth(20)),
              color: Colors.grey.shade200
            ),
            child: ListTile(
              leading: Icon(Icons.map),
              title: Text("Code \$10 off on shipping fee", style: theme.textTheme.bodyText2,),
              subtitle: Text("10/03/2020", style: theme.textTheme.subtitle2.copyWith(color: Colors.grey.shade700),),
            ),
          )
        ],
      ),
    );
  }
}