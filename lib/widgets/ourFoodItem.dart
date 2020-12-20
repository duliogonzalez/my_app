import 'package:flutter/material.dart';
import 'package:my_app/models/food.dart';

class OurFoodItem extends StatefulWidget {
  final Food food;
  final Function(String) addToCart;

  const OurFoodItem({
    Key key,
    this.food,
    this.addToCart,
  }) : super(key: key);

  @override
  _OurFoodItemState createState() => _OurFoodItemState();
}

class _OurFoodItemState extends State<OurFoodItem> {
  double imageSize = 70.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            border: Border.all(
              color: Colors.grey,
            )),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  widget.food.image != null
                      ? Image.network(
                          widget.food.image,
                          width: imageSize,
                          height: imageSize,
                        )
                      : Icon(
                          Icons.broken_image,
                          size: imageSize,
                        ),
                  SizedBox(
                    width: 4.0,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text(
                          widget.food.name.toUpperCase(),
                          style: TextStyle(
                            fontSize: 22.0,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 12.0),
                        child: FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text(
                            widget.food.description,
                            style: TextStyle(
                              color: Colors.grey[800],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: FlatButton(
                  onPressed: () {
                    widget.addToCart(widget.food.id);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8.0,
                      vertical: 4.0,
                    ),
                    child: Text("ADD TO CART!"),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
