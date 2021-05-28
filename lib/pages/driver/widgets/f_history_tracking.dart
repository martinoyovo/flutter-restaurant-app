import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/core/utils/colors.dart';
import 'package:restaurant_app/core/utils/f_class.dart';
import 'package:restaurant_app/core/utils/size_config.dart';

class FHistoryTracking extends StatefulWidget {
  FHistoryTracking({Key key}) : super(key: key);

  @override
  _FHistoryTrackingState createState() => _FHistoryTrackingState();
}

class _FHistoryTrackingState extends State<FHistoryTracking>
    with SingleTickerProviderStateMixin {
  bool _isExpanded = false;
  AnimationController _controller;
  Animation<double> _iconTurns;

  @override
  void initState() {
    _controller = new AnimationController(
      vsync: this,
      duration: new Duration(milliseconds: 200),
    );
    _controller.reverse();

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTap() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _controller.forward();
      } else {
        _controller.reverse().then<void>((void value) {
          if (!mounted) return;
          setState(() {
            // Rebuild without widget.children.
          });
        });
      }
      print("is expanded");
      print(_isExpanded);
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = FClass().getFSize(context);
    final theme = FClass().getFTheme(context);
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(20),
              vertical: getProportionateScreenWidth(10)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: _handleTap,
                    child: Row(
                      children: [
                        Text("All Services"),
                        RotationTransition(
                          turns:
                              Tween(begin: 0.0, end: 0.5).animate(_controller),
                          child: const Icon(Icons.expand_more),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [Text("All Status"), Icon(Icons.expand_more)],
                  ),
                  Row(
                    children: [Text("Dates"), Icon(Icons.expand_more)],
                  ),
                ],
              ),
              AnimatedContainer(
                duration: Duration(milliseconds: 200),
                margin: EdgeInsets.only(
                    top: getProportionateScreenWidth(5)),
                child: _isExpanded
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(onTap: () {}, child: Text("Completed")),
                          SizedBox(
                            height: getProportionateScreenWidth(6),
                          ),
                          InkWell(onTap: () {}, child: Text("Cancelled")),
                        ],
                      )
                    : Container(),
              )
            ],
          ),
        ),
        Expanded(
          child: AnimatedContainer(
            duration: Duration(milliseconds: 500),
            child: ListView.builder(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemCount: 10,
                padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(
                        vertical: getProportionateScreenWidth(7)),
                    child: FittedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: getProportionateScreenWidth(100),
                            width: getProportionateScreenWidth(100),
                            margin: EdgeInsets.only(
                                right: getProportionateScreenWidth(20)),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  getProportionateScreenWidth(20)),
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
                                    "S&L Diner",
                                    style: theme.textTheme.bodyText1
                                        .copyWith(color: Colors.black),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: getProportionateScreenWidth(2),
                                        bottom: getProportionateScreenWidth(8)),
                                    child: Text(
                                      "20/03/2020",
                                      style: theme.textTheme.subtitle1
                                          .copyWith(color: Colors.grey.shade600),
                                    ),
                                  ),
                                  Text(
                                    "\$150 - 1 item - Cash",
                                    style: theme.textTheme.bodyText1
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      OutlinedButton(
                                        style: OutlinedButton.styleFrom(
                                          side: BorderSide(color: blueColor, width: 1.5),
                                          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20), vertical: 0),
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),

                                        ),
                                        onPressed: () {},
                                        child: Text("Rate", style: theme.textTheme.subtitle1
                                            .copyWith(color: blueColor),)
                                      ),
                                      SizedBox(width: getProportionateScreenWidth(10),),
                                      OutlinedButton(
                                        style: OutlinedButton.styleFrom(
                                          side: BorderSide(color: primaryColor, width: 1.5),
                                          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20), vertical: 0),
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),

                                        ),
                                        onPressed: () {
                                          Navigator.pushNamed(context, "/orderDetails");
                                        },
                                        child: Text("Re-order", style: theme.textTheme.subtitle1
                                            .copyWith(color: primaryColor),)
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Container(
                                margin: EdgeInsets.only(left: getProportionateScreenWidth(20), bottom: getProportionateScreenWidth(45)),
                                alignment: Alignment.topCenter,
                                child: IconButton(
                                  icon: Icon(Icons.check_circle_rounded),
                                  color: primaryColor,
                                  iconSize: getProportionateScreenWidth(30),
                                  onPressed: () {
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
