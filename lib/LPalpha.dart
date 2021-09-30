// @dart=2.9
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:gladd/QUiz.dart';
import 'package:gladd/floatingActionButton.dart';
import 'package:gladd/shadowContainer.dart';
import 'package:google_fonts/google_fonts.dart';
import './PlayAlpha.dart';
import 'Alphabets.dart';

class LPalpha extends StatelessWidget {
  final style = TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
        const SizedBox(height: 2),
        Text('ALPHABETS',
          style: GoogleFonts.cinzel(
            textStyle: style
          )
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.2,
          child: Image.asset(
            "assets/finalHome/ABC_Homw.gif",
            fit: BoxFit.fill,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                GestureDetector(
                    onTap: (){
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (_) => PlayAlpha())
                      );
                    },
                    child: container(context, Icons.play_arrow, " Play ")
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.06,
                ),
                GestureDetector(
                    onTap: (){
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (_) => QuizApp())
                      );
                    },
                    child: container(context, Icons.quiz, " Quiz ")
                ),
              ],
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width*0.09,
            ),
            GestureDetector(
                onTap: ()
                {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (_)=>AlphaCarousel())
                  );
                },
                child: container(context, Icons.collections_bookmark, "Learn")
            ),
          ],
        ),

      ]),
      floatingActionButton: floatingActionButton(context),
    );
  }
}
