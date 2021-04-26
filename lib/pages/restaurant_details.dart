import 'package:flutter/material.dart';
import 'package:food_mobile/core/utils/colors.dart';
import 'package:food_mobile/core/utils/f_class.dart';
import 'package:food_mobile/core/utils/size_config.dart';
import 'package:food_mobile/widgets/f_item_infos.dart';

class RestaurantDetails extends StatefulWidget {
  final Map<String, dynamic> details;
  RestaurantDetails({Key key, this.details, }) : super(key: key);

  @override
  _RestaurantDetailsState createState() => _RestaurantDetailsState();
}

class _RestaurantDetailsState extends State<RestaurantDetails> {
  @override
  Widget build(BuildContext context) {
    final theme = FClass().getFTheme(context);
    final size = FClass().getFSize(context);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          /*SliverPersistentHeader(
            delegate: _DetailsHeader(),
          ),
          SliverToBoxAdapter(
            child: Container(
              child: ListView.builder(
                itemCount: 20,
                itemBuilder: (c, i) => Text("$i"))
            ),
          )*/
          SliverAppBar(
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
            expandedHeight: size.height* 0.28,
            floating: true,
            pinned: true,
            //title: Text("Food Mobile", style: theme.textTheme.headline5.copyWith(color: Colors.black),),
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(widget.details["url"], fit: BoxFit.cover,),
            ),
          ),
          SliverFillRemaining(
            child: ListView(
              padding: EdgeInsets.all(getProportionateScreenWidth(15)),
              children: [
                Text(widget.details["title"], style: theme.textTheme.headline4.copyWith(color: Colors.black, fontWeight: FontWeight.bold),),
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
                Container(
                  margin: EdgeInsets.symmetric(vertical: getProportionateScreenWidth(10)),
                  padding: EdgeInsets.all(getProportionateScreenWidth(3)),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(getProportionateScreenWidth(100)),
                    color: Colors.grey.shade200
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: size.width*0.44,
                        padding: EdgeInsets.symmetric(vertical: getProportionateScreenWidth(3)),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(getProportionateScreenWidth(100)),
                            color: Colors.white
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("Delivery", style: theme.textTheme.subtitle2.copyWith(color: Colors.black, fontWeight: FontWeight.bold),),
                            Text("${widget.details["time"]} mins", style: theme.textTheme.subtitle1.copyWith(color: Colors.black),),
                          ],
                        ),
                      ),
                      Container(
                        width: size.width*0.44,
                        padding: EdgeInsets.symmetric(vertical: getProportionateScreenWidth(3)),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(getProportionateScreenWidth(100)),
                            color: Colors.transparent
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("Pickup", style: theme.textTheme.subtitle2.copyWith(color: Colors.black, fontWeight: FontWeight.bold),),
                            Text("${widget.details["time"]} mins", style: theme.textTheme.subtitle1.copyWith(color: Colors.black),),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(color: Colors.grey.shade600,),
                ListTile(
                  contentPadding: EdgeInsets.all(0),
                  title: Text("Store info", style: theme.textTheme.bodyText2.copyWith(color: Colors.black, fontWeight: FontWeight.bold),),
                  subtitle: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.location_pin, color: Colors.grey.shade400, size: getProportionateScreenWidth(23)),
                          Text(widget.details['address']),
                        ],
                      ),
                      FlatButton(
                        onPressed: () {
                        },
                        textColor: theme.primaryColor,
                        padding: EdgeInsets.symmetric(vertical: 4),
                        child: Text("More info", style: theme.textTheme.subtitle2.copyWith(color: primaryColor, fontWeight: FontWeight.bold)),
                        highlightColor: theme.primaryColor.withOpacity(0.2),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(getProportionateScreenWidth(50))),
                      ),
                    ],
                  ),
                ),
                Divider(color: Colors.grey.shade600,),
                ListTile(
                  contentPadding: EdgeInsets.all(0),
                  title: Text("Menu", style: theme.textTheme.bodyText2.copyWith(color: Colors.black),),
                  trailing: Icon(Icons.search_rounded, color: Colors.black, size: getProportionateScreenWidth(25),),
                ),
              ],
            )
          )
        ],
      ),
    );
  }
}
/*Container(
              child: Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 50),
                    alignment: Alignment.topCenter,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(getProportionateScreenWidth(30)),
                          bottomRight: Radius.circular(getProportionateScreenWidth(30)),
                        ),
                      image: DecorationImage(
                        image: NetworkImage(widget.details['url']),
                        fit: BoxFit.cover
                      )
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: getProportionateScreenWidth(30)),
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
                  /*Positioned(
                    bottom: getProportionateScreenHeight(0),
                    left: 0,
                    right: 0,
                    child: ItemInfos(context: context, item: widget.details)
                  )*/
                ],
              ),
            )*/
const _maxHeaderExtent = 350.0;
const _minHeaderExtent = 100.0;

class _DetailsHeader extends SliverPersistentHeaderDelegate{
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.black,
    );
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => _maxHeaderExtent;

  @override
  // TODO: implement minExtent
  double get minExtent => _minHeaderExtent;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => false;
}