import 'package:flutter/material.dart';
import 'package:restaurant_app/core/utils/colors.dart';
import 'package:restaurant_app/core/utils/f_class.dart';
import 'package:restaurant_app/core/utils/size_config.dart';
import 'package:restaurant_app/fake_datas/categories_list.dart';
import 'package:restaurant_app/fake_datas/plates_promotion_list.dart';
import 'package:restaurant_app/fake_datas/promotion_list.dart';
import 'package:restaurant_app/fake_datas/restaurant_list.dart';
import 'package:restaurant_app/pages/restaurant_details.dart';
import 'package:restaurant_app/widgets/f_carousel.dart';
import 'package:restaurant_app/widgets/f_network_image.dart';
import 'package:restaurant_app/widgets/f_rounded_categories.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeSnd extends StatefulWidget {
  HomeSnd({Key key}) : super(key: key);

  @override
  _HomeSndState createState() => _HomeSndState();
}

class _HomeSndState extends State<HomeSnd> {
  @override
  Widget build(BuildContext context) {
    final theme = FClass().getFTheme(context);
    final size = FClass().getFSize(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        /*shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(getProportionateScreenWidth(10)),
            bottomRight: Radius.circular(getProportionateScreenWidth(10)),
          )
        ),*/
        backgroundColor: primaryColor,
        iconTheme: IconThemeData(
          color: Colors.white
        ),
        elevation: 0,
        title: Padding(
          padding: EdgeInsets.only(top: getProportionateScreenWidth(5)),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Delivery address", style: GoogleFonts.openSans(fontSize: getProportionateScreenWidth(16)),),
                Row(
                  children: [
                    Text("Address", style: GoogleFonts.openSans(fontSize: getProportionateScreenWidth(16),),),
                    Icon(Icons.keyboard_arrow_down_rounded, color: Colors.white),
                  ],
                )
              ]
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, getProportionateScreenWidth(50)),
          child: Container(
              margin: EdgeInsets.symmetric(
                  vertical: getProportionateScreenWidth(10),
                  horizontal: getProportionateScreenWidth(15)),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(getProportionateScreenWidth(100)),
                color: Colors.white,
              ),
              child: TextField(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(getProportionateScreenWidth(13)),
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.search_rounded),
                      hintText: "Search",
                      hintStyle: theme.textTheme.bodyText1
                  )
              )
          ),
        ),
      ),
      body: ListView.builder(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          padding: EdgeInsets.all(getProportionateScreenWidth(15)),
          physics: BouncingScrollPhysics(),
          itemCount:  restaurantList.length,
          itemBuilder: (context, int index) {
            var restaurantItem = restaurantList[index];
            if(index == 0) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FCarousel(),
                  Container(
                    padding: EdgeInsets.only(
                      top: 3,
                      bottom: getProportionateScreenWidth(5),
                    ),
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: categories.map<Widget>((c) => Padding(
                            padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
                            child: Column(
                              children: [
                                SizedBox(height: 2,),
                                FRoundedCategories("assets/icons/${c.toString().toLowerCase()}.svg"),
                                Padding(
                                    padding: EdgeInsets.only(top: getProportionateScreenWidth(5)),
                                    child: Text(c)
                                )
                              ],
                            ),
                          )).toList()
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: getProportionateScreenWidth(5)),
                    child: Divider(
                      color: Colors.grey.shade600,
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    child: Row(
                      children:
                      List<Widget>.generate(platesPromotionList.length, (i) {
                        var list = platesPromotionList[i];
                        return Container(
                          width: 2*size.width/3,
                          height: getProportionateScreenHeight(140),
                          margin: EdgeInsets.only(right: getProportionateScreenWidth(10), bottom: getProportionateScreenHeight(5)),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(getProportionateScreenWidth(19)),
                            image: DecorationImage(
                              image: NetworkImage(list["url"]),
                              fit: BoxFit.cover
                            )
                          ),
                          child: Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(getProportionateScreenWidth(19)),
                              color: Colors.black.withOpacity(0.4),
                            ),
                            child: SizedBox(
                              height: getProportionateScreenHeight(60),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: getProportionateScreenWidth(10),
                                ),
                                decoration: BoxDecoration(
                                  color: list["isHighlighted"]==true?primaryColor:Colors.transparent
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(list["percentage"], style: theme.textTheme.headline5.copyWith(color: Colors.white),),
                                    Text(list["delay"], style: theme.textTheme.subtitle1.copyWith(color: Colors.white),)
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              );
            }
            return Container(
              margin: EdgeInsets.symmetric(vertical: getProportionateScreenWidth(7)),
              child: GestureDetector(
                onTap: () => Navigator.push(
                    context, MaterialPageRoute(
                    builder: (context) => RestaurantDetails(details: restaurantItem))
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: getProportionateScreenHeight(130),
                      width: getProportionateScreenWidth(110),
                      child: FNetworkImage(
                        imageUrl: restaurantItem["url"],
                        height: getProportionateScreenWidth(100),
                        width: getProportionateScreenWidth(100),
                        radius: getProportionateScreenWidth(10)
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(restaurantItem["title"], style: theme.textTheme.bodyText1.copyWith(color: Colors.black),),
                            SizedBox(width: getProportionateScreenWidth(50),),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.star_rounded, color: Colors.yellow),
                                  Text("${restaurantItem["rate"]} (${restaurantItem["number"]})", style: theme.textTheme.subtitle1.copyWith(color: blueColor))
                                ]
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: getProportionateScreenWidth(10)),
                          child: Text("${restaurantItem["address"]}", style: theme.textTheme.subtitle1.copyWith(color: Colors.grey),),
                        ),
                        Row(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(vertical: getProportionateScreenWidth(5), horizontal: getProportionateScreenWidth((15))),
                                margin: EdgeInsets.only(right: getProportionateScreenWidth((15))),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(11),
                                    color: Colors.grey.shade200
                                ),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(Icons.alarm_rounded, color: theme.primaryColor),
                                      Text("${restaurantItem["time"]} mins", style: theme.textTheme.subtitle1.copyWith(color: purpleColor))
                                    ]
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(vertical: getProportionateScreenWidth(5), horizontal: getProportionateScreenWidth((15))),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(11),
                                    color: Colors.grey.shade200
                                ),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(Icons.location_on_outlined, color: theme.primaryColor),
                                      Text("${restaurantItem["distance"]} m", style: theme.textTheme.subtitle1.copyWith(color: purpleColor))
                                    ]
                                ),
                              ),
                            ]
                        )
                      ],
                    )
                  ],
                ),
              ),
            );
          }
      )
    );
  }
}

