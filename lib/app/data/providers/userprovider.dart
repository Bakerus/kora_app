import 'dart:convert';
import 'package:get_storage/get_storage.dart';
import 'package:kora/app/data/models/token.dart';
import 'header.dart';
import 'package:http/http.dart';
import '../models/user.dart';

class UserProvider {
  var garde_result;
  static const String _url = 'https://koraapi.alwaysdata.net';
  static final UserProvider _instace = UserProvider._();
  static UserProvider get instance => _instace;
  GetStorage storage = GetStorage();
  UserProvider._();

  Future<User?> createAccount({
    required String name,
    required String firstname,
    required String email,
    required String password,
    bool isPremium = false,
    bool admin = true,
  }) async {
    final result = await post(
      Uri.parse("$_url/api/v1/user/"),
      headers: Headers.instance.headers,
      body: json.encode({
        'name': name,
        "firstname": firstname,
        "email": email,
        "password": password,
        "is_premium": isPremium,
        "admin": admin
      }),
    );
    garde_result = result;
    // print(garde_result);
    if (result.statusCode != 200) {
      print(json.decode(result.body));
    }
    return User.fromJson(json.decode(result.body));
  }

  Future<Token?> authentification({required email, required password}) async {
    final result = await post(
      Uri.parse("$_url/api/v1/auth"),
      headers: Headers.instance.headers,
      body: json.encode({
        'username': email,
        'password': password,
      }),
    );
    if (result.statusCode != 200) {
      print(json.decode(result.body));
    }
    print(json.decode(result.body));
    storage.write("token", result.body);
    return Token.fromJson(json.decode(result.body));
  }

}
