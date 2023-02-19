import 'package:flutter/material.dart';
import 'package:resume/widget/app_colors.dart';
import 'package:url_launcher/url_launcher.dart';

import 'text/heading_text.dart';
import 'text_icon.dart';

class AppColumn extends StatelessWidget {
  final String text;
  final String linkSource;
  final String linkGetHub;

  const AppColumn({
    Key? key,
    required this.text, required this.linkSource, required this.linkGetHub,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      HeadingText(
        text: text.toUpperCase(),
        size: width <= 1100 ? width / (width / 16) : 32,
        fontWeight: FontWeight.w800,
      ),
      SizedBox(
        height: height / (height / 16),
      ),
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextIconWidget(
            icon: Icons.webhook,
            text: 'Source',
            iconColor: AppColors.iconColor,
            width: width <= 1100 ? width / (width / 16) : 20,
            iconSize: width <= 1100 ? width / (width / 16) : 20,
            onTap: () =>launchUrl(Uri.parse('https://www.google.com')),
          ),
          TextIconWidget(
            icon: Icons.link,
            text: 'Source Code',
            iconColor: AppColors.mainColor,
         width: width <= 1100 ? width / (width / 16) : 20,
            iconSize: width <= 1100 ? width / (width / 16) : 20,
            onTap: () =>
              launchUrl(Uri.parse(linkGetHub))
            ,
          ),
        ],
      ),
    ]);
  }
}
