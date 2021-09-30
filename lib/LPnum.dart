// @dart=2.9
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:gladd/Numbers.dart';
import 'package:gladd/PlayNum.dart';
import 'package:gladd/floatingActionButton.dart';
import 'package:gladd/shadowContainer.dart';
import 'package:google_fonts/google_fonts.dart';

class LPnum extends StatelessWidget {
  final style = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:
        Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            Text(
              'NUMBERS',
              style: GoogleFonts.cinzel(
                textStyle: style,
              ),
            ),
            Image.asset(
              "assets/num123.gif",
            ),
             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 GestureDetector(
                   onTap: ()
                   {
                     Navigator.of(context).pushReplacement(
                         MaterialPageRoute(builder: (_)=>NumberCarousel())
                     );
                   },
                   child: container(context, Icons.collections_bookmark, "Learn"),
                 ),
                 SizedBox(
                   width: MediaQuery.of(context).size.width*0.12,
                 ),
                 GestureDetector(
                   onTap: (){
                     Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>PlayNum()));
                   },
                   child: container(context, Icons.play_arrow, " Play "),
                 ),
               ],
             )
        ]),
      ),
      floatingActionButton: floatingActionButton(context),
    );
  }
}
