import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutMeText extends StatelessWidget {
  final TextAlign? textAlign;
  final double? fontSize;

  const AboutMeText({Key? key, required this.textAlign,  this.fontSize}) : super(key: key);

  TextStyle _textStyle(double? fSize, bool bold) {
    return GoogleFonts.montserrat(
      fontSize: fSize ?? 14,
      fontWeight: !bold ? FontWeight.w100 : FontWeight.w400,
      letterSpacing: 1.0,
      height: 2.0,
      color: Colors.white,
    );
  }

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: textAlign ?? TextAlign.right,
      text: TextSpan(children: [
        TextSpan(
          text:
  'We are a company licensed by the Capital Market Authority with license No. 20212-30 for financial advisory services on August 26, 2020, and an investment management license on January 14, 2021. We allow individuals to enter local and international investment funds in easy steps through a secure platform with automated processes that remove Burdens and guarantees accuracy.We invest money in exchanged index funds that are compatible with Islamic Sharia.On November 23, 2021, Tamra Capital obtained the approval of the Capital Market Authority to start doing business.Tamra began doing business by launching its investment platform, after touching the problem of limited investment. On a specific category, we wanted it to be available to everyone through an advanced platform that facilitates the process accompanied by financial experts who faced complex investment problems.',
          style: MediaQuery.of(context).size.width < 400
              ? _textStyle(fontSize, false)
              : _textStyle(fontSize! + 2, false),
        ),
      ]),
    );
  }
}
