import 'package:flutter/material.dart';
import 'package:foodie/components/color.dart';

class MiniButton extends StatelessWidget {
  final Icon icon;
  const MiniButton({
    Key? key,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        color: Component.bg.withOpacity(0.45),
        borderRadius: BorderRadius.circular(100),
      ),
      child: icon,
    );
  }
}
