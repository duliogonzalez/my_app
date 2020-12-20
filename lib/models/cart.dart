import 'package:my_app/models/cartData.dart';

class Cart {
  List<CartData> foodIds;
  DateTime createDate;

  Cart() {
    foodIds = [];

    createDate = DateTime.now();
  }

  int addToCart(String id) {
    if (foodIds != null) {
      if (foodIds.length == 0) {
        foodIds.add(CartData(id, 1));
        return (1);
      }

      int i = foodIds.indexWhere((element) => element.foodId == id);

      if (i < 0) {
        foodIds.add(
          CartData(id, 1),
        );
      } else {
        foodIds[i].quant++;
      }
    }
    return (foodIds.length);
  }
}
