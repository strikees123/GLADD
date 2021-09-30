//@dart = 2.9
import 'package:flutter/material.dart';
import 'package:gladd/LPWordHard.dart';
import 'package:gladd/LPWordsEasy.dart';
import 'package:gladd/floatingActionButton.dart';

class WordCommon extends StatefulWidget {
  @override
  _WordCommonState createState() => _WordCommonState();
}

class _WordCommonState extends State<WordCommon> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "WORDS",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Container(
                //color: Colors.pink,
                width: MediaQuery.of(context).size.width/1.2,
                height: MediaQuery.of(context).size.height*0.4,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/home/WOrds.gif"),
                    fit: BoxFit.fill,
                  )
                ),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>LPWordEasy()));
                },
                child: Container(
                  margin: EdgeInsets.only(bottom: 24),
                  padding: EdgeInsets.all(22),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black45,
                        blurRadius: 2.0,
                        spreadRadius: 0.0,
                        offset: Offset(2.0, 2.0),
                      )
                    ],
                    gradient: LinearGradient(
                        colors: [
                          Colors.pinkAccent,
                          Colors.indigoAccent,
                        ]
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(29)),
                  ),
                  child: Text("Easy Words",
                    style: TextStyle(color: Colors.white,fontStyle: FontStyle.italic,fontSize: 17),
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>LPWordHard()));
                },
                child: Container(
                  padding: EdgeInsets.all(22),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black45,
                        blurRadius: 2.0,
                        spreadRadius: 0.0,
                        offset: Offset(2.0, 2.0),
                      )
                    ],
                    gradient: LinearGradient(
                        colors: [
                          Colors.pinkAccent,
                          Colors.indigoAccent,
                        ]
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(29)),
                  ),
                  child: Text("Hard Words",
                    style: TextStyle(color: Colors.white,fontStyle: FontStyle.italic,fontSize: 17),
                  ),
                ),
              ),
              SizedBox(),
            ],
          ),
        ),
      ),
      floatingActionButton: floatingActionButton(context),
    );
  }
}
