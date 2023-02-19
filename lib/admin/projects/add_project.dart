import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';
import '../../widget/custom_button.dart';
import '../../widget/custom_snackbar.dart';
import '../../widget/custom_text_field.dart';
import '../service/add_project_service.dart';

class AddProjectsPage extends StatefulWidget {
  const AddProjectsPage({Key? key}) : super(key: key);

  @override
  State<AddProjectsPage> createState() => _AddProjectsPageState();
}

class _AddProjectsPageState extends State<AddProjectsPage> {
  final TextEditingController projectNameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController urlController = TextEditingController();
  final TextEditingController codeController = TextEditingController();
  final ProjectServices projectServices = ProjectServices();
  final _addProjectFormKey = GlobalKey<FormState>();

  List<File> images = [];


  void selectImages() async {
    List<File> pickImage = await pickImages();
    setState(() {
      images = pickImage;
    });
  }

  void addProject() {
    if (_addProjectFormKey.currentState!.validate() && images.isNotEmpty) {
      projectServices.addProject(
          context: context,
          projectName: projectNameController.text,
          projectDescription: descriptionController.text,
          sourceCode: codeController.text,
          sourceUrl: urlController.text,
          images: images);
    }
  }

  // @override
  // void dispose() {
  //   super.dispose();
  //   projectNameController.dispose();
  //   descriptionController.dispose();
  //   priceController.dispose();
  //   quantityController.dispose();

  // }

  @override
  Widget build(BuildContext context) {
    //iphone13 pro max screen height 926
    double height = MediaQuery.of(context).size.height;
    //iphone13 pro max screen height 428
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(),
          ),
          title: const Text(
            'Add project',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _addProjectFormKey,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width / 35.66),
            child: Column(
              children: [
                SizedBox(height: height / 46.3),
                images.isNotEmpty
                    ? CarouselSlider(
                        items: images
                            .map(
                              (e) => Builder(
                                builder: (BuildContext context) => kIsWeb
                                    ? Image.network(
                                        e.path,
                                        fit: BoxFit.cover,
                                      )
                                    : Image.file(
                                        e,
                                        fit: BoxFit.cover,
                                      ),
                              ),
                            )
                            .toList(),
                        options: CarouselOptions(
                            viewportFraction: 1, height: height))
                    : GestureDetector(
                        onTap: selectImages,
                        child: DottedBorder(
                          borderType: BorderType.RRect,
                          radius: Radius.circular(height / 92.6),
                          dashPattern: const [10, 4],
                          strokeCap: StrokeCap.round,
                          child: Container(
                            width: double.infinity,
                            height: height / 6.17,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(height / 92.6),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.folder_open,
                                  size: height / 23.15,
                                ),
                                SizedBox(
                                  height: height / 57.87,
                                ),
                                Text(
                                  'Select project Images',
                                  style: TextStyle(
                                    fontSize: height / 57.87,
                                    color: const Color.fromRGBO(47, 43, 43, 1),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                SizedBox(height: height / 30.86),
                CustomTextField(
                  controller: projectNameController,
                  hintText: 'project Name',
                ),
                SizedBox(height: height / 92.6),
                CustomTextField(
                  controller: descriptionController,
                  hintText: 'Description',
                  maxLines: 7,
                ),
                SizedBox(height: height / 92.6),
                CustomTextField(
                  controller: urlController,
                  hintText: 'projectUrl',
                ),
                SizedBox(height: height / 92.6),
                CustomTextField(
                  controller: codeController,
                  hintText: 'get hub link ',
                ),
                SizedBox(height: height / 92.6),
                SizedBox(height: height / 92.6),
                CustomButton(
                  color: const Color.fromRGBO(92, 203, 73, 1),
                  text: 'Add',
                  onTap: addProject,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
