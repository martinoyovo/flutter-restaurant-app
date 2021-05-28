import 'package:flutter/material.dart';
import 'package:restaurant_app/core/utils/colors.dart';
import 'package:restaurant_app/core/utils/f_class.dart';
import 'package:restaurant_app/core/utils/size_config.dart';
import 'package:restaurant_app/widgets/f_elevated_button.dart';

class SearchFilter extends StatefulWidget {
  final String item;

  const SearchFilter({Key key, this.item}) : super(key: key);

  @override
  _SearchFilterState createState() => _SearchFilterState();
}

class _SearchFilterState extends State<SearchFilter> {
  /*List<Map<String, String>> searchItems = [
    {
      "item": "Cooking Heaven",
    },
    {
      "item": "Cooking Heaven",
    },
  ];*/
  List areaItems = [
    "District 1",
    "District 2",
    "District 3",
    "District 4",
  ];
  String _areaSelectedItem = "";

  List sortByItems = [
    "Recommended",
    "Popularity"
  ];
  String _sortBySelectedItem = "";

  List moreFilterItems = [
    "Promotion",
    "Pick-Up"
  ];
  String _moreFilterSelectedItem = "";

  @override
  void initState() {
    for(int i= 0; i<areaItems.length; i++) {
      bool areaItem$i = false;
      print(areaItem$i);
    }
    super.initState();
  }
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
                    hintText: widget.item,
                    hintStyle: theme.textTheme.bodyText1
                )
            )
        ),
        actions: [
          IconButton(icon: Icon(Icons.filter_list_outlined), onPressed: () {})
        ],
      ),
      body: Stack(
        children: [
          ListView(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
            children: [
              ListTile(
                contentPadding: EdgeInsets.all(0),
                title: Text("Area", style: theme.textTheme.bodyText1.copyWith(color: Colors.black),),
                subtitle: Container(
                  padding: EdgeInsets.only(top: getProportionateScreenWidth(15)),
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.start,
                    children: areaItems.map<Widget>(
                          (item) => GestureDetector(
                        onTap: () {
                          setState(() {
                            _areaSelectedItem = item;
                          });
                        },
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          margin: EdgeInsets.only(right: getProportionateScreenWidth(9), bottom: getProportionateScreenWidth(9)),
                          padding: EdgeInsets.symmetric(
                              horizontal: getProportionateScreenWidth(30),
                              vertical: getProportionateScreenWidth(10)
                          ),
                          decoration: BoxDecoration(
                              color: _areaSelectedItem == item ? primaryColor : Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(6)
                          ),
                          child: Text(item, style: theme.textTheme.subtitle2.copyWith(color: _areaSelectedItem == item ? Colors.white : purpleColor),),
                        ),
                      ),
                    ).toList(),
                  ),
                ),
              ),
              SizedBox(height: getProportionateScreenWidth(20),),
              ListTile(
                contentPadding: EdgeInsets.all(0),
                title: Text("Sort by", style: theme.textTheme.bodyText1.copyWith(color: Colors.black),),
                subtitle: Container(
                  padding: EdgeInsets.only(top: getProportionateScreenWidth(15)),
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.start,
                    children: sortByItems.map<Widget>(
                          (item) => GestureDetector(
                        onTap: () {
                          setState(() {
                            _sortBySelectedItem = item;
                          });
                        },
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          margin: EdgeInsets.only(right: getProportionateScreenWidth(9), bottom: getProportionateScreenWidth(9)),
                          padding: EdgeInsets.symmetric(
                              horizontal: getProportionateScreenWidth(30),
                              vertical: getProportionateScreenWidth(10)
                          ),
                          decoration: BoxDecoration(
                              color: _sortBySelectedItem == item ? primaryColor : Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(6)
                          ),
                          child: Text(item, style: theme.textTheme.subtitle2.copyWith(color: _sortBySelectedItem == item ? Colors.white : purpleColor),),
                        ),
                      ),
                    ).toList(),
                  ),
                ),
              ),
              SizedBox(height: getProportionateScreenWidth(20),),
              ListTile(
                contentPadding: EdgeInsets.all(0),
                title: Text("More filter", style: theme.textTheme.bodyText1.copyWith(color: Colors.black),),
                subtitle: Container(
                  padding: EdgeInsets.only(top: getProportionateScreenWidth(15)),
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.start,
                    children: moreFilterItems.map<Widget>(
                          (item) => GestureDetector(
                        onTap: () {
                          setState(() {
                            _moreFilterSelectedItem = item;
                          });
                        },
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          margin: EdgeInsets.only(right: getProportionateScreenWidth(9), bottom: getProportionateScreenWidth(9)),
                          padding: EdgeInsets.symmetric(
                              horizontal: getProportionateScreenWidth(30),
                              vertical: getProportionateScreenWidth(10)
                          ),
                          decoration: BoxDecoration(
                              color: _moreFilterSelectedItem == item ? primaryColor : Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(6)
                          ),
                          child: Text(item, style: theme.textTheme.subtitle2.copyWith(color: _moreFilterSelectedItem == item ? Colors.white : purpleColor),),
                        ),
                      ),
                    ).toList(),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            left: getProportionateScreenWidth(20),
            right: getProportionateScreenWidth(20),
            bottom: getProportionateScreenWidth(20),
            child: FElevatedButton(context, () {Navigator.pop(context);}, "Confirm"),
          )
        ],
      ),
    );
  }
}