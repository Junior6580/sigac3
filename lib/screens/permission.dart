import 'package:flutter/material.dart';

class Permission extends StatefulWidget {
  final String? title;
  Permission({this.title});
  @override
  _PermissionState createState() => _PermissionState();
}

class _PermissionState extends State<Permission> {
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
