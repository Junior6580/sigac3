import 'package:flutter/material.dart';

class Point extends StatefulWidget {
  final String? title;
  Point({this.title});
  @override
  _PointState createState() => _PointState();
}

class _PointState extends State<Point> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          title: Text(
            '${widget.title}',
            style: TextStyle(
              color: Colors.black,
            ),
          )),
      body: Center(
        child: Container(
          child: Text('Welcome'),
        ),
      ),
    );
  }
}
