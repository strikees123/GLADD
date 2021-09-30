// @dart=2.9
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gladd/LPAnimals.dart';
import 'package:gladd/LPExp.dart';
import 'package:gladd/LPRelation.dart';
import 'package:gladd/LPSent.dart';
import 'package:gladd/LPalpha.dart';
import 'package:gladd/LPcolor.dart';
import 'package:gladd/LPnum.dart';
import 'package:gladd/wordCommon.dart';
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
     "",
   ];
  @override
  Widget build(BuildContext context) {
    final List<Widget> image = [
      ///alphabet
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/finalHome/ABC1.png"),
            fit: BoxFit.fill,
          ),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
      ),
      ///number
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/finalHome/NUmbers1.gif"),
            fit: BoxFit.fill
          ),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
      ),
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/finalHome/animaluse.gif"),
              fit: BoxFit.fill
          ),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
      ),
      Container(
        height:  250,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/finalHome/colours2.gif"),
            ),
          ),
        ),
      ),
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/finalHome/family3.gif"),
              fit: BoxFit.fill
          ),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
      ),
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/finalHome/emoji_2.gif"),
              fit: BoxFit.fill
          ),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
      ),
      Container(
        padding: EdgeInsets.all(20),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/finalHome/Words1.gif"),
                fit: BoxFit.fill
            ),
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
        ),
      ),
      Container(
        decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/finalHome/SentenceOrAlpha.gif"),
          fit: BoxFit.fill,
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
      WordCommon(),
      LPSent(),
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("Select the Category",style: TextStyle(color: Colors.black,fontStyle: FontStyle.italic)),
      ),
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