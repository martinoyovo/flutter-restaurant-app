import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/core/utils/colors.dart';
import 'package:restaurant_app/core/utils/size_config.dart';
import 'package:restaurant_app/fake_datas/models/restaurant_menu.dart';
import 'package:restaurant_app/widgets/f_app_bar.dart';
import 'package:restaurant_app/widgets/f_elevated_button.dart';
import 'package:restaurant_app/widgets/f_network_image.dart';
import 'package:restaurant_app/widgets/f_order_list_item.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path/path.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;

class ViewOrder extends StatefulWidget {
  ViewOrder({Key key}) : super(key: key);

  @override
  _ViewOrderState createState() => _ViewOrderState();
}

class _ViewOrderState extends State<ViewOrder> {
  static const kDbFileName = 'foodmobile.db';
  static const kDbStoreName = 'foodmobile';
  Future<bool> _initDbFuture;
  Database _db;
  StoreRef<int, Map<String, dynamic>> _store;
  int nbrePlats;
  List<RestaurantMenuModel> orderList = [];

  Future<void> goToRestaurantMenu() async {
    final finder = Finder();
    final recordSnapshots = await this._store.find(this._db, finder: finder);
    this.orderList = recordSnapshots
        .map((snapshot) => RestaurantMenuModel.fromJsonMap({
      ...snapshot.value,
      'id': snapshot.key,
    }))
        .toList();
  }

  Future<void> deleteRestaurantMenu(RestaurantMenuModel restaurantMenu) async {
    int count = await this._store.delete(
      this._db,
      finder: Finder(filter: Filter.byKey(restaurantMenu.id)),
    );
    print('Mis à jour $count dans la bd.');
  }

  Future<bool> _initDb() async {
    final dbFolder = await pathProvider.getApplicationDocumentsDirectory();
    final dbPath = join(dbFolder.path, kDbFileName);
    this._db = await databaseFactoryIo.openDatabase(dbPath);
    print('BD créée au $dbPath');
    this._store = intMapStoreFactory.store(kDbStoreName);
    goToRestaurantMenu();
    return true;
  }

  @override
  void initState() {
    super.initState();
    _updateUI();
    setState(() {
      this._initDbFuture = _initDb();
    });
  }

  Future<void> _updateUI() async {
    await goToRestaurantMenu();
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: FAppBar("Saved", context),
      body:FutureBuilder<bool>(
        future: this._initDbFuture,
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return Center(
              child: Text("Data Loading", style: theme.textTheme.bodyText2.copyWith(color: Colors.black),),
            );
          return Stack(
            children: [
              Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.only(left: getProportionateScreenWidth(20), right: getProportionateScreenWidth(20), bottom: getProportionateScreenWidth(60)),
                  child: Column(
                    children: this.orderList.map(fOrderListItem).toList(),
                  ),
                ),
              ),
              Positioned(
                bottom: getProportionateScreenWidth(10),
                left: getProportionateScreenWidth(20),
                right: getProportionateScreenWidth(20),
                child: FElevatedButton(context, () {
                  Navigator.pushNamed(context, "/detailsMyOrder");
                }, "Make Order"),
              )
            ],
          );
        },
      )
    );
  }

  Container fOrderListItem(RestaurantMenuModel item) {
    print(item.url);
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: getProportionateScreenWidth(7)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: getProportionateScreenWidth(100),
            height: getProportionateScreenWidth(100),
            child: FNetworkImage(
                width: getProportionateScreenWidth(100),
                height: getProportionateScreenWidth(100),
                radius: getProportionateScreenWidth(15),
                imageUrl: item.url
            ),
          ),
          SizedBox(width: getProportionateScreenWidth(20),),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  item.name,
                  style: GoogleFonts.openSans(fontSize: 16, color: Colors.black)
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: getProportionateScreenWidth(4)),
                child: Text(item.description,
                    style: GoogleFonts.openSans(fontSize: 14, color: Colors.black)
                ),
              ),
              Text("\$${item.price}",
                  style: GoogleFonts.openSans(fontSize: 16, color: Colors.black)
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: primaryColor, width: 1.5),
                        padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(15), vertical: 0),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      ),
                      onPressed: () async {
                        await deleteRestaurantMenu(item);
                        _updateUI();
                      },
                      child: Row(
                        children: [
                          Icon(CupertinoIcons.clear_circled_solid, color: primaryColor, size: 15,),
                          SizedBox(width: getProportionateScreenWidth(5),),
                          Text("Remove", style: GoogleFonts.openSans(fontSize: 13, color: Colors.black)
                              .copyWith(color: primaryColor),),
                        ],
                      )
                  ),
                ],
              )
            ],
          ),
          Spacer(),
          Container(
            margin: EdgeInsets.only(left: getProportionateScreenWidth(20), bottom: getProportionateScreenWidth(45)),
            alignment: Alignment.topRight,
            child: IconButton(
              icon: Icon(Icons.check_circle_rounded),
              color: primaryColor,
              iconSize: getProportionateScreenWidth(30),
              onPressed: () {
              },
            ),
          ),
        ],
      ),
    );
  }
}