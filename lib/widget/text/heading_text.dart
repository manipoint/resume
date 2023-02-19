import 'package:flutter/material.dart';

import '../app_colors.dart';


class HeadingText extends StatelessWidget {
  final Color color;
  final String text;
  final double size;
  final FontWeight fontWeight;

  final TextOverflow overflow;
  const HeadingText(
      {Key? key,
      this.color = AppColors.textBlackColor,
      required this.text,
      this.overflow = TextOverflow.ellipsis,
      this.size = 0,
      this.fontWeight =FontWeight.w400})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Text(
      text,
      maxLines: 1,
      overflow: overflow,
      style: TextStyle(
          color: color,
          fontSize: size == 0 ? height/(height/20) : size,
          fontWeight: fontWeight),
    );
  }
}
