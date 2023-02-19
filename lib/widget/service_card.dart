
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resume/widget/app_colors.dart';

import '../constants.dart';

class ServiceCard extends StatelessWidget {
  final String serviceIcon;
  final String? serviceTitle;
  final String? serviceDescription;
  final double? cardWidth;
  final double? cardHeight;

  const ServiceCard(
      {super.key, required this.serviceIcon,
      this.serviceTitle,
      this.serviceDescription,
      this.cardHeight,
      this.cardWidth});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: cardWidth,
      height: cardHeight,
      padding: EdgeInsets.symmetric(vertical: height/(height/8), horizontal: width/(width/12)),
      decoration: BoxDecoration(
        color: Colors.green[100],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            serviceIcon,
            height:  height /(height/80),
            color: kPrimaryColor,
          ),
          SizedBox(
             height: height /(height/8),
          ),
          Text(
            serviceTitle!,
            textAlign: TextAlign.center,
            style: GoogleFonts.montserrat(
              color: Colors.black,
              fontSize: width<=1200? 16:24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: height /(height/8),
          ),
          Expanded(
            child: Text(
              serviceDescription!,
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(
                  color: Colors.grey,
                  fontSize: width<=1200? 12:18,
                  fontWeight: FontWeight.w200,
                  height: width < 900 ? 2.3 : 1.5),
            ),
          )
        ],
      ),
    );
  }
}
