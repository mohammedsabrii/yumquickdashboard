import 'package:flutter/material.dart';
import 'package:yumquickdashboard/core/utils/app_stayls.dart';

class StateContainer extends StatelessWidget {
  const StateContainer({super.key, required this.isActive});
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45,
      height: 24,
      decoration: ShapeDecoration(
        color: isActive ? const Color(0xFFC4F8E1) : const Color(0xFFE6E9F3),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
      child: Text(
        isActive ? 'Paid' : 'Pending',
        textAlign: TextAlign.center,
        style: AppStayls.styleInterRegular16(context).copyWith(
          color: isActive ? const Color(0xFF06A561) : const Color(0xFF5A607F),
        ),
      ),
    );
  }
}
