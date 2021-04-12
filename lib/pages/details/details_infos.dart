import 'package:flutter/material.dart';
import 'package:food_mobile/core/utils/colors.dart';
import 'package:food_mobile/core/utils/f_class.dart';
import 'package:food_mobile/core/utils/size_config.dart';
import 'package:food_mobile/pages/details/widgets/details_wrapper.dart';
import 'package:food_mobile/pages/details/widgets/info_tab.dart';
import 'package:food_mobile/pages/search/search_items.dart';
import 'package:food_mobile/widgets/f_app_bar.dart';
import 'package:food_mobile/widgets/f_home_slider.dart';
import 'package:geolocator/geolocator.dart';

class DetailsInfos extends StatefulWidget {
  DetailsInfos({Key key}) : super(key: key);

  @override
  _DetailsInfosState createState() => _DetailsInfosState();
}

class _DetailsInfosState extends State<DetailsInfos>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = new TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = FClass().getFTheme(context);
    final size = FClass().getFSize(context);
    return DetailsWrapper(
        detailsWidget: Container(
          padding: EdgeInsets.symmetric(vertical: getProportionateScreenWidth(20)),
          alignment: Alignment.topCenter,
          height: size.height * 0.45,
          decoration: BoxDecoration(
          color: theme.primaryColor,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(getProportionateScreenWidth(30)),
            bottomRight: Radius.circular(getProportionateScreenWidth(30)),
          )),
          child: Container(
            padding: EdgeInsets.only(top: getProportionateScreenWidth(13)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
                Row(
                  children: [
                    InkWell(
                      child: Container(
                        margin: EdgeInsets.only(right: getProportionateScreenWidth(7)),
                        height: getProportionateScreenWidth(36),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white),
                        padding: EdgeInsets.all(getProportionateScreenWidth(6)),
                        alignment: Alignment.center,
                        child: Align(
                            alignment: Alignment.center,
                            child: Icon(
                              Icons.favorite,
                              color: primaryColor,
                            )),
                  ),
                ),
                InkWell(
                  child: Container(
                    margin:
                        EdgeInsets.only(right: getProportionateScreenWidth(15)),
                    height: getProportionateScreenWidth(36),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white),
                    padding: EdgeInsets.all(getProportionateScreenWidth(6)),
                    alignment: Alignment.center,
                    child: Align(
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.search_rounded,
                          color: Colors.grey.shade600,
                        )),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    ));
  }
}
