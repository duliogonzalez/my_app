import 'package:flutter/material.dart';
import 'package:my_app/models/cart.dart';

class OurAppBar extends StatelessWidget {
  final String title;
  final TextStyle titleStyle;
  final double widthPadding;
  final Color color;
  final Cart cart;

  const OurAppBar({
    Key key,
    this.title,
    this.cart,
    this.titleStyle,
    this.widthPadding,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle thisTitleStyle;

    if (titleStyle == null) {
      thisTitleStyle = TextStyle(
        color: Colors.black,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      );
    } else {
      thisTitleStyle = titleStyle;
    }

    int numItems = 0;

    for (int i = 0; i < cart.foodIds.length; i++) {
      numItems += cart.foodIds[i].quant;
    }
    return Container(
      decoration: BoxDecoration(
          color: color,
          border: Border.all(
            color: Colors.grey,
          )),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: widthPadding,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(Icons.shopping_bag),
                Text(
                  title,
                  style: thisTitleStyle,
                ),
              ],
            ),
            FlatButton(
              onPressed: () {
                // this should navigate to the users cart.
                for (int i = 0; i < cart.foodIds.length; i++) {
                  print("foodID : ${cart.foodIds[i].foodId}  - quant ${cart.foodIds[i].quant}");
                }
              },
              child: Row(
                children: [
                  Stack(
                    children: [
                      Icon(
                        Icons.shopping_cart_outlined,
                      ),
                      cart.foodIds.length != 0
                          ? Positioned(
                              right: 0,
                              top: 0,
                              child: CircleAvatar(
                                radius: 6,
                                backgroundColor: Colors.red,
                                child: Center(
                                  child: Text(
                                    "!",
                                    style: TextStyle(
                                      fontSize: 8.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : Container()
                    ],
                  ),
                  SizedBox(
                    width: 6.0,
                  ),
                  Text("Checkout"),
                  cart != null && cart.foodIds != null && cart.foodIds.length != 0 ? Text(" ($numItems)") : Container(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
