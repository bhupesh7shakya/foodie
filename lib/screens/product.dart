import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodie/components/color.dart';
import 'package:foodie/screens/shared/shared.dart';

class Product extends StatefulWidget {
  const Product({Key? key}) : super(key: key);

  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> {
  int qty = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
            margin: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  blurRadius: 0.5,
                  color: Colors.black26,
                  offset: Offset(
                    0,
                    2,
                  ),
                ),
              ],
            ),
            child: Icon(CupertinoIcons.back),
          ),
        ),
        actions: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 5,
            ),
            margin: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  blurRadius: 0.5,
                  color: Colors.black26,
                  offset: Offset(
                    0,
                    2,
                  ),
                ),
              ],
            ),
            child: Icon(CupertinoIcons.heart),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 15,
          ),
          Text(
            "Bacon Burger 🍔",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35),
            child: Text(
              "A Signature flame-grilled beef patty topped with smoked bacons.",
              style: TextStyle(
                fontSize: 12,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Positioned(
                top: 100,
                child: Container(
                  width: MediaQuery.of(context).size.width / 0.99,
                  height: MediaQuery.of(context).size.width / 2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(360),
                      bottomRight: Radius.circular(360),
                    ),
                    // shape: BoxShape.circle,
                    color: Colors.transparent,

                    boxShadow: [
                      const BoxShadow(
                        color: Colors.black12,
                      ),
                      const BoxShadow(
                        offset: Offset(0, -12),
                        color: Colors.white,
                        spreadRadius: 8.0,
                        blurRadius: 10.0,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.5,
                height: MediaQuery.of(context).size.width / 1.5,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.transparent,
                  boxShadow: [
                    const BoxShadow(
                      color: Colors.black12,
                    ),
                    const BoxShadow(
                      color: Colors.white,
                      spreadRadius: -2.0,
                      blurRadius: 12.0,
                    ),
                  ],
                ),
              ),
              Hero(
                tag: "productTag",
                child: Image.asset(
                  "assets/images/burger.png",
                  // alignment: Alignment.center,
                  width: 250,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 65,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onLongPress: () {
                  setState(() {
                    qty = 0;
                  });
                },
                onTap: () {
                  setState(() {
                    (qty > 0) ? qty = qty - 1 : print("Negative number order");
                  });
                },
                child: MiniButton(
                  icon: Icon(
                    Icons.remove,
                    size: 20,
                    color: Colors.yellowAccent.withGreen(150),
                  ),
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Text(
                qty.toString(),
                style: TextStyle(fontSize: 22),
              ),
              SizedBox(
                width: 15,
              ),
              GestureDetector(
                onLongPress: () {
                  setState(() {
                    qty = 25;
                  });
                },
                onTap: () {
                  setState(() {
                    (qty < 26) ? qty = qty + 1 : print("Limited order");
                  });
                },
                child: MiniButton(
                  icon: Icon(
                    Icons.add,
                    size: 20,
                    color: Colors.yellowAccent.withGreen(150),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Price\n",
                      style: TextStyle(fontSize: 13),
                    ),
                    Text(
                      "Rs 100",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: 160,
                height: 50,
                decoration: BoxDecoration(
                  color: Component.bg,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(CupertinoIcons.cart),
                      Padding(
                        padding: const EdgeInsets.only(left: 0.0),
                        child: Text(
                          "Go to Cart",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
