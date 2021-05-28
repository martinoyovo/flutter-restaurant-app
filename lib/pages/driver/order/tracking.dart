import 'package:flutter/material.dart';
import 'package:food_mobile/core/utils/f_class.dart';
import 'package:food_mobile/core/utils/size_config.dart';
import 'package:food_mobile/pages/driver/widgets/f_history_tracking.dart';
import 'package:food_mobile/pages/driver/widgets/f_ongoing_tracking.dart';

class Tracking extends StatefulWidget {
  Tracking({Key key}) : super(key: key);

  @override
  _TrackingState createState() => _TrackingState();
}

class _TrackingState extends State<Tracking> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final theme = FClass().getFTheme(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: getProportionateScreenWidth(40)),
              child: TabBar(
                indicatorWeight: 2,
                indicatorColor: theme.primaryColor,
                tabs: [
                  Tab(text: "Ongoing",),
                  Tab(text: "History",),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  FOngoingTracking(),
                  FHistoryTracking(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}