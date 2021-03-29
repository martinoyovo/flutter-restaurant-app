import 'package:flutter/material.dart';
import 'package:food_mobile/core/utils/colors.dart';
import 'package:food_mobile/core/utils/size_config.dart';

class SearchInRestaurant extends StatefulWidget {
  SearchInRestaurant({Key key}) : super(key: key);

  @override
  _SearchInRestaurantState createState() => _SearchInRestaurantState();
}

class _SearchInRestaurantState extends State<SearchInRestaurant> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    SizeConfig().init(context);
    return Scaffold(
      appBar:  AppBar(
        automaticallyImplyLeading: true,
        title: Container(
            margin: EdgeInsets.symmetric(vertical: getProportionateScreenWidth(20)),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
              color: Colors.grey.shade200,
            ),
            child: TextField(
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(getProportionateScreenWidth(5)),
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.search_rounded),
                    hintText: "Search",
                    hintStyle: theme.textTheme.bodyText1
                )
            )
        ),
      ),
      body: ListView.builder(
          padding: EdgeInsets.only(left: getProportionateScreenWidth(20), top: getProportionateScreenWidth(10), right: getProportionateScreenWidth(10)),
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
                    height: getProportionateScreenWidth(100),
                    width: getProportionateScreenWidth(100),
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
                            padding: EdgeInsets.symmetric(vertical: getProportionateScreenWidth(10)),
                            child: Text("Piezss", style: theme.textTheme.subtitle1.copyWith(color: Colors.grey),),
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
                          iconSize: getProportionateScreenWidth(40),
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
    );
  }
}