import 'package:flutter/material.dart';
import 'package:food_mobile/core/utils/colors.dart';
import 'package:food_mobile/core/utils/f_class.dart';
import 'package:food_mobile/core/utils/size_config.dart';
import 'package:food_mobile/pages/search/search_filter.dart';

class Search extends StatefulWidget {
  Search({Key key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  bool _iselected = false;
  String _selectedItem = "";
  /*List<Map<String, String>> searchItems = [
    {
      "item": "Cooking Heaven",
    },
    {
      "item": "Cooking Heaven",
    },
  ];*/
  List searchItems = [
    "Wester Cuisine",
    "Bubble Tea",
    "Coffee",
    "Vietnamese Food",
    "Tea",
    "Noodle",
    "Pizza/Pasta/Chicken"
  ];
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final theme = FClass().getFTheme(context);
    return Scaffold(
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
                    hintText: "Find Address",
                    hintStyle: theme.textTheme.bodyText1
                )
            )
        ),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        children: [
          Container(
            padding: EdgeInsets.only(top: getProportionateScreenWidth(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Recent history", style: theme.textTheme.bodyText1.copyWith(color: Colors.black),),
                Text("Clear all", style: theme.textTheme.subtitle1.copyWith(color: primaryColor),),
              ],
            ),
          ),
          ListTile(
            contentPadding: EdgeInsets.all(0),
            title: Text("Cookie Heaven", style: theme.textTheme.bodyText1.copyWith(color: Colors.black),),
            trailing: IconButton(
              icon: Icon(Icons.clear, color: primaryColor),
              onPressed: () {

              },
            ),
          ),
          ListTile(
            contentPadding: EdgeInsets.all(0),
            title: Text("Pizza's", style: theme.textTheme.bodyText1.copyWith(color: Colors.black),),
            trailing: IconButton(
              icon: Icon(Icons.clear, color: primaryColor),
              onPressed: () {

              },
            ),
          ),
          ListTile(
            contentPadding: EdgeInsets.all(0),
            title: Text("Trending", style: theme.textTheme.bodyText1.copyWith(color: Colors.black),),
            subtitle: Container(
              padding: EdgeInsets.only(top: getProportionateScreenWidth(15)),
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.start,
                children: searchItems.map<Widget>(
                  (item) => GestureDetector(
                    onTap: () {
                      setState(() {
                        //_iselected =! _iselected;
                        _selectedItem = item;
                      });
                      Navigator.pushNamed(context, "/searchItems");
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      margin: EdgeInsets.only(right: getProportionateScreenWidth(9), bottom: getProportionateScreenWidth(9)),
                      padding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(30),
                          vertical: getProportionateScreenWidth(10)
                      ),
                      decoration: BoxDecoration(
                          color: _selectedItem == item ? primaryColor : Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(6)
                      ),
                      child: Text(item, style: theme.textTheme.subtitle2.copyWith(color: _selectedItem == item ? Colors.white : purpleColor),),
                    ),
                  ),
                ).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}