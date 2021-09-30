// @dart=2.9
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:gladd/PlayWordHard.dart';
import 'package:gladd/WordsHard.dart';
import 'package:gladd/floatingActionButton.dart';
import 'package:gladd/shadowContainer.dart';
import 'package:google_fonts/google_fonts.dart';

class LPWordHard extends StatelessWidget {
  final style = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
            children: [
              const SizedBox(height: 0),
              Text(
                'HARD WORDS',
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
                      color: Colors.white,
                      blurRadius: 2.0,
                      spreadRadius: 0.0,
                      offset: Offset(2.0, 2.0),
                    )
                  ],
                ),
                child: Image.asset(
                  "assets/WordsEasy.gif",
                  fit: BoxFit.fill,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>HardCarousel()));
                    },
                    child: container(context, Icons.collections_bookmark, "Learn"),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width*0.17,
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>PlayWordHard()));
                    },
                    child: container(context, Icons.play_arrow, " Play "),
                  ),
                ],
              ),
        ]),
      ),
      floatingActionButton: floatingActionButton(context),
    );
  }
}