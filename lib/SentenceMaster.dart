// @dart=2.9

import 'package:flutter/material.dart';
import 'package:gladd/home_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';

class SentMaster extends StatelessWidget {
  final style = TextStyle(
      fontSize: 30, fontWeight: FontWeight.bold, color: Colors.blueGrey);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Padding(padding: EdgeInsets.all(10)),
          Image.asset(
            "assets/cool.gif",
          ),
          Align(
            alignment: Alignment.center,
          ),
          Text(
            'YOU HAVE MASTERED IN SENTENCES',
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(
              textStyle: style,
            ),
          ),
          Padding( 
            padding: EdgeInsets.all(5),
          ),
          const SizedBox(height: 24),
          GestureDetector(
            onTap: () => (Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (_) => Homepage()))
            ),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 20,horizontal: 25),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(29)),
                  gradient: LinearGradient(
                      colors: [
                        Colors.indigoAccent,
                        Colors.blue,
                      ]
                  )
              ),
              child: Text("Press me to go to HomePage",
                style: TextStyle(fontSize:17, color:Colors.white),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
