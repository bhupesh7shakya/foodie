import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodie/components/color.dart';
import 'package:foodie/modals/SearchModel.dart';
import 'package:foodie/modals/searchdata.dart';
import 'package:foodie/screens/shared/shared.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool selected1 = true;
  bool selected2 = false;
  bool selected3 = false;
  bool homeScreen = true;

  Future<List> searchController(String search) async {
    UserModal user = new UserModal(search);
    List searchResult = await user.getSearch();
    List<SearchData> searchList = searchResult
        .map((value) => SearchData(value['id'], value['foodName'],
            value['foodPrice'], value['foodImageUrl'], value['resId']))
        .toList();
    return searchList;
  }

  @override
  void initState() {
    super.initState();
    searchController("momo");
    // print(searchController("momo"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Icon(
          Icons.menu,
          color: Colors.black54,
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.location_pin,
              color: Component.bg,
            ),
            SizedBox(width: 10),
            Text(
              "Lalitpur",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Colors.black),
            ),
            Text(
              ",Nepal",
              style: TextStyle(fontSize: 14, color: Colors.black),
            ),
          ],
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                "assets/images/profile.jpg",
                width: 50,
                height: 50,
                fit: BoxFit.fitHeight,
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Online Food",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Delivery! 👩‍🍳",
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Icon(CupertinoIcons.search,
                        size: 20, color: Colors.black87),
                  ),
                  Expanded(
                    flex: 7,
                    child: TextField(
                      onChanged: (value) {
                        setState(
                          () {
                            if (value.isEmpty) {
                              homeScreen = true;
                              print("no value");
                            } else {
                              homeScreen = false;
                            }
                          },
                        );
                      },
                      decoration: InputDecoration(
                        hintText: "Search your fav food",
                        hintStyle: TextStyle(color: Colors.black26),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black26),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black26),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              (homeScreen == false)
                  ? Column(
                      children: [
                        // (true)
                        //     ? Text("no match found")
                        // : CustomContainerCard(
                        //     productname: "Burger",
                        //     price: 100,
                        //     restraName: "The ALus",
                        //     imgUrl: "assets/images/burger.png",
                        //   ),
                      ],
                    )
                  : Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(
                                  () {
                                    selected1 = true;
                                    selected2 = false;
                                    selected3 = false;
                                  },
                                );
                              },
                              child: CustomCard(
                                color: selected1,
                                imgUrl: "assets/svg/hamburger.svg",
                                title: "Burgers",
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  selected1 = false;
                                  selected2 = true;
                                  selected3 = false;
                                });
                              },
                              child: CustomCard(
                                color: selected2,
                                imgUrl: "assets/svg/pizza.svg",
                                title: "Pizza",
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  selected1 = false;
                                  selected2 = false;
                                  selected3 = true;
                                });
                              },
                              child: CustomCard(
                                color: selected3,
                                imgUrl: "assets/svg/cake.svg",
                                title: "Dessert",
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Recommended 🍔',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                            Container(
                              width: 25,
                              height: 25,
                              decoration: BoxDecoration(
                                  color: Component.bg,
                                  borderRadius: BorderRadius.circular(8)),
                              child: Center(
                                child: Icon(
                                  CupertinoIcons.chevron_forward,
                                  color: Colors.white,
                                  size: 15,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        CustomWidget(),
                      ],
                    )
            ],
          ),
        ),
      ),
    );
  }
}
