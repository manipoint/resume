import 'package:resume/login/login.dart';
import 'package:resume/sections/services/services.dart';
import 'package:flutter/material.dart';

import 'package:resume/sections/show_case/show_case_items.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import '../animations/entrance_fader.dart';
import '../constants.dart';
import '../widget/arrow_on_top.dart';
import '../widget/footer.dart';
import 'about/about.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  ScrollController scrollController =
      ScrollController(initialScrollOffset: 25.0);

  /// Controller to scroll or jump to a particular item.
  final ItemScrollController itemScrollController = ItemScrollController();

  /// Listener that reports the position of items when the list is scrolled.
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();

  final List<String> _sectionsName = [
    "Show Case",
    "About",
    "Connect",
  ];

  void _scroll(int i) {
    itemScrollController.scrollTo(
        index: i, duration: const Duration(seconds: 1));
  }

  Widget sectionWidget(int i) {
    if (i == 0) {
      return const ShowCaseItems();
    } else if (i == 1) {
      return const About();
    } else if (i == 2) {
      return Services();
    } else if (i == 3) {
      return ArrowOnTop(
        onPressed: () => _scroll(0),
      );
    } else if (i == 4) {
      return const Footer();
    } else {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: _appBarTabDesktop(height, width),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: ScrollablePositionedList.builder(
          itemScrollController: itemScrollController,
          itemPositionsListener: itemPositionsListener,
          itemCount: 5,
          itemBuilder: (context, index) {
            return sectionWidget(index);
          },
        ),
      ),
    );
  }

  Widget _appBarActions(String childText, int index, double width) {
    return EntranceFader(
      offset: const Offset(0, -20),
      delay: const Duration(seconds: 2),
      duration: const Duration(seconds: 1),
      child: MaterialButton(
        onPressed: () => _scroll(index),
        child: Text(
          childText,
          style: TextStyle(
            color: kPrimaryColor,
            fontWeight: FontWeight.bold,
            fontSize: width <= 1100 ? 16 : 32 ,
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _appBarTabDesktop(double height, double width) {
    return AppBar(
      toolbarHeight: height / (height / 60),
      elevation: 0.0,
      leadingWidth: double.infinity,
      backgroundColor: Colors.white,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          for (int i = 0; i < _sectionsName.length; i++)
            _appBarActions(
              _sectionsName[i],
              i,
              height,
            ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => Login()));
            },
            child: Container(
              width: width <= 1100 ? 60 : 120,
              decoration: BoxDecoration(
                  color: const Color(0xFFEFDA74),
                  borderRadius: BorderRadius.circular(5)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    "Add",
                    style: TextStyle(
                      fontSize: width <= 1100 ? 14 : 24,
                      color: kPrimaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
          // EntranceFader(
          //     duration: const Duration(seconds: 1),
          //     offset: const Offset(0, -10),
          //     delay: const Duration(seconds: 3),
          //     child: Container(
          //       decoration: BoxDecoration(
          //         color: Colors.grey,
          //       ),
          //       height: MediaQuery.of(context).size.height * .06,
          //       width: AppDimensions.hight120,
          //       child: NavBarLogo(
          //         height: AppDimensions.hight140,
          //       ),
          //     )),
        ],
      ),
    );
  }
}
