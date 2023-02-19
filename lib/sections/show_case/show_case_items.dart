import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:resume/admin/model/project_model.dart';
import 'package:resume/admin/service/add_project_service.dart';
import 'package:resume/widget/custom_snackbar.dart';
import '../../widget/app_colors.dart';
import '../../widget/app_column.dart';
import 'gallary/gallery_page.dart';

class ShowCaseItems extends StatefulWidget {
  const ShowCaseItems({Key? key}) : super(key: key);

  @override
  State<ShowCaseItems> createState() => _ShowCaseItemsState();
}

class _ShowCaseItemsState extends State<ShowCaseItems> {
  PageController pageController = PageController(viewportFraction: .85);
  ProjectServices projectServices = ProjectServices();
  var _currentPageValue = 0.0;
  final double _scaleFactor = .75;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currentPageValue = pageController.page!;
      });
    });
  }

  // Future<int> getItemCount() async {
  //   Stream itemInStream = projectServices.getAllProducts();
  //   int items = await itemInStream.length;
  //   return items;
  // }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        SizedBox(
            height: height,
            child: StreamBuilder(
                stream: projectServices.getAllProducts(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return showSnackBar(context, snapshot.error.toString());
                  }

                  if (snapshot.hasData) {
                    return PageView.builder(
                        controller: pageController,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return _buildFeatureItems(
                              index: index,
                              height: height,
                              width: width,
                              projectModel: snapshot.data![index],
                              image: snapshot.data![index].images[0],
                              projectName: snapshot.data![index].name,
                              getHubSource: snapshot.data![index].sourceCode,
                              projectLink: snapshot.data![index].sourceUrl);
                        });
                  }
                  return const Center(
                      child: CircularProgressIndicator.adaptive(
                          backgroundColor: Colors.red));
                })),
        StreamBuilder(
            stream: projectServices.getAllProducts(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return DotsIndicator(
                  dotsCount: snapshot.data!.length,
                  position: _currentPageValue,
                  decorator: DotsDecorator(
                    activeColor: AppColors.mainColor,
                    size: Size.square(height / (height / 10)),
                    activeSize:
                        Size(height / (height / 20), height / (height / 10)),
                    activeShape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(height / (height / 6))),
                  ),
                );
              }
              return const Center(
                  child: CircularProgressIndicator.adaptive(
                      backgroundColor: Colors.red));
            }),
        SizedBox(
          height: height / (height / 12),
        ),
      ],
    );
  }

  Widget _buildFeatureItems(
      {required int index,
      required double height,
      required double width,
      required ProjectModel projectModel,
      required String image,
      required String projectName,
      required String getHubSource,
      required projectLink}) {
    Matrix4 matrix4 = Matrix4.identity();
    if (index == _currentPageValue.floor()) {
      var currentScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currentTran = height * (1 - currentScale) / 2;
      matrix4 = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currentTran, 0);
    } else if (index == _currentPageValue.floor() + 1) {
      var currentScale =
          _scaleFactor + (_currentPageValue - index + 1) * (1 - _scaleFactor);

      var currentTran = height * (1 - currentScale) / 2;

      matrix4 = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currentTran, 0);
    } else if (index == _currentPageValue.floor() - 1) {
      var currentScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currentTran = height * (1 - currentScale) / 2;
      matrix4 = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currentTran, 0);
    } else {
      var currentScale = .75;
      matrix4 = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(1, height * (1 - currentScale) / 2, 1);
    }
    return Transform(
      transform: matrix4,
      child: Stack(
        children: [
          GestureDetector(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => GalleryPage(
                          projectModel: projectModel,
                        ))),
            child: Container(
              margin: EdgeInsets.only(
                left: height / (height / 10),
                right: height / (height / 10),
                top: height / (height / 60),
              ),
              height: height / 1.16,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(image), fit: BoxFit.cover),
                  color: const Color.fromRGBO(244, 244, 236, 1),
                  borderRadius: BorderRadius.circular(height / (height / 20))),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: height / (height / 120),
              width: width <= 1100 ? width / (width / 320) : width * .8,
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(241, 242, 246, 1),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      offset: Offset(0, 5),
                      blurRadius: 5,
                      color: Color.fromRGBO(230, 236, 240, 1),
                    ),
                    BoxShadow(
                      offset: Offset(-5, 0),
                      color: Color.fromRGBO(241, 242, 246, 1),
                    ),
                    BoxShadow(
                      offset: Offset(5, 0),
                      color: Color.fromRGBO(241, 242, 246, 1),
                    ),
                  ]),
              child: Padding(
                padding: EdgeInsets.only(
                    top: height / (height / 16),
                    left:width <= 1100 ? width / (width / 4) : 60,
                    right: width <= 1100 ? width / (width / 4) : 60),
                child: AppColumn(
                  text: projectName,
                  linkGetHub: getHubSource,
                  linkSource: projectLink,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
