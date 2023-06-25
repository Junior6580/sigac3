import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Apprentice {
  final int id;
  final int personId;
  final String apprenticeStatus;
  final Person person;

  Apprentice({
    required this.id,
    required this.personId,
    required this.apprenticeStatus,
    required this.person,
  });

  factory Apprentice.fromJson(Map<String, dynamic> json) {
    return Apprentice(
      id: json['id'],
      personId: json['person_id'],
      apprenticeStatus: json['apprentice_status'],
      person: Person.fromJson(json['person']),
    );
  }
}

class Person {
  final int id;
  final String firstName;
  final String firstLastName;
  final String secondLastName;

  Person({
    required this.id,
    required this.firstName,
    required this.firstLastName,
    required this.secondLastName,
  });

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
      id: json['id'],
      firstName: json['first_name'],
      firstLastName: json['first_last_name'],
      secondLastName: json['second_last_name'],
    );
  }
}

class ApprenticeListScreen extends StatefulWidget {
  @override
  _ApprenticeListScreenState createState() => _ApprenticeListScreenState();
}

class _ApprenticeListScreenState extends State<ApprenticeListScreen> {
  List<Apprentice> apprentices = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    fetchApprentices();
  }

  Future<void> fetchApprentices() async {
    setState(() {
      isLoading = true;
    });

    try {
      final response = await http
          .get(Uri.parse('http://192.168.100.17:8000/api/sigac/aprendices'));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List<Apprentice> fetchedApprentices = [];
        for (var item in data) {
          fetchedApprentices.add(Apprentice.fromJson(item));
        }
        setState(() {
          apprentices = fetchedApprentices;
          isLoading = false;
        });
      } else {
        setState(() {
          isLoading = false;
        });
        print('Error: ${response.statusCode}');
      }
    } catch (error) {
      setState(() {
        isLoading = false;
      });
      print('Error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'SIGAC - Asistencia',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : apprentices.isEmpty
              ? Center(
                  child: Text('No se encontraron aprendices.'),
                )
              : ListView.builder(
                  itemCount: apprentices.length,
                  itemBuilder: (context, index) {
                    final apprentice = apprentices[index];
                    return ListTile(
                      title: Text(apprentice.person.firstName),
                      subtitle: Text(apprentice.person.firstLastName +
                          ' ' +
                          apprentice.person.secondLastName),
                      // Agrega aquí más widgets para mostrar otros datos del aprendiz si es necesario
                    );
                  },
                ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ApprenticeListScreen(),
  ));
}
