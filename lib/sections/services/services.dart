import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constants.dart';
import '../../widget/service_card.dart';

class Services extends StatelessWidget {
  const Services({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Container(
      height: width <=1200 ? height/(height/510):580,
      margin: EdgeInsets.only(top: height/(height/60)),

      child: Column(
        children: [
          RichText(
            text: TextSpan(
              text: "Why start",
              style: GoogleFonts.montserrat(
                fontSize:
                    width <= 1200 ? width / (width / 24) : width / (width / 60),
                fontWeight: FontWeight.bold,
                color: kPrimaryColor,
              ),
              children: const <TextSpan>[
                TextSpan(
                    text: " By Heiring?",
                    style: TextStyle(color: Color(0xFF69ACD9))),
              ],
            ),
          ),
          SizedBox(height: 40,),
          Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                   SizedBox(
                    width: width * 0.03,
                  ),
                  ServiceCard(
                    cardWidth: width < 1200 ? 180 : 320,
                    cardHeight: width < 1200 ? height / 1.7 : height / 2,
                    serviceIcon: kServicesIcons[0],
                    serviceTitle: kServicesTitles[0],
                    serviceDescription: kServicesDescriptions[0],
                  ),
                  SizedBox(
                    width: width * 0.03,
                  ),
                  // ServiceCard(
                  //   cardWidth: width < 1200 ? 140 : width * 0.22,
                  //   cardHeight: width < 1200 ? 1000 : height ,
                  //   serviceIcon: kServicesIcons[1],
                  //   serviceTitle: kServicesTitles[1],
                  //   serviceDescription: kServicesDescriptions[1],
                  // ),
                  // SizedBox(
                  //   width: width * 0.03,
                  // ),
                  ServiceCard(
                    cardWidth: width < 1200 ? 180 : 320,
                    cardHeight: width < 1200 ? height / 1.7 : height / 2,
                    serviceIcon: kServicesIcons[2],
                    serviceTitle: kServicesTitles[2],
                    serviceDescription: kServicesDescriptions[2],
                  ),
                ],
              ),
              SizedBox(
                height: height / (height / 4),
              ),
            ],
          )
        ],
      ),
    );
  }
}
