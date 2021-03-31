import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_mobile/core/utils/colors.dart';
import 'package:food_mobile/core/utils/f_class.dart';
import 'package:food_mobile/core/utils/size_config.dart';
import 'package:food_mobile/widgets/f_app_bar.dart';
import 'package:food_mobile/widgets/f_elevated_button.dart';

class AddressEdit extends StatefulWidget {
  AddressEdit({Key key}) : super(key: key);

  @override
  _AddressEditState createState() => _AddressEditState();
}

class _AddressEditState extends State<AddressEdit> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final theme = FClass().getFTheme(context);
    return Scaffold(
      appBar: FAppBar("Edit Address", context),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: Column(
          children: [
            Container(
                margin: EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(getProportionateScreenWidth(12)),
                  color: Colors.grey.shade200,
                ),
                child: TextField(
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(getProportionateScreenWidth(5),getProportionateScreenWidth(12),getProportionateScreenWidth(5),getProportionateScreenWidth(5),),
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.search_rounded),
                        hintText: "Find Address",
                        hintStyle: theme.textTheme.bodyText1.copyWith(color: Colors.grey.shade600)
                    )
                )
            ),
            SizedBox(height: getProportionateScreenWidth(20),),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: getProportionateScreenWidth(95),
                      width: getProportionateScreenWidth(95),
                      margin: EdgeInsets.only(right: getProportionateScreenWidth(20)),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(getProportionateScreenWidth(10)),
                        color: primaryColor,
                      ),
                    ),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("123 Avenue Steet", style: theme.textTheme.bodyText1.copyWith(color: Colors.black)),
                          SizedBox(height: getProportionateScreenWidth(10)),
                          Text("Michael - 303304959", style: theme.textTheme.subtitle1.copyWith(color: Colors.grey.shade700))
                        ]
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: getProportionateScreenWidth(25)),
                  child: InkWell(
                    onTap: () {
                    },
                    child: Text("Edit", style: theme.textTheme.subtitle),
                    highlightColor: theme.primaryColor.withOpacity(0.2),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: getProportionateScreenWidth(10)),
              child: Divider(
                thickness: 1.5,
              ),
            ),
            Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.all(0),
                    leading: Icon(Icons.home, color: blueColor,),
                    title: Text("Add Home Address", style: theme.textTheme.bodyText1.copyWith(color: blueColor)),
                    trailing: Icon(CupertinoIcons.right_chevron, size: getProportionateScreenWidth(20),),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.all(0),
                    leading: Icon(Icons.account_balance, color: blueColor,),
                    title: Text("Add Workd Address", style: theme.textTheme.bodyText1.copyWith(color: blueColor)),
                    trailing: Icon(CupertinoIcons.right_chevron, size: getProportionateScreenWidth(20),),
                  ),
                ]
            ),
          ]
        ),
      )
    );
  }
}