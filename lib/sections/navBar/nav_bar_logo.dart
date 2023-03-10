import 'package:flutter/material.dart';

class NavBarLogo extends StatelessWidget {
  final double height;
  const NavBarLogo({super.key, required this.height});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.asset(
          'assets/tm.png',
          height: 40,
        ),
      ],
    );
  }
}
