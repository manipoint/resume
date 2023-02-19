import 'package:flutter/material.dart';

import 'app_colors.dart';

class TextIconWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color textColor;
  final Color iconColor;
  final double width;
  final double iconSize;
  final Function() onTap;
  const TextIconWidget({
    Key? key,
    required this.icon,
    required this.text,
    this.textColor = AppColors.paraColor,
    required this.iconColor,
    required this.width,
    required this.iconSize,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: onTap,
          icon: Icon(icon),
          color: iconColor,
          iconSize: iconSize,
        ),
        SizedBox(
          width: width,
        ),
        Text(
          text,
          style: TextStyle(color: textColor),
        )
      ],
    );
  }
}
