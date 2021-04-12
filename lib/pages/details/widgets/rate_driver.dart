import 'package:flutter/material.dart';
import 'package:food_mobile/core/utils/colors.dart';
import 'package:food_mobile/core/utils/f_class.dart';
import 'package:food_mobile/core/utils/size_config.dart';

class RateDriver extends StatefulWidget {
  RateDriver({Key key}) : super(key: key);

  @override
  _RateDriverState createState() => _RateDriverState();
}

class _RateDriverState extends State<RateDriver> {
  bool _iselected = false;
  String _selectedItem = "";
  List searchItems = [
    "Punctuality",
    "Good Service",
    "Clean",
    "Careful",
    "Work hard",
  ];
  @override
  Widget build(BuildContext context) {
    final theme = FClass().getFTheme(context);
    final size = FClass().getFSize(context);
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15), horizontal: getProportionateScreenWidth(20)),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(getProportionateScreenWidth(20)),
            color: Colors.white
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Rate Driver", style: theme.textTheme.bodyText2,),
            Container(
              margin: EdgeInsets.symmetric(vertical: getProportionateScreenWidth(10)),
              height: getProportionateScreenWidth(60),
              width: getProportionateScreenWidth(60),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: blueColor
              ),
            ),
            Text("John Nguyen", style: theme.textTheme.bodyText2,),
            Container(
              margin: EdgeInsets.only(top: getProportionateScreenWidth(7), bottom: getProportionateScreenWidth(15)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.star_rounded, color: Colors.yellow, size: getProportionateScreenWidth(35),),
                  Icon(Icons.star_rounded, color: Colors.yellow, size: getProportionateScreenWidth(35),),
                  Icon(Icons.star_rounded, color: Colors.yellow, size: getProportionateScreenWidth(35),),
                  Icon(Icons.star_rounded, color: Colors.yellow, size: getProportionateScreenWidth(35),),
                  Icon(Icons.star_rounded, color: Colors.yellow, size: getProportionateScreenWidth(35),),
                ],
              ),
            ),
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.start,
              children: searchItems.map<Widget>(
                    (item) => GestureDetector(
                  onTap: () {
                    setState(() {
                      //_iselected =! _iselected;
                      _selectedItem = item;
                    });
                  },
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    margin: EdgeInsets.only(right: getProportionateScreenWidth(9), bottom: getProportionateScreenWidth(9)),
                    padding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(15),
                        vertical: getProportionateScreenWidth(10)
                    ),
                    decoration: BoxDecoration(
                        color: _selectedItem == item ? primaryColor : Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(6)
                    ),
                    child: Text(item, style: theme.textTheme.subtitle2.copyWith(color: _selectedItem == item ? Colors.white : Colors.black),),
                  ),
                ),
              ).toList(),
            ),
            Container(
              margin: EdgeInsets.only(top: getProportionateScreenWidth(10)),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Leave a review (maximun 50 words)"
                ),
              ),
            ),
            SizedBox(height: getProportionateScreenWidth(25),),
            FittedBox(
              child: Row(
                children: [
                  Container(
                    width: size.width/2,
                    child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: Colors.transparent, width: 1.5),
                          padding: EdgeInsets.symmetric( vertical: getProportionateScreenWidth(11)),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),

                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("Cancel", style: theme.textTheme.headline5
                            .copyWith(color: Colors.black),)
                    ),
                  ),
                  SizedBox(width: getProportionateScreenWidth(10),),
                  Container(
                    width: size.width/2,
                    child: ElevatedButton(
                      child: Text("Next"),
                      style: ElevatedButton.styleFrom(
                          primary: theme.primaryColor,
                          elevation: 0,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(getProportionateScreenWidth(15))),
                          padding: EdgeInsets.symmetric(vertical: 11),
                          textStyle: theme.textTheme.headline5),
                      onPressed: () {
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}