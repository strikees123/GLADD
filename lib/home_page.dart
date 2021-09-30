// @dart=2.9
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:gladd/LPAnimals.dart';
import 'package:gladd/LPExp.dart';
import 'package:gladd/LPRelation.dart';
import 'package:gladd/LPSent.dart';
import 'package:gladd/LPWordHard.dart';
import 'package:gladd/LPWordsEasy.dart';
import 'package:gladd/LPalpha.dart';
import 'package:gladd/LPcolor.dart';
import 'package:gladd/LPnum.dart';
import 'package:vertical_card_pager/vertical_card_pager.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
   final List<String> titles = [
     "",
     "",
     "",
     "",
     "",
     "",
     "",
     "Hard Words",
     "Sentence",
   ];
  @override
  Widget build(BuildContext context) {
    final List<Widget> image = [
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/home/alp.jpg"),
            fit: BoxFit.fill,
          ),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
      ),
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/home/number.jpg"),
            fit: BoxFit.fill
          ),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
      ),
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/homepage/Animals.JPG"),
              fit: BoxFit.fill
          ),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
      ),
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/homepage/Color.JPG"),
              fit: BoxFit.fill
          ),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
      ),
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/homepage/family.JPG"),
              fit: BoxFit.fill
          ),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
      ),
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/homepage/Expressions.JPG"),
              fit: BoxFit.fill
          ),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
      ),
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/home/easy.png"),
              fit: BoxFit.fill
          ),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
      ),
      Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
                Colors.redAccent,
                Colors.blueAccent,
              ]
          ),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
      ),
      Container(
        decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.redAccent,
            Colors.blueAccent,
          ]
        ),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
      ),
    ];
    List classes = [
      LPalpha(),
      LPnum(),
      LPanimals(),
      LPColor(),
      LPRelation(),
      LPexp(),
      LPWordEasy(),
      LPWordHard(),
      LPSent(),
    ];
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            child: Container(
              child: VerticalCardPager(
                align: ALIGN.CENTER,
                textStyle: TextStyle(color: Colors.white),
                titles: titles,
                images: image,
                initialPage: 0,
                onSelectedItem: (index){
                  setState(() {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context)=>classes.elementAt(index))
                    );
                  });
                },
                onPageChanged: (page){
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}