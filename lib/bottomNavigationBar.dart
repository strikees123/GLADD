// @dart=2.9
import 'package:flutter/material.dart';
import 'package:gladd/home_page.dart';
import 'package:gladd/speakingPackage/textToSpeak.dart';

class BottomNav extends StatefulWidget {
  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    
    _onTapped(index)
    {
      setState(() {
        currentIndex = index;
      });
    }
    
    List functions = [
      Homepage(),
      TextToSpeak(),
    ];
    return Scaffold(
      body: functions.elementAt(currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.play_arrow_outlined,
              size: 25,
            ),
            label: "Learn and Play"
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.mic_outlined,
              size: 25,
            ),
            label: "Speech"
          ),
        ],
        selectedItemColor: Colors.blueAccent,
        selectedFontSize: 17,
        currentIndex: currentIndex,
        onTap: _onTapped,
        elevation: 4.0,
      ),
    );
  }
}
