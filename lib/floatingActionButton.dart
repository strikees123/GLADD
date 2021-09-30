// @dart=2.9
import 'package:flutter/material.dart';
import 'package:gladd/bottomNavigationBar.dart';
FloatingActionButton floatingActionButton(BuildContext context){
  return FloatingActionButton(
    backgroundColor: Colors.blueAccent,
    child: Icon(
      Icons.home,
    ),
    onPressed: (){
      Navigator.of(context).popUntil((route) => route.isFirst);
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>BottomNav()));
    },
  );
}
