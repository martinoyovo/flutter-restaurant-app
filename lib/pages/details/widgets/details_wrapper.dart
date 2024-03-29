import 'package:flutter/material.dart';
import 'package:restaurant_app/core/utils/f_class.dart';
import 'package:restaurant_app/pages/details/widgets/delivery_tab.dart';
import 'package:restaurant_app/pages/details/widgets/review_tab.dart';
import 'package:restaurant_app/pages/details/widgets/info_tab.dart';

class DetailsWrapper extends StatefulWidget {
  final Widget detailsWidget;
  DetailsWrapper({Key key, this.detailsWidget}) : super(key: key);

  @override
  _DetailsWrapperState createState() => _DetailsWrapperState();
}

class _DetailsWrapperState extends State<DetailsWrapper> with SingleTickerProviderStateMixin {
  TabController _tabController;
  //bool isHeaderHidden = false;

  @override
  void initState() {
    _tabController = new TabController(length: 3, vsync: this);
    // _tabController.addListener(() {
    //   print("OFFSET");
    //   return _tabController.offset > 1000 ? isHeaderHidden = true : false;
    // });
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
          /*Positioned(
            top: size.height*0.31,
            right: 0,
            left: 0,
            child: Container(
                child: FHomeSlider(context)
            ),
          ),*/
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
              Container(
                child: Expanded(
                  child: TabBarView(
                    children: [
                      DeliveryTab(),
                      ReviewTab(),
                      InfoTab()
                    ],
                    controller: _tabController,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}