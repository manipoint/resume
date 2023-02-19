import 'package:flutter/material.dart';
import 'package:resume/admin/projects/add_project.dart';
import 'package:resume/admin/service/add_project_service.dart';
import 'projects/single_project.dart';

class ProjectsPage extends StatelessWidget {
  ProjectsPage({Key? key}) : super(key: key);

  final ProjectServices projectServices = ProjectServices();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: StreamBuilder(
          stream: projectServices.getAllProducts(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return  Text(snapshot.error.toString());
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator.adaptive());
            }
            return snapshot.hasData
                ? GridView.builder(
                    itemCount: snapshot.data!.length,
                    gridDelegate:
                         SliverGridDelegateWithFixedCrossAxisCount(

                            crossAxisCount: width<=1100 ?1:2),
                    itemBuilder: (_, index) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: width <=1100 ? width/(width/380):width/(width/680),
                            child: SingleProject(
                                image: snapshot.data![index].images[0]),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding:
                                      EdgeInsets.only(left: height / 51.44),
                                  child: Text(
                                    snapshot.data![index].name,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                  ),
                                ),
                              ),
                              // IconButton(
                              //   onPressed: () => deleteProduct(productList, index),
                              //   icon: const Icon(
                              //     Icons.delete,
                              //     color: Colors.redAccent,
                              //   ),
                              // ),
                            ],
                          ),
                        ],
                      );
                    },
                  )
                : const CircularProgressIndicator.adaptive();
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AddProjectsPage(),
              ));
        },
        tooltip: "Add Project",
        child: const Icon(
          Icons.add,
          color: Colors.red,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
