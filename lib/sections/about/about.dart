import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import '../../widget/text/about_me_text.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: width <= 1100 ? width / (width / 12):width / (width / 32), vertical: height / (height / 16)),
      height: height,
      color: const Color(0xFF1C254E),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "\n Imran Latif",
            textDirection: TextDirection.ltr,
            style: GoogleFonts.montserrat(
              color: const Color(0xFF69ACD9),
              fontSize: width <= 1100 ? 32 : 44,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: height / (height / 20),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 3,
                child: AboutMeText(
                  textAlign: TextAlign.left,
                  fontSize: width <= 1100 ? 14 : 16,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
