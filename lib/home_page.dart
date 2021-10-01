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
import 'package:google_fonts/google_fonts.dart';
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
     List<Widget> image = [
      ///alphabet
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/finalFinal/ALPHA_OUT.jpg"),
            fit: BoxFit.fill,
          ),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
      ),
      ///number
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/finalFinal/numbers_outt.gif"),
            fit: BoxFit.fill
          ),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
      ),
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/finalFinal/output-onlinegiftools.gif"),
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
                image: AssetImage("assets/finalFinal/colours_outt.gif"),
            ),
          ),
        ),
      ),
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/finalFinal/output-onlinegiftools (1).gif"),
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
                image: AssetImage("assets/finalFinal/output-onlinegiftools (2).gif"),
                fit: BoxFit.fill
            ),
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
        ),
      ),
      Container(
        decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/finalFinal/sentences_out.gif"),
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
        title: Text("Select the Category",style:GoogleFonts.architectsDaughter(textStyle: TextStyle(fontWeight: FontWeight.bold),color: Colors.black)),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
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
      ),
    );
  }
}