// @dart=2.9
import 'package:flutter/material.dart';

Container container(BuildContext context, icon, text){
  return Container(
    padding: EdgeInsets.all(14),
    decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.indigoAccent,
            blurRadius: 2.0,
            spreadRadius: 0.0,
            offset: Offset(2.0, 2.0),
          )
        ],
        shape: BoxShape.circle,
        gradient: LinearGradient(
            colors: [
              Colors.redAccent,
              Colors.blueAccent,
            ]
        )
    ),
    child: Column(
      children: [
        Icon(
          icon,
          color: Colors.white,
        ),
        Text(text,
          style: TextStyle(color: Colors.white,fontSize: 21),
        )
      ],
    ),
  );
}