import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodie/components/color.dart';

class CustomCard extends StatefulWidget {
  final bool color;
  final String title;
  final String imgUrl;
  const CustomCard({
    Key? key,
    this.color = true,
    required this.title,
    required this.imgUrl,
  }) : super(key: key);

  @override
  _CustomCardState createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        width: 73,
        height: 140,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: 5,
              offset: Offset(0, 7),
              color: (widget.color)
                  ? Component.bg.withOpacity(0.4)
                  : Colors.black.withOpacity(0.4),
            )
          ],
          color: (widget.color) ? Component.bg : Colors.white,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Container(
                width: 55,
                height: 55,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border:
                      (widget.color) ? null : Border.all(color: Colors.black26),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: SvgPicture.asset(
                    widget.imgUrl,
                  ),
                ),
                // child: Image.asset("assets/images/pizza.png"),
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                widget.title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
              ),
              SizedBox(
                height: 12,
              ),
              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 1),
                  color: (widget.color) ? Colors.black : Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Icon(
                    CupertinoIcons.chevron_forward,
                    color: (widget.color) ? Colors.white : Colors.black,
                    size: 15,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
