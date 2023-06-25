import 'package:flutter/material.dart';
import 'package:sigac/screens/attendance.dart';
import 'package:sigac/screens/login.dart';
import 'package:sigac/services/user_service.dart';
import 'package:sigac/screens/excuses.dart';
import 'package:sigac/screens/permission.dart';
import 'package:sigac/screens/points.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'SIGAC',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.login_outlined, color: Colors.black),
            onPressed: () {
              logout().then((value) => {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => Login()),
                        (route) => false)
                  });
            },
          )
        ],
      ),
      body: Center(
        child: Container(
          child: Text('Welcome Aprendices'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => Home()),
            (Route<dynamic> route) => false,
          );
        },
        child: Icon(Icons.home),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        notchMargin: 5,
        elevation: 10,
        clipBehavior: Clip.antiAlias,
        shape: CircularNotchedRectangle(),
        child: BottomNavigationBar(
          backgroundColor: Colors.blue,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.white,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.assistant),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.security),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: SizedBox.shrink(),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.file_copy),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.auto_mode_outlined),
              label: '',
            ),
          ],
          currentIndex: currentIndex,
          onTap: (val) {
            setState(() {
              currentIndex = val;
              if (val == 0) {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ApprenticeListScreen(),
                ));
              } else if (val == 1) {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Permission(title: 'SIGAC - Permisos'),
                ));
              } else if (val == 3) {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Excuse(title: 'SIGAC - Excusas'),
                ));
              } else if (val == 4) {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Point(title: 'SIGAC - Puntos'),
                ));
              }
            });
          },
        ),
      ),
    );
  }
}
