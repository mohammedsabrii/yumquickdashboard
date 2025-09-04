import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ActionItem extends StatelessWidget {
  const ActionItem({super.key, required this.icon, required this.onTap});
  final String icon;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 30,
        width: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          border: Border.all(color: Colors.grey),
        ),
        child: Center(child: SvgPicture.asset(icon)),
      ),
    );
  }
}
