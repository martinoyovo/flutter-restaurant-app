import 'package:flutter/material.dart';
import 'package:food_mobile/core/utils/f_class.dart';
import 'package:food_mobile/core/utils/size_config.dart';
import 'package:food_mobile/pages/search/search_filter.dart';
import 'package:food_mobile/widgets/top_rated.dart';

class SearchItems extends StatefulWidget {
  SearchItems({Key key}) : super(key: key);

  @override
  _SearchItemsState createState() => _SearchItemsState();
}

class _SearchItemsState extends State<SearchItems> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final theme = FClass().getFTheme(context);
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar:  AppBar(
          automaticallyImplyLeading: true,
          title: Container(
              margin: EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(getProportionateScreenWidth(12)),
                color: Colors.grey.shade200,
              ),
              child: TextField(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(getProportionateScreenWidth(5),getProportionateScreenWidth(12),getProportionateScreenWidth(5),getProportionateScreenWidth(5),),
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.search_rounded),
                      hintText: "Search",
                      hintStyle: theme.textTheme.bodyText1
                  )
              )
          ),
          bottom: TabBar(
            indicatorWeight: 3,
            indicatorColor: theme.primaryColor,
            tabs: [
              Tab(text: "Delivey",),
              Tab(text: "Menu",),
              Tab(text: "Review",),
            ],
          ),
          actions: [
            IconButton(icon: Icon(Icons.filter_list_rounded), onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return SearchFilter(item: "Bubble Tea");
                  }
              )
              );
            })
          ],
        ),
        body: TabBarView(
          children: [
            TopRated(callback: () {Navigator.pushNamed(context, "/detailsInfos");},),
            Center(
              child: Text("Menu"),
            ),
            Center(
              child: Text("Review"),
            ),
          ],
        ),
      ),
    );
  }
}