import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;

  const ButtonWidget({
    Key? key,
    required this.text,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ElevatedButton(
        onPressed: onClicked,
        style: ElevatedButton.styleFrom(
          primary: Theme.of(context).highlightColor,
          shape: StadiumBorder(),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16)
        ),
        child: Text(
          text,
          style: GoogleFonts.lato(
            textStyle: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      );
}
