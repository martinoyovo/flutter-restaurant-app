import 'package:flutter/material.dart';
import 'package:restaurant_app/core/utils/colors.dart';
import 'package:restaurant_app/core/utils/f_class.dart';
import 'package:restaurant_app/core/utils/size_config.dart';
import 'package:restaurant_app/widgets/f_dialogs.dart';
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
    return ListView(
      physics: BouncingScrollPhysics(),
      children: [
        ListTile(
          contentPadding: EdgeInsets.all(0),
          leading: Container(
            padding: EdgeInsets.all(getProportionateScreenWidth(12)),
            decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.circular(getProportionateScreenWidth(10)),
              color: blueColor,
            ),
            child: Icon(
              Icons.fastfood_outlined,
              color: Colors.white,
            ),
          ),
          title: Text('Use code "FREESHIP" to get free',
              style: theme.textTheme.bodyText1.copyWith(color: Colors.black)),
        ),
        ListTile(
          contentPadding: EdgeInsets.all(0),
          leading: Container(
            padding: EdgeInsets.all(getProportionateScreenWidth(12)),
            decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.circular(getProportionateScreenWidth(10)),
              color: blueColor,
            ),
            child: Icon(
              Icons.local_offer_rounded,
              color: Colors.white,
            ),
          ),
          title: Text('20% OFF for all menu items',
              style: theme.textTheme.bodyText1.copyWith(color: Colors.black)),
        ),
        Divider(
          thickness: 1.5,
        ),
        ListTile(
          contentPadding: EdgeInsets.all(0),
          leading: Container(
            padding: EdgeInsets.all(getProportionateScreenWidth(12)),
            decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.circular(getProportionateScreenWidth(10)),
              color: Colors.transparent,
            ),
            child: Icon(
              Icons.shopping_cart,
              color: Colors.grey,
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Your last order - 1 item',
                  style: theme.textTheme.bodyText1
                      .copyWith(color: Colors.black)),
              Icon(Icons.keyboard_arrow_down_rounded, color: blueColor),
            ],
          ),
          subtitle: Text('BBQ pork ribs',
              style: theme.textTheme.subtitle1.copyWith(color: Colors.grey)),
        ),
        Divider(
          thickness: 1.5,
        ),
        Container(
          child: Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      showModalBottomSheet(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(getProportionateScreenWidth(20)),
                                topRight: Radius.circular(getProportionateScreenWidth(20)),
                              )
                          ),
                          context: context,
                          builder: (context) => fOrderDialog(context)
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(
                          vertical: getProportionateScreenWidth(7)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: getProportionateScreenWidth(90),
                            width: getProportionateScreenWidth(90),
                            margin: EdgeInsets.only(
                                right: getProportionateScreenWidth(20)),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  getProportionateScreenWidth(10)),
                              color: primaryColor,
                            ),
                          ),
                          Row(
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Piezss",
                                    style: theme.textTheme.bodyText1
                                        .copyWith(color: Colors.black),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical:
                                            getProportionateScreenWidth(8)),
                                    child: Text(
                                      "Piezss",
                                      style: theme.textTheme.subtitle1.copyWith(
                                          color: Colors.grey.shade600),
                                    ),
                                  ),
                                  Text(
                                    "D150",
                                    style: theme.textTheme.bodyText1
                                        .copyWith(color: primaryColor),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: size.width * 0.3,
                              ),
                              Container(
                                alignment: Alignment.centerRight,
                                child: IconButton(
                                  icon: Icon(Icons.add_circle_rounded),
                                  color: primaryColor,
                                  iconSize: getProportionateScreenWidth(35),
                                  onPressed: () {
                                    showBottomSheet(
                                      context: context,
                                      builder: (context) => Container(
                                        padding: EdgeInsets.symmetric(vertical: getProportionateScreenWidth(5), horizontal: getProportionateScreenWidth(10)),
                                        color: primaryColor,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal:
                                                      getProportionateScreenWidth(
                                                          12),
                                                  vertical:
                                                      getProportionateScreenWidth(
                                                          7)),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(3),
                                                  color: Colors.white
                                                      .withOpacity(0.4)),
                                              child: Text(
                                                "1",
                                                style: theme.textTheme.bodyText2
                                                    .copyWith(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold),
                                              ),
                                            ),
                                            InkWell(
                                              child: Text(
                                                "View Order",
                                                style: theme.textTheme.bodyText2
                                                    .copyWith(
                                                        color: Colors.white),
                                              ),
                                              onTap: () {
                                                Navigator.pushNamed(context, "/detailsMyOrder");
                                              },
                                            ),
                                            OutlinedButton(
                                              /*onPressed: () {},*/
                                              child: Text("\$150",
                                                  style: theme
                                                      .textTheme.bodyText2
                                                      .copyWith(
                                                          color: Colors.white)),
                                              style: OutlinedButton.styleFrom(
                                                primary: blueColor,
                                                elevation: 0,
                                                side: BorderSide(
                                                    color: Colors.white,
                                                    width: 1),
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            getProportionateScreenWidth(
                                                                3))),
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 0),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                }),
          ),
        )
      ],
    );
  }
}
