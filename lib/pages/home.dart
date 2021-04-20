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
  List categories = ["Seafood", "American", "Burgers", "Dessert"];
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
  var _pageController = PageController();
  var currentItem = 0;
  ScrollController _listController;
  @override
  void initState() {
    _listController = ScrollController();
    _listController.addListener(() {
      print(_listController.offset);
    });
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
                        child: InkWell(
                          onTap: () => Navigator.pushNamed(context, "/locationChooseCity"),
                          child: Row(
                            children: [
                              Icon(Icons.location_on_outlined, color: Colors.white),
                              SizedBox(width: getProportionateScreenWidth(12)),
                              Text("Avenue street", style: theme.textTheme.bodyText2.copyWith(color: Colors.white),),
                              SizedBox(width: getProportionateScreenWidth(17)),
                              Icon(Icons.edit_outlined, color: Colors.white),
                            ],
                          ),
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
          Positioned(
            top: size.height*0.25,
            left: getProportionateScreenWidth(20),
            right: getProportionateScreenWidth(20),
            child: ListView(
              controller: _listController,
              shrinkWrap: true,
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
                    children: categories.map<Widget>((c) => Column(
                      children: [
                        roundedCategories("assets/icons/${c.toString().toLowerCase()}.svg"),
                        Padding(
                          padding: EdgeInsets.only(top: getProportionateScreenWidth(5)),
                          child: Text(c)
                        )
                      ],
                    )).toList()
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: getProportionateScreenWidth(5)),
                  child: Divider(

                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  child: Row(
                    children: [
                      Container(
                        width: 2*size.width/3,
                        margin: EdgeInsets.only(right: getProportionateScreenWidth(10)),
                        height: getProportionateScreenWidth(100),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(getProportionateScreenWidth(20)),
                            color: blueColor
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
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
                      ),
                      Container(
                        width: 2*size.width/3,
                        margin: EdgeInsets.only(right: getProportionateScreenWidth(10)),
                        height: getProportionateScreenWidth(100),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(getProportionateScreenWidth(20)),
                            color: blueColor
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
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
                      ),
                    ],
                  ),
                ),
              ],
            ),
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
                blurRadius: 2,
                color: Colors.black12
            )
          ],
          color: Colors.white
      ),
      child: SvgImage(svgPath),
    );
  }
}