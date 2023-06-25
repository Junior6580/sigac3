class Apprentice {
  final Person person;
  final String apprenticeStatus;

  Apprentice({
    required this.person,
    required this.apprenticeStatus,
  });

  Map<String, dynamic> toJson() {
    return {
      'person': person.toJson(),
      'apprentice_status': apprenticeStatus,
    };
  }
}

class Person {
  final String firstName;
  final String firstLastName;
  final String secondLastName;

  Person({
    required this.firstName,
    required this.firstLastName,
    required this.secondLastName,
  });

  Map<String, dynamic> toJson() {
    return {
      'first_name': firstName,
      'first_last_name': firstLastName,
      'second_last_name': secondLastName,
    };
  }
}
