import 'package:flutter/material.dart';
import 'package:restaurant_app/core/utils/colors.dart';
import 'package:restaurant_app/core/utils/f_class.dart';
import 'package:restaurant_app/core/utils/size_config.dart';
import 'package:restaurant_app/fake_datas/photo_list.dart';
import 'package:restaurant_app/pages/details/grouped_views/menu_list.dart';
import 'package:restaurant_app/pages/details/grouped_views/review_list.dart';
import 'package:restaurant_app/widgets/f_network_image.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class RestaurantDetails extends StatefulWidget {
  final Map<String, dynamic> details;
  RestaurantDetails({Key key, this.details, }) : super(key: key);

  @override
  _RestaurantDetailsState createState() => _RestaurantDetailsState();
}

class _RestaurantDetailsState extends State<RestaurantDetails> with SingleTickerProviderStateMixin {
  GoogleMapController mapController;
  ScrollController _list0Controller;
  ScrollController _list1Controller;
  ScrollController _list2Controller;
  bool _isShown = true;
  TabController _tabController;
  @override
  void initState() {
    _tabController = new TabController(length: 3, vsync: this);
    _list0Controller = ScrollController();
    _list1Controller = ScrollController();
    _list2Controller = ScrollController();
    _list0Controller.addListener(() {
      setState(() {
        _list0Controller.offset <200 ? _isShown = true: _isShown = false;
      });
    });
    _list1Controller.addListener(() {
      setState(() {
        _list1Controller.offset <200 ? _isShown = true: _isShown = false;
      });
    });
    _list2Controller.addListener(() {
      setState(() {
        _list2Controller.offset <200 ? _isShown = true: _isShown = false;
      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final theme = FClass().getFTheme(context);
    final size = FClass().getFSize(context);
    return Scaffold(
      body: Column(
        children: [
          _isShown?
          Container(
            height: size.height*0.3,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(widget.details["url"]),
                  fit: BoxFit.cover,
                )
            ),
            child: AppBar(
              automaticallyImplyLeading: false,
              iconTheme: IconThemeData(
                  color: Colors.white
              ),
              elevation: 0,
              leading: InkWell(
                onTap: () => Navigator.pop(context),
                child: Container(
                  margin: EdgeInsets.all(getProportionateScreenWidth(10)),
                  height: getProportionateScreenWidth(36),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white),
                  padding: EdgeInsets.all(getProportionateScreenWidth(6)),
                  alignment: Alignment.center,
                  child: Align(
                      alignment: Alignment.center,
                      child: Icon(
                          Icons.arrow_back,
                          color: Colors.grey.shade600
                      )),
                ),
              ),
              actions: [
                InkWell(
                  child: Container(
                    margin: EdgeInsets.only(right: getProportionateScreenWidth(7)),
                    height: getProportionateScreenWidth(36),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
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
                        shape: BoxShape.circle,
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
              //title: Text("Food Mobile", style: theme.textTheme.headline5.copyWith(color: Colors.black),),
            ),
          ):
          AppBar(
              title: Text(widget.details["title"], style: theme.textTheme.headline5.copyWith(color: Colors.black))
          ),
          TabBar(
            indicatorColor: theme.primaryColor,
            tabs: [
              Tab(
                text: 'Menu',
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
            child: Container(
              margin: EdgeInsets.fromLTRB(
                getProportionateScreenWidth(20),
                getProportionateScreenWidth(0),
                getProportionateScreenWidth(20),
                getProportionateScreenWidth(20),
              ),
              child: TabBarView(
                children: [
                  ListView(
                    shrinkWrap: true,
                    controller: _list0Controller,
                    physics: BouncingScrollPhysics(),
                    children: [
                      ListTile(
                        contentPadding: EdgeInsets.all(0),
                        leading: Container(
                          padding: EdgeInsets.all(getProportionateScreenWidth(12)),
                          decoration: BoxDecoration(
                            borderRadius:
                            BorderRadius.circular(getProportionateScreenWidth(10)),
                            color: blueColor,
                          ),
                          child: Icon(
                            Icons.fastfood_outlined,
                            color: Colors.white,
                          ),
                        ),
                        title: Text('Use code "FREESHIP" to get free',
                            style: theme.textTheme.bodyText1.copyWith(color: Colors.black)),
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.all(0),
                        leading: Container(
                          padding: EdgeInsets.all(getProportionateScreenWidth(12)),
                          decoration: BoxDecoration(
                            borderRadius:
                            BorderRadius.circular(getProportionateScreenWidth(10)),
                            color: blueColor,
                          ),
                          child: Icon(
                            Icons.local_offer_rounded,
                            color: Colors.white,
                          ),
                        ),
                        title: Text('20% OFF for all menu items',
                            style: theme.textTheme.bodyText1.copyWith(color: Colors.black)),
                      ),
                      Divider(
                        color: Colors.grey.shade600,
                      ),
                      MenuList()
                    ],
                  ),
                  ListView(
                    shrinkWrap: true,
                    controller: _list1Controller,
                    physics: BouncingScrollPhysics(),
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(vertical: getProportionateScreenWidth(10)),
                        child: Text("Photos & Vidéos", style: theme.textTheme.headline5,),
                      ),
                      SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List<Widget>.generate(platPhotosList.length, (i) {
                            var item = platPhotosList[i];
                            return Container(
                              margin: EdgeInsets.only(right: getProportionateScreenWidth(8), bottom: getProportionateScreenWidth(10)),
                              child: SizedBox(
                                height: getProportionateScreenWidth(95),
                                width: getProportionateScreenWidth(95),
                                child: FNetworkImage(
                                    imageUrl: item['url'],
                                    height: getProportionateScreenWidth(95),
                                    width: getProportionateScreenWidth(95),
                                    radius: getProportionateScreenWidth(10)
                                ),
                              ),
                            );
                            Container(
                              height: getProportionateScreenWidth(95),
                              width: getProportionateScreenWidth(95),
                              margin: EdgeInsets.only(right: getProportionateScreenWidth(8), bottom: getProportionateScreenWidth(10)),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(getProportionateScreenWidth(10)),
                                  //color: primaryColor,
                                  image: DecorationImage(
                                      image: NetworkImage(item["url"]),
                                      fit: BoxFit.cover
                                  )
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: getProportionateScreenWidth(10)),
                        child: Text("Reviews", style: theme.textTheme.headline5,),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.star_rounded, color: Colors.yellow, size: getProportionateScreenWidth(38),),
                                  Text("4.9", style: TextStyle(fontSize: getProportionateScreenWidth(26), color: primaryColor),)
                                ],
                              ),
                              Text("Based on", style: theme.textTheme.subtitle1.copyWith(color: Colors.black),)
                            ],
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Text("5", style: theme.textTheme.bodyText1.copyWith(color: Colors.black),),
                                  Container(
                                    margin: EdgeInsets.only(left: 4),
                                    height: 9,
                                    width: size.width*0.6,
                                    decoration: BoxDecoration(
                                        color: Colors.grey.shade300,
                                        borderRadius: BorderRadius.circular(2)
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 9,
                                          width: size.width*0.5,
                                          decoration: BoxDecoration(
                                              color: blueColor,
                                              borderRadius: BorderRadius.circular(2)
                                          ),
                                        ),
                                        SizedBox()
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Text("4", style: theme.textTheme.bodyText1.copyWith(color: Colors.black),),
                                  Container(
                                    margin: EdgeInsets.only(left: 4),
                                    height: 9,
                                    width: size.width*0.6,
                                    decoration: BoxDecoration(
                                        color: Colors.grey.shade300,
                                        borderRadius: BorderRadius.circular(2)
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 9,
                                          width: size.width*0.4,
                                          decoration: BoxDecoration(
                                              color: blueColor,
                                              borderRadius: BorderRadius.circular(2)
                                          ),
                                        ),
                                        SizedBox()
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Text("3", style: theme.textTheme.bodyText1.copyWith(color: Colors.black),),
                                  Container(
                                    margin: EdgeInsets.only(left: 4),
                                    height: 9,
                                    width: size.width*0.6,
                                    decoration: BoxDecoration(
                                        color: Colors.grey.shade300,
                                        borderRadius: BorderRadius.circular(2)
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 9,
                                          width: size.width*0.3,
                                          decoration: BoxDecoration(
                                              color: blueColor,
                                              borderRadius: BorderRadius.circular(2)
                                          ),
                                        ),
                                        SizedBox()
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Text("2", style: theme.textTheme.bodyText1.copyWith(color: Colors.black),),
                                  Container(
                                    margin: EdgeInsets.only(left: 4),
                                    height: 9,
                                    width: size.width*0.6,
                                    decoration: BoxDecoration(
                                        color: Colors.grey.shade300,
                                        borderRadius: BorderRadius.circular(2)
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 9,
                                          width: size.width*0.2,
                                          decoration: BoxDecoration(
                                              color: blueColor,
                                              borderRadius: BorderRadius.circular(2)
                                          ),
                                        ),
                                        SizedBox()
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Text("1", style: theme.textTheme.bodyText1.copyWith(color: Colors.black),),
                                  Container(
                                    margin: EdgeInsets.only(left: 4),
                                    height: 9,
                                    width: size.width*0.6,
                                    decoration: BoxDecoration(
                                        color: Colors.grey.shade300,
                                        borderRadius: BorderRadius.circular(2)
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 9,
                                          width: size.width*0.1,
                                          decoration: BoxDecoration(
                                              color: blueColor,
                                              borderRadius: BorderRadius.circular(2)
                                          ),
                                        ),
                                        SizedBox()
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(top: getProportionateScreenWidth(10)),
                        child: ReviewList()
                      )
                    ],
                  ),
                  ListView(
                    shrinkWrap: true,
                    controller: _list2Controller,
                    physics: BouncingScrollPhysics(),
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: getProportionateScreenWidth(10)),
                        height: getProportionateScreenWidth(210),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade200,
                              blurRadius: 2,
                              spreadRadius: 1
                            )
                          ],
                            borderRadius:
                            BorderRadius.circular(getProportionateScreenWidth(20)),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(getProportionateScreenWidth(20)),
                          child: GoogleMap(
                            onMapCreated: _onMapCreated,
                            myLocationEnabled: true,
                            compassEnabled: false,
                            mapToolbarEnabled: false,
                            myLocationButtonEnabled: false,
                            zoomControlsEnabled: false,
                            zoomGesturesEnabled: true,
                            scrollGesturesEnabled: true,
                            tiltGesturesEnabled: true,
                            //markers: Set<Marker>.of(markers.values),
                            initialCameraPosition: CameraPosition(
                              target: LatLng(6.19189688839275, 1.1763159920514525),
                              zoom: 17,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: getProportionateScreenWidth(8)),
                        child: Text(
                          "American Restaurant - Diner",
                          style: theme.textTheme.bodyText1.copyWith(color: Colors.black),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: getProportionateScreenWidth(8)),
                        child: Text(
                          "Address: 189 Avenue Street",
                          style: theme.textTheme.bodyText1.copyWith(color: Colors.black),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: getProportionateScreenWidth(8)),
                        child: Text(
                          "Phone: 0123.456.789",
                          style: theme.textTheme.bodyText1.copyWith(color: Colors.black),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: getProportionateScreenWidth(8)),
                        child: Text(
                          "Working hours: Daily from 10AM - 10.30PM",
                          style: theme.textTheme.bodyText1.copyWith(color: Colors.black),
                        ),
                      ),
                    ],
                  )
                  /*ReviewTab(),
                  InfoTab()*/
                ],
                controller: _tabController,
              ),
            ),
          )
        ],
      ),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }
}
/*ListView.builder(
                padding: EdgeInsets.all(getProportionateScreenWidth(15)),
                controller: _listController,
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemCount: 10,
                itemBuilder: (context, index) {
                  if(index == 0) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.details["title"], style: theme.textTheme.headline4.copyWith(color: Colors.black, fontWeight: FontWeight.normal),),
                        SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            physics: BouncingScrollPhysics(),
                            child: Row(
                              children: [
                                Text("Vegeterian - Vegan - Gourmet - Healthy - \$ - ", style: theme.textTheme.subtitle2,),
                                Text(widget.details['rate'].toString(), style: theme.textTheme.subtitle2,),
                                Icon(Icons.star_rounded, color: Colors.yellow, size: getProportionateScreenWidth(20),),
                                Text("(${widget.details["number"]})", style: theme.textTheme.subtitle2,)
                              ],
                            )
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(10),
                        ),
                        ListTile(
                          contentPadding: EdgeInsets.all(0),
                          leading: Container(
                            padding: EdgeInsets.all(getProportionateScreenWidth(12)),
                            decoration: BoxDecoration(
                              borderRadius:
                              BorderRadius.circular(getProportionateScreenWidth(10)),
                              color: blueColor,
                            ),
                            child: Icon(
                              Icons.fastfood_outlined,
                              color: Colors.white,
                            ),
                          ),
                          title: Text('Use code "FREESHIP" to get free',
                              style: theme.textTheme.bodyText1.copyWith(color: Colors.black)),
                        ),
                        ListTile(
                          contentPadding: EdgeInsets.all(0),
                          leading: Container(
                            padding: EdgeInsets.all(getProportionateScreenWidth(12)),
                            decoration: BoxDecoration(
                              borderRadius:
                              BorderRadius.circular(getProportionateScreenWidth(10)),
                              color: blueColor,
                            ),
                            child: Icon(
                              Icons.local_offer_rounded,
                              color: Colors.white,
                            ),
                          ),
                          title: Text('20% OFF for all menu items',
                              style: theme.textTheme.bodyText1.copyWith(color: Colors.black)),
                        ),
                        Divider(
                          thickness: 1.5,
                        ),
                        ListTile(
                          contentPadding: EdgeInsets.all(0),
                          leading: Container(
                            padding: EdgeInsets.all(getProportionateScreenWidth(12)),
                            decoration: BoxDecoration(
                              borderRadius:
                              BorderRadius.circular(getProportionateScreenWidth(10)),
                              color: Colors.transparent,
                            ),
                            child: Icon(
                              Icons.shopping_cart,
                              color: Colors.grey,
                            ),
                          ),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Your last order - 1 item',
                                  style: theme.textTheme.bodyText1
                                      .copyWith(color: Colors.black)),
                              Icon(Icons.keyboard_arrow_down_rounded, color: blueColor),
                            ],
                          ),
                          subtitle: Text('BBQ pork ribs',
                              style: theme.textTheme.subtitle1.copyWith(color: Colors.grey)),
                        ),
                        Divider(
                          thickness: 1.5,
                        ),
                      ],
                    );
                  }
                  return InkWell(
                    onTap: () {
                      showModalBottomSheet(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(getProportionateScreenWidth(20)),
                                topRight: Radius.circular(getProportionateScreenWidth(20)),
                              )
                          ),
                          context: context,
                          builder: (context) => fOrderDialog(context)
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(
                          vertical: getProportionateScreenWidth(7)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: getProportionateScreenWidth(90),
                            width: getProportionateScreenWidth(90),
                            margin: EdgeInsets.only(
                                right: getProportionateScreenWidth(20)),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  getProportionateScreenWidth(10)),
                              color: primaryColor,
                            ),
                          ),
                          Row(
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Piezss",
                                    style: theme.textTheme.bodyText1
                                        .copyWith(color: Colors.black),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical:
                                        getProportionateScreenWidth(8)),
                                    child: Text(
                                      "Piezss",
                                      style: theme.textTheme.subtitle1.copyWith(
                                          color: Colors.grey.shade600),
                                    ),
                                  ),
                                  Text(
                                    "D150",
                                    style: theme.textTheme.bodyText1
                                        .copyWith(color: primaryColor),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: size.width * 0.3,
                              ),
                              Container(
                                alignment: Alignment.centerRight,
                                child: IconButton(
                                  icon: Icon(Icons.add_circle_rounded),
                                  color: primaryColor,
                                  iconSize: getProportionateScreenWidth(35),
                                  onPressed: () {
                                    showBottomSheet(
                                      context: context,
                                      builder: (context) => Container(
                                        padding: EdgeInsets.symmetric(vertical: getProportionateScreenWidth(5), horizontal: getProportionateScreenWidth(10)),
                                        color: primaryColor,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal:
                                                  getProportionateScreenWidth(
                                                      12),
                                                  vertical:
                                                  getProportionateScreenWidth(
                                                      7)),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius.circular(3),
                                                  color: Colors.white
                                                      .withOpacity(0.4)),
                                              child: Text(
                                                "1",
                                                style: theme.textTheme.bodyText2
                                                    .copyWith(
                                                    color: Colors.white,
                                                    fontWeight:
                                                    FontWeight.bold),
                                              ),
                                            ),
                                            InkWell(
                                              child: Text(
                                                "View Order",
                                                style: theme.textTheme.bodyText2
                                                    .copyWith(
                                                    color: Colors.white),
                                              ),
                                              onTap: () {
                                                Navigator.pushNamed(context, "/detailsMyOrder");
                                              },
                                            ),
                                            OutlinedButton(
                                              /*onPressed: () {},*/
                                              child: Text("\$150",
                                                  style: theme
                                                      .textTheme.bodyText2
                                                      .copyWith(
                                                      color: Colors.white)),
                                              style: OutlinedButton.styleFrom(
                                                primary: blueColor,
                                                elevation: 0,
                                                side: BorderSide(
                                                    color: Colors.white,
                                                    width: 1),
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        getProportionateScreenWidth(
                                                            3))),
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 0),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                }),*/