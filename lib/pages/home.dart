import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_mobile/core/utils/colors.dart';
import 'package:food_mobile/core/utils/f_class.dart';
import 'package:food_mobile/core/utils/size_config.dart';
import 'package:food_mobile/widgets/f_home_slider.dart';
import 'package:food_mobile/widgets/svg_image.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Map<String, String>> list = [
    {
      "image": "assets/imgs/onboarding_1.svg",
      "titre": "Deliver Food to you door",
      "soutitre": "Find the right restaurant for you",
    },
    {
      "image": "assets/imgs/onboarding_2.svg",
      "titre": "Find all restaurant in one app",
      "soutitre": "Choose your favourite restaurant",
    },
  ];
  var controller = PageController();
  var currentItem = 0;
  @override
  Widget build(BuildContext context) {
    final theme = FClass().getFTheme(context);
    final size = FClass().getFSize(context);
    controller.addListener(() {
      setState(() {
        currentItem = controller.page.round();
      });
    });
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: size.height*0.45,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: theme.primaryColor,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(getProportionateScreenWidth(40)),
                      bottomRight: Radius.circular(getProportionateScreenWidth(40)),
                  )
                ),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: getProportionateScreenWidth(40), bottom: getProportionateScreenWidth(15)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Delivery address", style: GoogleFonts.openSans(fontSize: getProportionateScreenWidth(14), color: Colors.white),),
                            Row(
                              children: [
                                Text("Address", style: GoogleFonts.openSans(fontSize: getProportionateScreenWidth(14), color: Colors.white),),
                                Icon(Icons.keyboard_arrow_down_rounded, color: Colors.white),
                              ],
                            )
                          ]
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: getProportionateScreenWidth(10)),
                        child: Row(
                          children: [
                            Icon(Icons.location_on_outlined, color: Colors.white),
                            SizedBox(width: getProportionateScreenWidth(12)),
                            Text("Avenue street", style: theme.textTheme.bodyText2.copyWith(color: Colors.white),),
                            SizedBox(width: getProportionateScreenWidth(17)),
                            Icon(Icons.edit_outlined, color: Colors.white),
                          ],
                        )
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: getProportionateScreenWidth(10)),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
                          color: Colors.white,
                        ),
                          child: TextField(
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(getProportionateScreenWidth(10)),
                                  border: InputBorder.none,
                                  prefixIcon: Icon(Icons.search_rounded),
                                  hintText: "Search",
                                  hintStyle: theme.textTheme.bodyText1
                              )
                          )
                      ),
                    ]
                  ),
                )
              ),
              SizedBox()
            ],
          ),
          Stack(
            children: [
              Positioned(
                top: size.height*0.28,
                left: getProportionateScreenWidth(20),
                right: getProportionateScreenWidth(20),
                child: Column(
                  children: [
                    Container(
                        height: size.height*0.43,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(getProportionateScreenWidth(20)),
                          color: blueColor,
                        ),
                        alignment: Alignment.bottomCenter,
                        child: FHomeSlider(context)
                    ),
                    Container(
                      padding: EdgeInsets.only(top: getProportionateScreenWidth(15), bottom: getProportionateScreenWidth(5)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          roundedCategories("assets/icons/seafood.svg"),
                          roundedCategories("assets/icons/american.svg"),
                          roundedCategories("assets/icons/burgers.svg"),
                          roundedCategories("assets/icons/dessert.svg"),
                        ],
                      ),
                    ),
                    /*Container(
                      width: 2*size.width/3,
                      height: getProportionateScreenWidth(100),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(getProportionateScreenWidth(20)),
                          color: blueColor
                      ),
                      child: Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(getProportionateScreenWidth(20)),
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
                    ),*/
                  ],
                ),
              ),
              /*Positioned(
                  top: size.height*0.72,
                  left: 0,
                  right: 0,
                  child: Expanded(
                    child: ListView(
                      shrinkWrap: true,
                      padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: getProportionateScreenWidth(15), bottom: getProportionateScreenWidth(5)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              roundedCategories("assets/icons/seafood.svg"),
                              roundedCategories("assets/icons/american.svg"),
                              roundedCategories("assets/icons/burgers.svg"),
                              roundedCategories("assets/icons/dessert.svg"),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: getProportionateScreenWidth(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Your recent visits", style: theme.textTheme.headline5,),
                              Text("Show all", style: theme.textTheme.subtitle1.copyWith(color: primaryColor))
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: getProportionateScreenWidth(110),
                                  width: getProportionateScreenWidth(110),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(getProportionateScreenWidth(10)),
                                    color: blueColor,
                                  ),
                                ),
                                SizedBox(
                                    height: getProportionateScreenWidth(10)
                                ),
                                Text("Piezss", style: theme.textTheme.bodyText1.copyWith(color: Colors.black),),
                                SizedBox(
                                    height: getProportionateScreenWidth(7)
                                ),
                                Text("lkdjlkjflk", style: theme.textTheme.subtitle1.copyWith(color: Colors.grey),),
                                SizedBox(
                                    height: getProportionateScreenWidth(7)
                                ),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(Icons.star_rounded, color: Colors.yellow),
                                      Text("4.0 (230)", style: theme.textTheme.subtitle1.copyWith(color: blueColor))
                                    ]
                                ),
                              ],
                            )
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: getProportionateScreenWidth(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Your recent visits", style: theme.textTheme.headline5,),
                              Text("Show all", style: theme.textTheme.subtitle1.copyWith(color: primaryColor))
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: getProportionateScreenWidth(110),
                                  width: getProportionateScreenWidth(110),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(getProportionateScreenWidth(10)),
                                    color: blueColor,
                                  ),
                                ),
                                SizedBox(
                                    height: getProportionateScreenWidth(10)
                                ),
                                Text("Piezss", style: theme.textTheme.bodyText1.copyWith(color: Colors.black),),
                                SizedBox(
                                    height: getProportionateScreenWidth(7)
                                ),
                                Text("lkdjlkjflk", style: theme.textTheme.subtitle1.copyWith(color: Colors.grey),),
                                SizedBox(
                                    height: getProportionateScreenWidth(7)
                                ),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(Icons.star_rounded, color: Colors.yellow),
                                      Text("4.0 (230)", style: theme.textTheme.subtitle1.copyWith(color: blueColor))
                                    ]
                                ),
                              ],
                            )
                          ],
                        ),
                        /*Row(
                    children: [
                      Container(
                        height: getProportionateScreenWidth(110),
                        width: getProportionateScreenWidth(110),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(getProportionateScreenWidth(10)),
                          color: blueColor,
                        ),
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Piezss", style: theme.textTheme.bodyText1.copyWith(color: Colors.black),),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(Icons.star_rounded, color: Colors.yellow),
                                    Text("4.0 (230)", style: theme.textTheme.subtitle1.copyWith(color: blueColor))
                                  ]
                              ),
                            ],
                          ),
                          Text("Piezss", style: theme.textTheme.subtitle1.copyWith(color: Colors.grey),),
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(getProportionateScreenWidth((5))),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.grey.shade100
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
                                padding: EdgeInsets.all(getProportionateScreenWidth((5))),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.grey.shade100
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
                  )*/
                      ],
                    ),
                  )/*Expanded(
              child: _platSlider(size.height, controller, theme),
            )*/
              ),*/
            ],
          )
        ],
      )
    );
  }

  _indicators(theme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List<Widget>.generate(list.length, (int index) {
        return AnimatedContainer(
          duration: Duration(milliseconds: 200),
          height: (index == currentItem) ? 10: 8,
          width: (index == currentItem) ? 10: 8,
          margin: EdgeInsets.symmetric(vertical: 13, horizontal: 4),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: (index == currentItem) ? theme.primaryColor:Colors.grey.withOpacity(0.4)
          ),
        );
      }),
    );
  }
  _platSlider(double height, PageController controller, ThemeData theme) {
      return PageView.builder(
        controller: controller,
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        itemCount: list.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
            height: height*0.4,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
              color: blueColor,
            ),
          );
        }
    );
  }
  Widget roundedCategories(String svgPath) {
    return Container(
      height: getProportionateScreenHeight(80),
      width: getProportionateScreenHeight(80),
      padding: EdgeInsets.all(getProportionateScreenHeight(14)),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          boxShadow: [
            BoxShadow(
                spreadRadius: 2,
                blurRadius: 4,
                color: Colors.black12
            )
          ],
          color: Colors.white
      ),
      child: SvgImage(svgPath),
    );
  }
}