// @dart=2.9
import 'package:flutter/material.dart';
import 'package:gladd/PageRelation/dragPagefam1.dart';

class PlayRelation extends StatelessWidget {
  static final String title = 'Play with Signs';

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(
          primaryColor: Colors.blueAccent,
        ),
        home: MainPage(),
      );
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int index = 0;

  @override
  Widget build(BuildContext context) => Scaffold(
        body: buildPages(),
      );

  Widget buildPages() {
    switch (index) {
      case 0:
        return DragPagefam1();

      default:
        return Container();
    }
  }
}
