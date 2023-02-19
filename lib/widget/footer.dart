import 'package:flutter/material.dart';
import 'package:resume/widget/social_media_icon.dart';

import '../constants.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.fromLTRB(0, height * 0.05, 0, 0),
      height: height * .25,
      width: width,
      color: const Color(0xFF2B3B7C),
      child: Padding(
        padding: EdgeInsets.only(
            top: height * .004, left: width * .02, right: width * .02),
        child: Column(
            textDirection: TextDirection.rtl,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            top: height/(height/46),
                            left:width/(width/16)),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            for (int i = 0; i < kSocialIcons.length; i++)
                              SocialMediaIconBtn(
                                icon: kSocialIcons[i],
                                height: height/(height/20),
                                horizontalPadding: width/(width/16),
                                socialLink: kSocialLink[i],
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding:  EdgeInsets.only(top:height/(height/20)),
                    child: Image.asset(
                      'assets/tm.png',
                      height: height/(height/120),
                    ),
                  ),
                ],
              ),
            ]),
      ),
    );
  }
}
