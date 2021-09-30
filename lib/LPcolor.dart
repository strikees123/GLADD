// @dart=2.9
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:gladd/Colors.dart';
import 'package:gladd/PlayColor.dart';
import 'package:gladd/floatingActionButton.dart';
import 'package:gladd/shadowContainer.dart';
import 'package:google_fonts/google_fonts.dart';

class LPColor extends StatelessWidget {
  final style = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:
        Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
          Text(
            'COLOURS',
            style: GoogleFonts.cinzel(
              textStyle: style,
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width*0.78,
            height: MediaQuery.of(context).size.height*0.38,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 2.0,
                  spreadRadius: 0.0,
                  offset: Offset(2.0, 2.0),
                )
              ],
            ),
            child: Image.asset(
              "assets/color.gif",
              fit: BoxFit.fill,
            ),
          ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: (){
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>LearnColor()));
              },
              child: container(context, Icons.collections_bookmark, "Learn"),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width*0.12,
            ),
            GestureDetector(
              onTap: (){
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>PlayColor()));
              },
              child: container(context, Icons.play_arrow, " Play "),
            ),
          ],
        ),
        ],
            )
      ),
      floatingActionButton: floatingActionButton(context),
    );
  }
}

/// A Calculator.
// class Calculator {
//   /// Returns [value] plus 1.
//   int addOne(int value) => value + 1;
// }
