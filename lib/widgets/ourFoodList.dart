import 'package:flutter/material.dart';
import 'package:my_app/models/food.dart';
import 'package:my_app/widgets/ourFoodItem.dart';

class OurFoodList extends StatefulWidget {
  final List<Food> foods;
  final double widthPadding;
  final Function(String) addToCart;

  OurFoodList({
    Key key,
    this.foods,
    this.widthPadding,
    this.addToCart,
  }) : super(key: key);

  @override
  _OurFoodListState createState() => _OurFoodListState();
}

class _OurFoodListState extends State<OurFoodList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: widget.widthPadding,
      ),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: Scrollbar(
                child: ListView.builder(
                    itemCount: widget.foods.length,
                    itemBuilder: (BuildContext context, int index) {
                      return OurFoodItem(
                        food: widget.foods[index],
                        addToCart: widget.addToCart,
                      );
                    }),
              ),
            ),
            // here we will init a list of the foods we pass. that are available.
          ],
        ),
      ),
    );
  }
}
