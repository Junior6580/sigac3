class User {
  int? id;
  String? nickname;
  int? personId;
  String? email;
  String? token;

  User({
    this.id,
    this.nickname,
    this.personId,
    this.email,
    this.token,
  });

//factory to convert json data to user model
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['user']['id'],
      nickname: json['user']['nickname'],
      personId: json['user']['person_id'],
      email: json['user']['email'],
      token: json['user']['token'],
    );
  }
}
