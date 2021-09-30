// @dart=2.9
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:gladd/Expressions.dart';
import 'package:gladd/Playexp.dart';
import 'package:gladd/floatingActionButton.dart';
import 'package:gladd/shadowContainer.dart';
import 'package:google_fonts/google_fonts.dart';

class LPexp extends StatelessWidget {
  final style = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 0,
              ),
              Text(
                'EXPRESSIONS',
                style: GoogleFonts.cinzel(
                  textStyle: style,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width*0.78,
                height: MediaQuery.of(context).size.height*0.4,
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
                  "assets/expression.gif",
                  fit: BoxFit.fill,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>Learnexp()));
                    },
                    child: container(context, Icons.collections_bookmark, "learn"),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width*0.12,
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>Playexp()));
                    },
                    child: container(context, Icons.play_arrow, " play "),
                  ),
                ],
              )
        ]),
      ),
      floatingActionButton: floatingActionButton(context),
    );
  }
}
