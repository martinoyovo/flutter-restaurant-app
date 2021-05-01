class RestaurantMenuModel {
  final int id;
  final String url;
  final String name;
  final String description;
  final String price;
  RestaurantMenuModel({
    this.id,
    this.url,
    this.name,
    this.description,
    this.price
  });

  RestaurantMenuModel.fromJsonMap(Map<String, dynamic> map):
        id = map['id'],
        url = map['url'],
        name = map['name'],
        description = map['description'],
        price = map['price'];

  Map<String, dynamic> toJsonMap() => {
    'id': id,
    'url': url,
    'name': name,
    'description': description,
    'price': price,
  };
}