import 'package:flutter/material.dart';

class MobileTaskbar extends StatelessWidget {
  final String icon;
  final void Function() onTap;
  const MobileTaskbar({super.key, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Image.asset(
        "assets/icons/$icon",
        height: 50,
        width: 50,
      ),
    );
  }
}
