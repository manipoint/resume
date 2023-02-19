import 'package:flutter/material.dart';


class AppIcons extends StatelessWidget {
  final IconData icon;
  final Color backgroundColor;
  final Color iconColor;
  final double iconSize;
  final double size;
  const AppIcons({
    Key? key,
    required this.icon,
    this.backgroundColor = const Color.fromRGBO(252, 244, 228, 1),
    this.iconColor = const Color.fromRGBO(99, 97, 92, 1),
    this.iconSize = 16,
    this.size = 40
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(size / 2),
          color: backgroundColor),
      child: Icon(
        icon,
        size:iconSize,
      ),
    );
  }
}
