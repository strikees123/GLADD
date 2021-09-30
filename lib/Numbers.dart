// @dart=2.9
import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:gladd/LPnum.dart';
import 'package:gladd/floatingActionButton.dart';
import 'package:google_fonts/google_fonts.dart';

class NumberCarousel extends StatefulWidget {
  NumberCarousel() : super();

  @override
  NumberCarouselState createState() => NumberCarouselState();
}

class NumberCarouselState extends State<NumberCarousel> {
  //

  int _current = 0;
  int photoIndex = 0;

  List<String> imgList = [
    "assets/number/0.jpg",
    "assets/number/1.jpg",
    "assets/number/2.jpg",
    "assets/number/3.jpg",
    "assets/number/4.jpg",
    "assets/number/5.jpg",
    "assets/number/6.jpg",
    "assets/number/7.jpg",
    "assets/number/8.jpg",
    "assets/number/9.jpg",
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
        fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white);
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
            MaterialPageRoute(builder: (_) => LPnum()),
          )), // button pressed
        ),
        centerTitle: true,
        title: Text("NUMBERS", style: GoogleFonts.lato(textStyle: style)),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CarouselSlider(
              carouselController: carouselController,
              options: CarouselOptions(
                height: 400.0,
                initialPage: 0,
                viewportFraction: 0.8,
                aspectRatio: 16 / 9,
                enlargeCenterPage: true,
                reverse: false,
                pauseAutoPlayOnTouch: true,
                enableInfiniteScroll: false,
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
                        borderRadius: BorderRadius.circular(10.0),
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
              height: 20.0,
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
