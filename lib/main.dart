import 'package:flutter/material.dart';
import 'package:my_app/models/cart.dart';
import 'package:my_app/models/food.dart';
// import 'package:english_words/english_words.dart';
import 'package:my_app/widgets/ourAppBar.dart';
import 'package:my_app/widgets/ourFoodList.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String ourTitle = "Dulio's Dope Foods";

    return MaterialApp(
      title: ourTitle,
      home: Scaffold(
        body: Center(
          child: MainApp(title: ourTitle),
        ),
      ),
    );
  }
}

class MainApp extends StatefulWidget {
  final String title;
  MainApp({
    this.title,
  });
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  // class wide variable to keep track of our screen size,
  // we can use this to determine the device the user is on.
  Size size;

  List<Food> ourFood;

  Cart cart = new Cart();

  @override
  Widget build(BuildContext context) {
    ourFood = [
      Food(
        "some_id_string_from_firebase_1",
        "apple",
        "sometimes red!",
        0.65,
      ),
      Food(
        "some_id_string_from_firebase_2",
        "orange",
        "always orange!",
        0.50,
        // things in this format are optional fields in flutter! it is extremely useful :)
        portions: 1,
        image: "https://www.educationquizzes.com/library/KS1-English/Colours/Colours-Orange-C.jpg",
      ),
    ];

    size = MediaQuery.of(context).size;
    double ourWidth = size.width * 0.10;

    return Column(
      children: [
        OurAppBar(
          title: widget.title,
          widthPadding: ourWidth,
          // the below color is actually just a hex value like #CEB478 but put before "0xff"
          color: Color(0xffCEB478),
          cart: cart,
        ),
        Expanded(
          child: OurFoodList(
            foods: ourFood,
            widthPadding: ourWidth,
            addToCart: addToCart,
          ),
        ),
      ],
    );
  }

  addToCart(String foodID) {
    setState(() {
      if (cart != null) {
        cart.addToCart(foodID);
      } else {
        cart = new Cart();
        cart.addToCart(foodID);
        print(cart.foodIds.length);
      }
    });
  }
}
