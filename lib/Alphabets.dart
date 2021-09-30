// @dart=2.9
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:gladd/LPalpha.dart';
import 'package:gladd/floatingActionButton.dart';
import 'package:google_fonts/google_fonts.dart';

class AlphaCarousel extends StatefulWidget {
  AlphaCarousel() : super();
  @override
  AlphaCarouselState createState() => AlphaCarouselState();
}

class AlphaCarouselState extends State<AlphaCarousel> {
  //

  int _current = 0;
  int photoIndex = 0;

  List<String> imgList = [
    "assets/alpha/A.jpg",
    "assets/alpha/B.jpg",
    "assets/alpha/C.jpg",
    "assets/alpha/D.jpg",
    "assets/alpha/E.jpg",
    "assets/alpha/F.jpg",
    "assets/alpha/G.jpg",
    "assets/alpha/H.jpg",
    "assets/alpha/I.jpg",
    "assets/alpha/J.jpg",
    "assets/alpha/K.jpg",
    "assets/alpha/L.jpg",
    "assets/alpha/M.jpg",
    "assets/alpha/N.jpg",
    "assets/alpha/O.jpg",
    "assets/alpha/P.jpg",
    "assets/alpha/Q.jpg",
    "assets/alpha/R.jpg",
    "assets/alpha/S.jpg",
    "assets/alpha/T.jpg",
    "assets/alpha/U.jpg",
    "assets/alpha/V.jpg",
    "assets/alpha/W.jpg",
    "assets/alpha/X.jpg",
    "assets/alpha/Y.jpg",
    "assets/alpha/Z.jpg",
  ];

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    final style = TextStyle(
        fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white);
    void _previousImage() {
      setState(() {
        _current = _current > 0 ? _current - 1 : 0;
      });
    }

    void _nextImage() {
      setState(() {
        _current = _current < imgList.length - 1 ? _current + 1 : _current;
      });
    }

    CarouselController carouselController = new CarouselController();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => (Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) => LPalpha()),
          )), // button pressed
        ),
        centerTitle: true,
        title: Text("ALPHABETS",
            style: GoogleFonts.cinzel(textStyle: style)),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            SizedBox(height: MediaQuery.of(context).size.height*0.09,),
            CarouselSlider(
              carouselController: carouselController,
              options: CarouselOptions(
                height: 400.0,
                initialPage: 0,
                viewportFraction: 0.8,
                aspectRatio: 16 / 9,
                enlargeCenterPage: true,
                reverse: false,
                enableInfiniteScroll: true,
                scrollDirection: Axis.horizontal,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                },
              ),
              items: imgList.map((imageAsset) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(horizontal: 10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Image.asset(
                        imgList[_current],
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: map<Widget>(imgList, (index, asset) {
                return Container(
                  width: 10.0,
                  height: 10.0,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _current == index ? Colors.blue : Colors.grey,
                  ),
                );
              }),
            ),
            SizedBox(
              height: 30.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 2.0,
                          spreadRadius: 0.0,
                          offset: Offset(2.0, 2.0),
                        )
                      ],
                      shape: BoxShape.circle,
                      color: Colors.blueAccent,
                    ),
                    child: Text('<',
                      style: TextStyle(color: Colors.white,fontSize: 31),
                    ),
                  ),
                  onTap: _previousImage,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.1,
                ),
                GestureDetector(
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 2.0,
                          spreadRadius: 0.0,
                          offset: Offset(2.0, 2.0),
                        )
                      ],
                      shape: BoxShape.circle,
                      color: Colors.blueAccent,
                    ),
                    child: Text('>',
                      style: TextStyle(color: Colors.white,fontSize: 31),
                    ),
                  ),
                  onTap: _nextImage,
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: floatingActionButton(context),
    );
  }
}
