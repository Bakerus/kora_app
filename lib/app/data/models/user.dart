class User {
  String? name;
  String? firstname;
  String? password;
  String? email;
  bool? ispremium;
  bool? admin;

  User(
      {this.name,
      this.firstname,
      this.password,
      this.email,
      this.ispremium,
      this.admin});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    firstname = json['firstname'];
    password = json['password'];
    ispremium = json['is_premium'];
    admin = json['admin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['name'] = name;
    data['firstname'] = firstname;
    data['password'] = password;
    data['is_premium'] = ispremium;
    data['admin'] = admin;

    return data;
  }
}
