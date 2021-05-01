import 'dart:math';
import 'package:flutter/material.dart';
import 'package:food_mobile/core/utils/colors.dart';
import 'package:food_mobile/core/utils/db_functions.dart';
import 'package:food_mobile/core/utils/f_class.dart';
import 'package:food_mobile/core/utils/f_prefs.dart';
import 'package:food_mobile/core/utils/size_config.dart';
import 'package:food_mobile/fake_datas/menu_list.dart';
import 'package:food_mobile/fake_datas/models/restaurant_menu.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
import 'package:food_mobile/widgets/f_network_image.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;

class MenuList extends StatefulWidget {
  MenuList({Key key}) : super(key: key);

  @override
  _MenuListState createState() => _MenuListState();
}

class _MenuListState extends State<MenuList> {

  var rng = new Random();

  Future<bool> _initDbFuture;
  Database _db;
  StoreRef<int, Map<String, dynamic>> _store;
  List<RestaurantMenuModel> _savedMenus = [];
  int nbrePlats;

  Future<void> _updateUI() async {
    await goToRestaurantMenu();
    setState(() {});
  }
  static const kDbFileName = 'foodmobile.db';
  static const kDbStoreName = 'foodmobile';


  Future<bool> _initDb() async {
    final dbFolder = await pathProvider.getApplicationDocumentsDirectory();
    final dbPath = join(dbFolder.path, kDbFileName);
    this._db = await databaseFactoryIo.openDatabase(dbPath);
    print('BD créée au $dbPath');
    this._store = intMapStoreFactory.store(kDbStoreName);
    goToRestaurantMenu();
    return true;
  }

  Future<void> goToRestaurantMenu() async {
    final finder = Finder();
    final recordSnapshots = await this._store.find(this._db, finder: finder);
    this._savedMenus = recordSnapshots
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

  Future<void> addRestaurantMenu(RestaurantMenuModel item) async {
    int id = await this._store.add(this._db, item.toJsonMap());
    print('Ajouté dans la bd=$id.');
  }

  @override
  void initState() {
    super.initState();
    getNbre("nbrePlats").then((value) {
      setState(() {
        nbrePlats = value;
      });
    });
    _updateUI();
    this._initDbFuture = _initDb();
  }

  @override
  Widget build(BuildContext context) {
    final theme = FClass().getFTheme(context);
    final size = FClass().getFSize(context);
    return ListView.builder(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemCount:  menuList.length,
        itemBuilder: (context, int index) {
          var menuItem = menuList[index];
          return InkWell(
            onTap: () {

            },
            child: Container(
              margin: EdgeInsets.symmetric(
                  vertical: getProportionateScreenWidth(7)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: getProportionateScreenWidth(90),
                    width: getProportionateScreenWidth(90),
                    child: FNetworkImage(
                        imageUrl: "https://images.unsplash.com/photo-1617977264618-dc6c4a7b96a6?ixid=MnwyMjU3NDh8MHwxfHJhbmRvbXx8fHx8fHx8fDE2MTk2OTA2ODQ&ixlib=rb-1.2.1",
                        height: getProportionateScreenWidth(90),
                        width: getProportionateScreenWidth(90),
                        radius: getProportionateScreenWidth(12)
                    ),
                  ),
                  SizedBox(width: getProportionateScreenWidth(20),),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(menuItem["name"],
                        style: theme.textTheme.bodyText1
                            .copyWith(color: Colors.black),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical:
                            getProportionateScreenWidth(8)),
                        child: Text(
                          menuItem["description"],
                          style: theme.textTheme.subtitle1.copyWith(
                              color: Colors.grey.shade600),
                        ),
                      ),
                      Text(
                        "${menuItem["price"].substring(7, 12)}\$",
                        style: theme.textTheme.bodyText1
                            .copyWith(color: primaryColor),
                      ),
                    ],
                  ),
                  Spacer(),
                  IconButton(
                    icon: Icon(Icons.add_circle_rounded),
                    color: primaryColor,
                    iconSize: getProportionateScreenWidth(35),
                    onPressed: () async {
                      addNbre(_savedMenus.length);
                      setState(() {
                        nbrePlats++;
                      });
                      await addRestaurantMenu(
                          RestaurantMenuModel(
                            id: rng.nextInt(3),
                            name: menuItem["name"],
                            url: "https://images.unsplash.com/photo-1617977264618-dc6c4a7b96a6?ixid=MnwyMjU3NDh8MHwxfHJhbmRvbXx8fHx8fHx8fDE2MTk2OTA2ODQ&ixlib=rb-1.2.1",
                            description: menuItem["description"],
                            price: menuItem["price"].substring(7, 12)
                          )
                      );
                      final snackBar = SnackBar(
                        backgroundColor: primaryColor,
                        content: Row(
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
                                nbrePlats.toString(),
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
                                _updateUI();
                                Navigator.pushNamed(context, "/viewOrder");
                              },
                            ),
                            OutlinedButton(
                              onPressed: () {},
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
                      );

                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    },
                  )
                ],
              ),
            ),
          );
        }
    );
  }
}