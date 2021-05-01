import 'package:flutter/material.dart';
import 'package:food_mobile/core/utils/colors.dart';
import 'package:food_mobile/core/utils/f_class.dart';
import 'package:food_mobile/core/utils/size_config.dart';
import 'package:food_mobile/fake_datas/review_list.dart';
import 'package:food_mobile/widgets/f_dialogs.dart';
import 'package:food_mobile/widgets/f_network_image.dart';

class ReviewList extends StatefulWidget {
  ReviewList({Key key}) : super(key: key);

  @override
  _ReviewListState createState() => _ReviewListState();
}

class _ReviewListState extends State<ReviewList> {
  @override
  Widget build(BuildContext context) {
    final theme = FClass().getFTheme(context);
    final size = FClass().getFSize(context);
    return ListView.builder(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemCount:  reviewList.length,
        itemBuilder: (context, int index) {
          var reviewItem = reviewList[index];
          return FittedBox(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: getProportionateScreenWidth(7)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: getProportionateScreenWidth(80),
                    width: getProportionateScreenWidth(80),
                    child: FNetworkImage(
                        imageUrl: "https://images.unsplash.com/photo-1617467191821-f7f65e876501?ixid=MnwyMjU3NDh8MHwxfHJhbmRvbXx8fHx8fHx8fDE2MTk2OTA1NzM&ixlib=rb-1.2.1",
                        height: getProportionateScreenWidth(80),
                        width: getProportionateScreenWidth(80),
                        radius: getProportionateScreenWidth(10)
                    ),
                  ),
                  SizedBox(width: getProportionateScreenWidth(15),),
                  Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(reviewItem["fullName"], style: theme.textTheme.bodyText1.copyWith(color: Colors.black),),
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
                              reviewItem["date"].toString(),
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
                                  reviewItem["text"],
                                  style: theme.textTheme.subtitle1.copyWith(color: Colors.grey.shade600),
                                  textAlign: TextAlign.justify,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  softWrap: true,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        }
    );
  }
}