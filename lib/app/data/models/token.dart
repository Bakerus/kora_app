class Token {
  String? tokenValue;

  Token({this.tokenValue});

  Token.fromJson(Map<String, dynamic> json) {
    tokenValue = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['token'] = tokenValue;

    return data;
  }
}
