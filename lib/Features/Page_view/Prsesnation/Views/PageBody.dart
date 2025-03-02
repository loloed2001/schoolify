import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'widgets/pag3.dart';
import 'widgets/page1.dart';
import 'widgets/page2.dart';

class Page_View extends StatefulWidget {
  const Page_View({super.key});

  @override
  State<Page_View> createState() => _Page_ViewState();
}

class _Page_ViewState extends State<Page_View> {
  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        PageView(
          controller: _controller,
          children: [Page1(), Page2(), Page3()],
        ),
        Padding(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * .75),
          child: Center(
            child: SmoothPageIndicator(
              controller: _controller,
              count: 3,
              effect: WormEffect(
                  activeDotColor: Colors.purple.shade500,
                  dotColor: Colors.purple.shade200,
                  dotHeight: MediaQuery.of(context).size.aspectRatio * 25,
                  dotWidth: MediaQuery.of(context).size.aspectRatio * 25),
            ),
          ),
        ),
      ]),
    );
  }
}
