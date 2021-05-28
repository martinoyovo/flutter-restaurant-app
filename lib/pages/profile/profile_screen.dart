import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/core/utils/colors.dart';
import 'package:restaurant_app/core/utils/f_class.dart';
import 'package:restaurant_app/core/utils/size_config.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = FClass().getFTheme(context);
    final size = FClass().getFSize(context);
    SizeConfig().init(context);
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20), vertical: getProportionateScreenWidth(50)),

            alignment: Alignment.center,
            width: double.infinity,
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(getProportionateScreenWidth(30)),
                bottomRight: Radius.circular(getProportionateScreenWidth(30)),
              )
            ),
            child: GestureDetector(
              onTap: () => Navigator.pushNamed(context, "/editProfile"),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Michael", style: theme.textTheme.headline5.copyWith(color: Colors.white),),
                      Text("035.6634.221 | Avenue Street", style: theme.textTheme.bodyText2.copyWith(color: Colors.white),),
                    ],
                  ),
                  Container(
                    height: getProportionateScreenWidth(80),
                    width: getProportionateScreenWidth(80),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: blueColor
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(Icons.local_offer_rounded),
                        title: Text("My voucher", style: theme.textTheme.bodyText2,),
                        trailing: Icon(CupertinoIcons.chevron_forward),
                      ),
                      ListTile(
                        leading: Icon(Icons.credit_card_rounded),
                        title: Text("Payment", style: theme.textTheme.bodyText2,),
                        trailing: Icon(CupertinoIcons.chevron_forward),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: getProportionateScreenWidth(10)),
                  child: Divider(
                    thickness: 7,
                    color: Colors.grey.shade200,
                  ),
                ),

                Container(
                  padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(Icons.person_add),
                        title: Text("Invite friends", style: theme.textTheme.bodyText2,),
                        trailing: Icon(CupertinoIcons.chevron_forward),
                      ),
                      ListTile(
                        leading: Icon(Icons.assignment_late),
                        title: Text("Feedback", style: theme.textTheme.bodyText2,),
                        trailing: Icon(CupertinoIcons.chevron_forward),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: getProportionateScreenWidth(10)),
                  child: Divider(
                    thickness: 7,
                    color: Colors.grey.shade200,
                  ),
                ),

                Container(
                  padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(Icons.person),
                        title: Text("User Policy", style: theme.textTheme.bodyText2,),
                        trailing: Icon(CupertinoIcons.chevron_forward),
                      ),
                      ListTile(
                        leading: Icon(Icons.settings),
                        title: Text("Payment", style: theme.textTheme.bodyText2,),
                        trailing: Icon(CupertinoIcons.chevron_forward),
                      ),
                    ],
                  ),
                ),
              ],
            )
          )
        ],
      ),
    );
  }
}
