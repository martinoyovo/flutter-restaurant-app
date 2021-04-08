import 'package:flutter/material.dart';
import 'package:food_mobile/core/utils/f_class.dart';
import 'package:food_mobile/core/utils/size_config.dart';
import 'package:food_mobile/widgets/f_ongoing_tracking.dart';

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
    final size = FClass().getFSize(context);
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
            Center(
              child: Text("History", style: theme.textTheme.bodyText1.copyWith(color: Colors.black),),
            ),
          ],
        ),
      ),
    );
  }
}