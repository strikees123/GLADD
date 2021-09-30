import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class Landing extends StatelessWidget {
  final pageDecoration = PageDecoration(
    titleTextStyle:
        PageDecoration().titleTextStyle.copyWith(color: Colors.black),
    bodyTextStyle: PageDecoration().bodyTextStyle.copyWith(color: Colors.black),
    contentMargin: const EdgeInsets.all(10),
  );

  Landing(BuildContext context);
  List<PageViewModel> getPages() {
    return [
      PageViewModel(
          image: Image.asset("assets/images/learn1.png"),
          title: 'Lear With GLADD',
          body: 'Learn the Sign Language',
          footer: Text(
            'with Joy',
            style: TextStyle(color: Colors.black),
          ),
          decoration: pageDecoration),
      PageViewModel(
          image: Image.asset("assets/images/learn.png"),
          title: 'Interactive Learning',
          body: 'play with Sign Language',
          footer: Text(
            '@GLADD',
            style: TextStyle(color: Colors.black),
          )),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        globalBackgroundColor: Colors.white,
        pages: getPages(),
        done: Center(child:Text(
          "Get Started", style: TextStyle(
            color: Colors.black,
          ),)
        ),
        onDone: () {},
      ),
    );
  }
}
