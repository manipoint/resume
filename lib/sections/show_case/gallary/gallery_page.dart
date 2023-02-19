import 'package:flutter/material.dart';
import 'package:resume/admin/model/project_model.dart';

import 'grid_projects.dart';

class GalleryPage extends StatelessWidget {
  final ProjectModel projectModel;
  GalleryPage({super.key, required this.projectModel});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(),
      body: GridView.builder(
        shrinkWrap: true,
        primary: false,
        padding: EdgeInsets.all(width / (width / 20)),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: width <= 1100 ? 1 : 2,
          // childAspectRatio: MediaQuery.of(context).size.width /
          //     (MediaQuery.of(context).size.height / 1.25),
        ),
        itemCount: projectModel.images.length,
        itemBuilder: (BuildContext context, int index) {
          return GridProject(
            images: projectModel.images[index],
          );
        },
      ),
    );
  }
}
