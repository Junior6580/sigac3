import 'package:flutter/material.dart';

class Excuse extends StatefulWidget {
  final String? title;
  Excuse({this.title});
  @override
  _ExcuseState createState() => _ExcuseState();
}

class _ExcuseState extends State<Excuse> {
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
