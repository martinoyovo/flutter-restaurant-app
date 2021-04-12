import 'package:flutter/material.dart';
import 'package:food_mobile/core/utils/f_class.dart';
import 'package:food_mobile/core/utils/size_config.dart';
import 'file:///C:/Users/tino.co/Documents/food_mobile/lib/pages/driver/widgets/f_ongoing_tracking.dart';
import 'package:food_mobile/pages/driver/widgets/f_history_tracking.dart';

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
        appBar: AppBar(
          automaticallyImplyLeading: false,
          bottom: TabBar(
            indicatorWeight: 2,
            indicatorColor: theme.primaryColor,
            tabs: [
              Tab(text: "Ongoing",),
              Tab(text: "History",),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            FOngoingTracking(),
            FHistoryTracking(),
          ],
        ),
      ),
    );
  }
}