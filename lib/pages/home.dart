import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/core/utils/colors.dart';
import 'package:restaurant_app/core/utils/f_class.dart';
import 'package:restaurant_app/core/utils/size_config.dart';
import 'package:restaurant_app/widgets/f_carousel.dart';
import 'package:restaurant_app/widgets/f_page_container.dart';
import 'package:restaurant_app/widgets/f_rounded_categories.dart';
import 'package:restaurant_app/widgets/svg_image.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List categories = ["Seafood", "American", "Burgers", "Dessert"];
  var _pageController = PageController();
  var currentItem = 0;
  ScrollController _listController;
  bool _isShown = true;
  @override
  void initState() {
    _listController = ScrollController();
    _listController.addListener(() {
      print(_listController.offset);
      setState(() {
        _listController.offset <50 ? _isShown = true: _isShown = false;
      });
    });
    print(_isShown);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final theme = FClass().getFTheme(context);
    final size = FClass().getFSize(context);
    _pageController.addListener(() {
      setState(() {
        currentItem = _pageController.page.round();
      });
    });
    return FPageContainer(
      insideWidget: Column(
        children: [
          SizedBox(height: size.height*0.24,),
          AnimatedContainer(
            duration: Duration(milliseconds: 500),
              child: _isShown == true ? FCarousel(): AnimatedContainer(
                  duration: Duration(milliseconds: 500), height: getProportionateScreenHeight(105),)
          ),
          Expanded(
            child: ListView.builder(
              controller: _listController,
              shrinkWrap: true,
                padding: EdgeInsets.only(left: getProportionateScreenWidth(20), top: getProportionateScreenWidth(0)),
                physics: BouncingScrollPhysics(),
                itemCount:  10,
                itemBuilder: (context, index) {
                  if(index == 0) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                          padding: EdgeInsets.fromLTRB(
                          0,
                              getProportionateScreenWidth(5),
                              getProportionateScreenWidth(20),
                              getProportionateScreenWidth(5),
                          ),
                          child: Divider(),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          physics: BouncingScrollPhysics(),
                          child: Row(
                            children: [
                              Container(
                                width: 2*size.width/3,
                                height: getProportionateScreenHeight(140),
                                margin: EdgeInsets.only(right: getProportionateScreenWidth(10), bottom: getProportionateScreenHeight(5)),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(getProportionateScreenWidth(19)),
                                    color: blueColor
                                ),
                                child: Container(
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(getProportionateScreenWidth(19)),
                                    color: Colors.black.withOpacity(0.1),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text("10% of all food", style: theme.textTheme.headline5.copyWith(color: Colors.white),),
                                      SizedBox(height: getProportionateScreenWidth(10),),
                                      Text("18/3 - 22/3", style: theme.textTheme.subtitle1.copyWith(color: Colors.white),)
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                width: 2*size.width/3,
                                height: getProportionateScreenHeight(140),
                                margin: EdgeInsets.only(right: getProportionateScreenWidth(10), bottom: getProportionateScreenHeight(5)),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(getProportionateScreenWidth(19)),
                                    color: blueColor
                                ),
                                child: Container(
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(getProportionateScreenWidth(19)),
                                    color: Colors.black.withOpacity(0.1),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text("10% of all food", style: theme.textTheme.headline5.copyWith(color: Colors.white),),
                                      SizedBox(height: getProportionateScreenWidth(10),),
                                      Text("18/3 - 22/3", style: theme.textTheme.subtitle1.copyWith(color: Colors.white),)
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  }
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: getProportionateScreenWidth(7)),
                    child: GestureDetector(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Ding Tea", style: theme.textTheme.bodyText1.copyWith(color: Colors.black),),
                                  SizedBox(width: getProportionateScreenWidth(50),),
                                  Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Icon(Icons.star_rounded, color: Colors.yellow),
                                        Text("4.0 (230)", style: theme.textTheme.subtitle1.copyWith(color: blueColor))
                                      ]
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: getProportionateScreenWidth(10)),
                                child: Text("189 Giang Vo", style: theme.textTheme.subtitle1.copyWith(color: Colors.grey),),
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
                                            Text("5 mins", style: theme.textTheme.subtitle1.copyWith(color: purpleColor))
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
                                            Text("250 m", style: theme.textTheme.subtitle1.copyWith(color: purpleColor))
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
            ),
          )
        ],
      )
    );
  }
}