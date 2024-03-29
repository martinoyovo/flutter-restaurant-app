import 'package:flutter/material.dart';
import 'package:restaurant_app/core/utils/colors.dart';
import 'package:restaurant_app/core/utils/f_class.dart';
import 'package:restaurant_app/core/utils/size_config.dart';
import 'package:restaurant_app/pages/details/details_infos.dart';
import 'package:restaurant_app/widgets/top_rated.dart';

class ChooseDessert extends StatefulWidget {
  ChooseDessert({Key key}) : super(key: key);

  @override
  _ChooseDessertState createState() => _ChooseDessertState();
}

class _ChooseDessertState extends State<ChooseDessert> {
  @override
  Widget build(BuildContext context) {
    final theme = FClass().getFTheme(context);
    final size = FClass().getFSize(context);
    SizeConfig().init(context);
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: Text("Dessert", style: theme.textTheme.headline5.copyWith(color: Colors.black),),
          bottom: TabBar(
            indicatorWeight: 3,
            indicatorColor: theme.primaryColor,
            tabs: [
              Tab(text: "Near By",),
              Tab(text: "Top Rated",),
              Tab(text: "Top Sales",),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            TopRated(callback: () {
              print("coool");
              Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsInfos()));
            },),
            Center(
              child: Text("Top Rated", style: theme.textTheme.bodyText1.copyWith(color: Colors.black),),
            ),
            Center(
              child: Text("Top Sales", style: theme.textTheme.bodyText1.copyWith(color: Colors.black),),
            ),
          ],
        ),
      ),
    );
  }
}