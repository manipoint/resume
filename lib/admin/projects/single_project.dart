
import 'package:flutter/material.dart';

class SingleProject extends StatelessWidget {
  final String image;
  const SingleProject({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //iphone13 pro max screen height 428
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: width <=1100 ? width/(width/400):width/(width/800),
      padding:  EdgeInsets.symmetric(horizontal: width/(width/12)),
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black12,
            width: width/285.34,
          ),
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
        ),
        child: Container(
          width: width <=1100 ? width/(width/380):width/(width/780),
          padding: const EdgeInsets.all(10),
          child: Image.network(
            image,
            fit: BoxFit.cover,
            width:  width/2.38,
          ),
        ),
      ),
    );
  }
}
