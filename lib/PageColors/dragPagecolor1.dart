// @dart=2.9

import 'package:gladd/LPcolor.dart';
import 'package:gladd/PageColors/dragPagecolor2.dart';
import 'package:gladd/floatingActionButton.dart';
import 'package:gladd/page/utils.dart';
import 'package:flutter/material.dart';
import 'package:gladd/PlayAlpha.dart';
import 'package:google_fonts/google_fonts.dart';

class DragPagecolor1 extends StatefulWidget {
  @override
  _DragPagecolor1State createState() => _DragPagecolor1State();
}

class _DragPagecolor1State extends State<DragPagecolor1> {
  final List<_Animals2> all = allAnimals;
  final List<_Animals2> land = [];
  final List<_Animals2> air = [];

  final double size = 150;
  bool note = true;
  final style =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black);

  void removeAll(_Animals2 toRemove) {
    all.removeWhere((animal) => animal.imageUrl == toRemove.imageUrl);
    land.removeWhere((animal) => animal.imageUrl == toRemove.imageUrl);
    air.removeWhere((animal) => animal.imageUrl == toRemove.imageUrl);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => (Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) => LPColor()),
          )), // button pressed
        ),
        title: Text(
          PlayAlpha.title,
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          TextButton(
            onPressed: () {},
            child: Text(
              'Drag and Drop Correct sign for the Given Below',
              style: GoogleFonts.lato(textStyle: style),
            ),
          ),
          buildTarget(
            context,
            text: " ",
            animals: all,
            acceptTypes: _AnimalType.values,
            onAccept: (data) => setState(() {
              removeAll(data);
              all.add(data);
            }),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              buildTarget(
                context,
                text: 'Blue',
                animals: land,
                acceptTypes: [_AnimalType.C],
                onAccept: (data) => setState(() {
                  removeAll(data);
                  land.add(data);
                }),
              ),
              buildTarget(
                context,
                text: 'Red',
                animals: air,
                acceptTypes: [_AnimalType.D],
                onAccept: (data) => setState(() {
                  removeAll(data);
                  air.add(data);
                }),
              ),
              if (all.length == 0)
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (_) => DragPagecolor2()));
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 19),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 2.0,
                            spreadRadius: 0.0,
                            offset: Offset(2.0, 2.0),
                          )
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(29)),
                        gradient: LinearGradient(
                            colors: [
                              Colors.grey,
                              Colors.indigoAccent,
                            ]
                        )
                    ),
                    child: Text("Next",
                      style: TextStyle(fontSize:17, color: Colors.white),
                    ),
                  ),
                )
            ],
          ),
        ],
      ),
      floatingActionButton: floatingActionButton(context)
  );

  Widget buildTarget(
    BuildContext context, {
    @required String text,
    @required List<_Animals2> animals,
    @required List<_AnimalType> acceptTypes,
    @required DragTargetAccept<_Animals2> onAccept,
  }) =>
      CircleAvatar(
        radius: size / 2,
        child: DragTarget<_Animals2>(
          builder: (context, candidateData, rejectedData) => Stack(
            children: [
              ...animals
                  // ignore: missing_required_param
                  .map((animals) => DragWidget(
                        animal: animals,
                      ))
                  .toList(),
              IgnorePointer(child: Center(child: buildText(text))),
            ],
          ),
          onWillAccept: (data) => true,
          onAccept: (data) {
            if (acceptTypes.contains(data.type)) {
              note = true;
              Utils.showSnackBar(
                context,
                text: 'This Is Correct 🥳',
                color: Colors.green,
              );
            } else {
              note = false;
              Utils.showSnackBar(
                context,
                text: 'This Looks Wrong 🤔',
                color: Colors.red,
              );
            }

            onAccept(data);
          },
        ),
      );

  Widget buildText(String text) => Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.8),
            blurRadius: 12,
          )
        ]),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
}

enum _AnimalType { C, D }

class _Animals2 {
  final String imageUrl;
  final _AnimalType type;

  _Animals2({
    this.imageUrl,
    this.type,
  });
}

final allAnimals = [
  _Animals2(
    type: _AnimalType.C,
    imageUrl: 'assets/Color/blue_play.gif',
  ),
  _Animals2(type: _AnimalType.D, imageUrl: 'assets/Color/red_play.gif'),
];

class DragWidget extends StatelessWidget {
  final _Animals2 animal;

  const DragWidget({
    Key key,
    @required this.animal,
  }) : super(key: key);

  static double size = 150;

  @override
  Widget build(BuildContext context) => Draggable<_Animals2>(
        data: animal,
        feedback: buildImage(),
        child: buildImage(),
        childWhenDragging: Container(height: size),
      );

  Widget buildImage() => Container(
        height: size,
        width: size,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: Colors.white,
        ),
        child: Image.asset(animal.imageUrl),
      );
}
