import 'package:flutter/material.dart';
import 'package:food_mobile/core/utils/colors.dart';
import 'package:food_mobile/core/utils/f_class.dart';
import 'package:food_mobile/core/utils/size_config.dart';
import 'package:google_fonts/google_fonts.dart';

class DeliveryTab extends StatefulWidget {
  DeliveryTab({Key key}) : super(key: key);

  @override
  _DeliveryTabState createState() => _DeliveryTabState();
}

class _DeliveryTabState extends State<DeliveryTab> {
  @override
  Widget build(BuildContext context) {
    final theme = FClass().getFTheme(context);
    final size = FClass().getFSize(context);
    return Container(
      margin: EdgeInsets.fromLTRB(
        getProportionateScreenWidth(20),
        getProportionateScreenWidth(0),
        getProportionateScreenWidth(20),
        getProportionateScreenWidth(20),
      ),
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          ListTile(
            contentPadding: EdgeInsets.all(0),
            leading: Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(12)),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(getProportionateScreenWidth(10)),
                color: blueColor,
              ),
              child: Icon(Icons.fastfood_outlined, color: Colors.white,),
            ),
            title: Text('Use code "FREESHIP" to get free', style: theme.textTheme.bodyText1.copyWith(color: Colors.black)),
          ),
          ListTile(
            contentPadding: EdgeInsets.all(0),
            leading: Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(12)),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(getProportionateScreenWidth(10)),
                color: blueColor,
              ),
              child: Icon(Icons.local_offer_rounded, color: Colors.white,),
            ),
            title: Text('20% OFF for all menu items', style: theme.textTheme.bodyText1.copyWith(color: Colors.black)),
          ),
          Divider(
            thickness: 1.5,
          ),
          ListTile(
            contentPadding: EdgeInsets.all(0),
            leading: Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(12)),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(getProportionateScreenWidth(10)),
                color: Colors.transparent,
              ),
              child: Icon(Icons.shopping_cart, color: Colors.grey,),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Your last order - 1 item', style: theme.textTheme.bodyText1.copyWith(color: Colors.black)),
                Icon(Icons.keyboard_arrow_down_rounded, color: blueColor),
              ],
            ),
            subtitle: Text('BBQ pork ribs', style: theme.textTheme.subtitle1.copyWith(color: Colors.grey)),
          ),
          Divider(
            thickness: 1.5,
          ),
          Container(
            child: Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemCount:  10,
                  itemBuilder: (index, context) {
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: getProportionateScreenWidth(7)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
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
                          Row(
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Piezss", style: theme.textTheme.bodyText1.copyWith(color: Colors.black),),
                                  Padding(
                                    padding: EdgeInsets.symmetric(vertical: getProportionateScreenWidth(8)),
                                    child: Text("Piezss", style: theme.textTheme.subtitle1.copyWith(color: Colors.grey.shade600),),
                                  ),
                                  Text("D150", style: theme.textTheme.bodyText1.copyWith(color: primaryColor),),
                                ],
                              ),
                              SizedBox(width: size.width*0.3,),
                              Container(
                                alignment: Alignment.centerRight,
                                child: IconButton(
                                  icon: Icon(Icons.add_circle_rounded),
                                  color: primaryColor,
                                  iconSize: getProportionateScreenWidth(35),
                                  onPressed: () {

                                  },
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    );
                  }
              ),
            ),
          )
        ],
      ),
    );
  }
}