
import 'package:flutter/material.dart';


import '../constants.dart';

class CommunityIconBtn extends StatelessWidget {
  final String icon;
  final String link;
  final double height;

  const CommunityIconBtn({super.key,required this.icon,required this.link,required this.height});
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal:width/(width/12)),
      child: InkWell(
        child: Image.asset(
          icon,
          height: height,
        ),
        onTap: () => launchURL(Uri.parse(link)),
      ),
    );
  }
}
