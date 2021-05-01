import 'package:food_mobile/fake_datas/models/restaurant_menu.dart';
import 'package:sembast/sembast.dart';
import 'package:path/path.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;

class DBFunctions {
  static const kDbFileName = 'foodmobile.db';
  static const kDbStoreName = 'foodmobile';

  Future<bool> _initDbFuture;
  Database _db;
  StoreRef<int, Map<String, dynamic>> _store;
  List<RestaurantMenuModel> _savedMenus = [];
  int nbrePlats;


  Future<bool> initDb() async {
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
}