import 'package:flutter/material.dart';

class GridProject extends StatelessWidget {
  final String images;

  const GridProject({Key? key, required this.images}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.all(height / (height / 20)),
      height: width <= 1100 ? height / (height / 240) : height / (height / 440),
      width: MediaQuery.of(context).size.width / 2.2,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Image.network(
          images,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
