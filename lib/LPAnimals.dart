// @dart=2.9
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:gladd/Animals.dart';
import 'package:gladd/PlayAnimals.dart';
import 'package:gladd/floatingActionButton.dart';
import 'package:gladd/shadowContainer.dart';
import 'package:google_fonts/google_fonts.dart';

class LPanimals extends StatelessWidget {
  final style = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:
        Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Text(
            'ANIMALS',
            style: GoogleFonts.cinzel(
              textStyle: style,
            ),
          ),
          Image.asset(
            "assets/Animal.gif",
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: (){
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>LearnAnimal()));
                },
                child: container(context, Icons.collections_bookmark, "learn"),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width*0.12,
              ),
              GestureDetector(
                onTap: (){
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>PlayAnimals()));
                },
                child: container(context, Icons.play_arrow, " play "),
              ),
            ],
          ),
        ]),
      ),
      floatingActionButton: floatingActionButton(context),
    );
  }
}