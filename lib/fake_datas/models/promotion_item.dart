import 'package:restaurant_app/fake_datas/promotion_list.dart';

class PromotionItem {
  String url;
  String percentage;
  String delay;

  PromotionItem(this.url, this.percentage, this.delay);

  @override
  String toString() {
    return '{ ${this.url}, ${this.percentage}, ${this.delay} }';
  }
}

void mapToList({var list}) {
  for (int i = 0; i<=promotionList.length; i++) {
    promotionList[i].forEach((u, v) => list.add(PromotionItem(u, u, v)));
    print(list);
  }
}