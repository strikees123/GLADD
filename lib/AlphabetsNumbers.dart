// @dart=2.9
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:gladd/LPalpha.dart';
import 'package:gladd/LPnum.dart';
import 'package:google_fonts/google_fonts.dart';

import './home_page.dart';

import 'button_widget.dart';
import 'home_page.dart';

class AlphabetsNumbers extends StatelessWidget {
  final style = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  @override
  Widget build(BuildContext context) {
    var scaffold = Scaffold(
      body: Center(
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          const SizedBox(height: 24),
          Text(
            'ALPHABETS & NUMBERS',
            style: GoogleFonts.cinzel(
              textStyle: style,
            ),
          ),
          Image.asset("assets/Learn.png"),
          ButtonWidget(
            text: 'Alphabets',
            onClicked: () => (Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => LPalpha()),
            )),
          ),
          ButtonWidget(
            text: 'Numbers',
            onClicked: () => (Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => LPnum()),
            )),
          ),
        ]),
      ),
      floatingActionButton: SizedBox.fromSize(
        size: Size(56, 56), // button width and height
        child: ClipOval(
          child: Material(
            color: Colors.lightGreenAccent, // button color
            child: InkWell(
              splashColor: Colors.green, // splash color
              onTap: () => (Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (_) => Homepage()),
              )), // button pressed
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.home), // icon
                  // text
                ],
              ),
            ),
          ),
        ),
      ),
    );
    return scaffold;
  }

  // void goToOnBoarding(context) => Navigator.of(context).pushReplacement(
  //       MaterialPageRoute(builder: (_) => OnBoardingPage()),
  //     );
}

/// A Calculator.
// class Calculator {
//   /// Returns [value] plus 1.
//   int addOne(int value) => value + 1;
// }
