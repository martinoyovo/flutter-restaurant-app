import 'package:flutter/material.dart';
import 'package:food_mobile/core/utils/colors.dart';
import 'package:food_mobile/core/utils/f_class.dart';
import 'package:food_mobile/core/utils/size_config.dart';
import 'package:food_mobile/pages/details/widgets/delivery_tab.dart';
import 'package:food_mobile/pages/details/widgets/review_tab.dart';
import 'package:food_mobile/pages/details/widgets/info_tab.dart';
import 'package:food_mobile/search/search_items.dart';
import 'package:food_mobile/widgets/f_app_bar.dart';
import 'package:food_mobile/widgets/f_home_slider.dart';
import 'package:geolocator/geolocator.dart';

class DetailsWrapper extends StatefulWidget {
  final Widget detailsWidget;
  DetailsWrapper({Key key, this.detailsWidget}) : super(key: key);

  @override
  _DetailsWrapperState createState() => _DetailsWrapperState();
}

class _DetailsWrapperState extends State<DetailsWrapper> with SingleTickerProviderStateMixin {
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
    return Scaffold(
      body: Stack(
        children: [
          widget.detailsWidget,
          Stack(
            children: [
              Positioned(
                top: size.height*0.31,
                right: 0,
                left: 0,
                child: Container(
                    child: FHomeSlider(context)
                ),
              ),
            ],
          ),
          Stack(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: size.height*0.52,
                  ),
                  TabBar(
                    indicatorColor: theme.primaryColor,
                    tabs: [
                      Tab(
                        text: 'Delivery',
                      ),
                      Tab(
                        text: 'Review',
                      ),
                      Tab(
                        text: 'Info',
                      ),
                    ],
                    controller: _tabController,
                    indicatorSize: TabBarIndicatorSize.tab,
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        DeliveryTab(),
                        ReviewTab(),
                        InfoTab()
                      ],
                      controller: _tabController,
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}