
import 'package:flutter/material.dart';
import 'package:foodie/components/color.dart';

class CustomWidget extends StatelessWidget {
  const CustomWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, "/product"),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 175,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                topLeft: Radius.circular(20),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 5,
                  offset: Offset(0, 0),
                )
              ],
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 115,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Component.bg,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Chipotle Cheesy Burger\nBeef Burger",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Rs 100",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Positioned(
            bottom: 33,
            // left: 40,
            child: Hero(
              tag: "producttag",
              child: Image.asset(
                "assets/images/burger.png",
                // alignment: Alignment.center,
                width: 230,
              ),
            ),
          )
        ],
      ),
    );
  }
}
