import 'package:flutter/material.dart';
import 'package:food_mobile/core/utils/colors.dart';
import 'package:food_mobile/core/utils/f_class.dart';
import 'package:food_mobile/core/utils/size_config.dart';
import 'package:food_mobile/widgets/f_app_bar.dart';

class DetailsAddPromotionCode extends StatefulWidget {

  DetailsAddPromotionCode({Key key}) : super(key: key);

  @override
  _DetailsAddPromotionCodeState createState() =>
      _DetailsAddPromotionCodeState();
}

class _DetailsAddPromotionCodeState extends State<DetailsAddPromotionCode> {
  bool _iselected = false;
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
                Text("Free Shipping Code", style: theme.textTheme.bodyText2),
                Text("Show more", style: theme.textTheme.subtitle2.copyWith(color: primaryColor),),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                _iselected =! _iselected;
              });
            },
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(getProportionateScreenWidth(20)),
                color: _iselected ? primaryColor : Colors.grey.shade200
              ),
              child: ListTile(
                leading: Icon(Icons.map, color: _iselected ? Colors.white : Colors.grey),
                title: Text("Code \$10 off on shipping fee", style: theme.textTheme.bodyText2.copyWith(color: _iselected ? Colors.white : Colors.black)),
                subtitle: Text("Expiring in 2 days", style: theme.textTheme.subtitle2.copyWith(color: _iselected ? Colors.grey.shade200 : primaryColor),),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: getProportionateScreenWidth(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Discount and Cashback", style: theme.textTheme.bodyText2),
                Text("Show more", style: theme.textTheme.subtitle2.copyWith(color: primaryColor),),
              ],
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, "/detailsMyOrder2"),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(getProportionateScreenWidth(20)),
                color: Colors.grey.shade200
              ),
              child: ListTile(
                leading: Icon(Icons.map, color: Colors.grey),
                title: Text("Code \$10 off on shipping fee", style: theme.textTheme.bodyText2,),
                subtitle: Text("10/03/2020", style: theme.textTheme.subtitle2.copyWith(color: Colors.grey.shade700),),
              ),
            ),
          )
        ],
      ),
    );
  }
}