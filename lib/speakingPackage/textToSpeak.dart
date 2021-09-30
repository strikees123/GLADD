// @dart=2.9
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class TextToSpeak extends StatefulWidget {
  @override
  _TextToSpeakState createState() => _TextToSpeakState();
}

class _TextToSpeakState extends State<TextToSpeak> {
  TextEditingController textEditingController = new TextEditingController();
  FlutterTts flutterTts = FlutterTts();
  @override
  Widget build(BuildContext context) {

     Future _speak(text) async{
      await flutterTts.setLanguage("en-US");
      await flutterTts.setPitch(1);
      await flutterTts.speak(text);
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.05),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.15,
                ),
                Text("Text to Speech",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.04,
                ),
                /// speaker icon
                Container(
                  padding: EdgeInsets.all(30),
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black38,
                          blurRadius: 7.0,
                          spreadRadius: 0.0,
                          offset: Offset(2.0, 2.0),
                        )
                      ],
                    shape: BoxShape.circle,
                    color: Colors.blueAccent
                  ),
                  child:Center(
                    child: Icon(
                      Icons.speaker,
                      size: 100,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.1,
                ),
                /// card contains text and buttons
                Card(
                  elevation: 4.0,
                  shadowColor: Colors.grey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))
                  ),
                  child: Container(
                    height: MediaQuery.of(context).size.height*0.3,
                    child: Column(
                      children: [
                        Expanded(
                          /// text form
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                            child: TextFormField(
                              focusNode: FocusNode(),
                              decoration: InputDecoration(
                                  hintText: " Type something to speak...",
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(
                                    color: Colors.grey,
                                  )
                              ),
                              controller: textEditingController,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            /// delete button
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.only(left: 15, bottom: 15),
                                alignment: Alignment.bottomLeft,
                                child: GestureDetector(
                                    onTap: (){
                                      setState(() {
                                        textEditingController.text = "";
                                      });
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black38,
                                              blurRadius: 7.0,
                                              spreadRadius: 0.0,
                                              offset: Offset(2.0, 2.0),
                                            )
                                          ],
                                          shape: BoxShape.circle,
                                          gradient: LinearGradient(
                                              begin: Alignment.topLeft,
                                              colors: [
                                                Colors.redAccent,
                                                Colors.red,
                                              ]
                                          )
                                      ),
                                      child: Icon(
                                        Icons.delete_outline_sharp,
                                        size: 40,
                                        color: Colors.white,
                                      ),
                                    )
                                ),
                              ),
                            ),
                            /// play button
                            Container(
                              margin: EdgeInsets.only(right: 15, bottom: 15),
                              alignment: Alignment.bottomRight,
                              child: GestureDetector(
                                  onTap: (){
                                    _speak(textEditingController.text);
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black38,
                                            blurRadius: 7.0,
                                            spreadRadius: 0.0,
                                            offset: Offset(2.0, 2.0),
                                          )
                                        ],
                                        shape: BoxShape.circle,
                                        gradient:  LinearGradient(
                                            begin: Alignment.topLeft,
                                            colors: [
                                              Colors.greenAccent,
                                              Colors.green,
                                            ]
                                        )
                                    ),
                                    child: Icon(
                                      Icons.play_arrow_sharp,
                                      size: 40,
                                      color: Colors.white,
                                    ),
                                  )
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ),
      ),
    );
  }
}
