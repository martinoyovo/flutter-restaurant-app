import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_mobile/core/utils/colors.dart';
import 'package:food_mobile/core/utils/f_class.dart';
import 'package:food_mobile/core/utils/size_config.dart';

class ReviewTab extends StatefulWidget {
  ReviewTab({Key key}) : super(key: key);

  @override
  _ReviewTabState createState() => _ReviewTabState();
}

class _ReviewTabState extends State<ReviewTab> {
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
          Container(
            padding: EdgeInsets.symmetric(vertical: getProportionateScreenWidth(10)),
            child: Text("Photos & Vidéos", style: theme.textTheme.headline5,),
          ),
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                photosnVideos(),
                photosnVideos(),
                photosnVideos(),
                photosnVideos(),
                photosnVideos(),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: getProportionateScreenWidth(10)),
            child: Text("Reviews", style: theme.textTheme.headline5,),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.star_rounded, color: Colors.yellow, size: getProportionateScreenWidth(38),),
                      Text("4.9", style: TextStyle(fontSize: getProportionateScreenWidth(26), color: primaryColor),)
                    ],
                  ),
                  Text("Based on", style: theme.textTheme.subtitle1.copyWith(color: Colors.black),)
                ],
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Text("5", style: theme.textTheme.bodyText1.copyWith(color: Colors.black),),
                      Container(
                        margin: EdgeInsets.only(left: 4),
                        height: 9,
                        width: size.width*0.6,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(2)
                        ),
                        child: Row(
                          children: [
                            Container(
                              height: 9,
                              width: size.width*0.5,
                              decoration: BoxDecoration(
                                  color: blueColor,
                                  borderRadius: BorderRadius.circular(2)
                              ),
                            ),
                            SizedBox()
                          ],
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text("4", style: theme.textTheme.bodyText1.copyWith(color: Colors.black),),
                      Container(
                        margin: EdgeInsets.only(left: 4),
                        height: 9,
                        width: size.width*0.6,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(2)
                        ),
                        child: Row(
                          children: [
                            Container(
                              height: 9,
                              width: size.width*0.4,
                              decoration: BoxDecoration(
                                  color: blueColor,
                                  borderRadius: BorderRadius.circular(2)
                              ),
                            ),
                            SizedBox()
                          ],
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text("3", style: theme.textTheme.bodyText1.copyWith(color: Colors.black),),
                      Container(
                        margin: EdgeInsets.only(left: 4),
                        height: 9,
                        width: size.width*0.6,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(2)
                        ),
                        child: Row(
                          children: [
                            Container(
                              height: 9,
                              width: size.width*0.3,
                              decoration: BoxDecoration(
                                  color: blueColor,
                                  borderRadius: BorderRadius.circular(2)
                              ),
                            ),
                            SizedBox()
                          ],
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text("2", style: theme.textTheme.bodyText1.copyWith(color: Colors.black),),
                      Container(
                        margin: EdgeInsets.only(left: 4),
                        height: 9,
                        width: size.width*0.6,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(2)
                        ),
                        child: Row(
                          children: [
                            Container(
                              height: 9,
                              width: size.width*0.2,
                              decoration: BoxDecoration(
                                  color: blueColor,
                                  borderRadius: BorderRadius.circular(2)
                              ),
                            ),
                            SizedBox()
                          ],
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text("1", style: theme.textTheme.bodyText1.copyWith(color: Colors.black),),
                      Container(
                        margin: EdgeInsets.only(left: 4),
                        height: 9,
                        width: size.width*0.6,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(2)
                        ),
                        child: Row(
                          children: [
                            Container(
                              height: 9,
                              width: size.width*0.1,
                              decoration: BoxDecoration(
                                  color: blueColor,
                                  borderRadius: BorderRadius.circular(2)
                              ),
                            ),
                            SizedBox()
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: getProportionateScreenWidth(10)),
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: getProportionateScreenWidth(70),
                            width: getProportionateScreenWidth(70),
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
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Piezss", style: theme.textTheme.bodyText1.copyWith(color: Colors.black),),
                                      SizedBox(width: getProportionateScreenWidth(50),),
                                      Row(
                                        children: [
                                          Icon(Icons.star, color: Colors.yellow),
                                          Icon(Icons.star, color: Colors.yellow),
                                          Icon(Icons.star, color: Colors.yellow),
                                          Icon(Icons.star, color: Colors.yellow),
                                          Icon(Icons.star, color: Colors.yellow),
                                        ],
                                      )
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(0,getProportionateScreenWidth(2),0,getProportionateScreenWidth(2),),
                                    child: Text(
                                      "2nd Oct 2019",
                                      style: theme.textTheme.subtitle1.copyWith(color: Colors.grey.shade600),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(0,getProportionateScreenWidth(8),0,getProportionateScreenWidth(8),),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      verticalDirection: VerticalDirection.down,
                                      children: [
                                        Text(
                                          "Really easy and the family loved it.",
                                          style: theme.textTheme.subtitle1.copyWith(color: Colors.grey.shade600),
                                          textAlign: TextAlign.justify,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                          softWrap: true,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Text("D150", style: theme.textTheme.bodyText1.copyWith(color: primaryColor),),
                                ],
                              ),
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

Widget photosnVideos() {
  return Container(
    height: getProportionateScreenWidth(95),
    width: getProportionateScreenWidth(95),
    margin: EdgeInsets.only(right: getProportionateScreenWidth(8), bottom: getProportionateScreenWidth(10)),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(getProportionateScreenWidth(10)),
      color: blueColor,
    ),
  );
}