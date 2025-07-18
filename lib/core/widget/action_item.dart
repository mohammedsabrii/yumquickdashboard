import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ActionItem extends StatelessWidget {
  const ActionItem({super.key, required this.icon});
  final String icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        border: Border.all(color: Colors.grey),
      ),
      child: Center(child: SvgPicture.asset(icon)),
    );
  }
}
