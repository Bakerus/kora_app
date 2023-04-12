import 'dart:convert';

import 'package:http/http.dart';

import '../models/serre.dart';
import 'header.dart';

class SerreProvider {
  static const String _url = 'https://koraapi.alwaysdata.net';
  static final SerreProvider _instace = SerreProvider._();
  static SerreProvider get instance => _instace;
  SerreProvider._();

  Future<Serre?> getSerre({int id = 1}) async {
    // print("arrivé");
    final result = await get(Uri.parse("$_url/api/v1/serre/$id"),
        headers: Headers.instance.headers);

    if (result.statusCode != 200 && result.statusCode != 201) {
      return null;
    }
    // print(json.decode(result.body));
    return Serre.fromJson(json.decode(result.body));
  }

  Future setparameters(
      {required id,
      required user,
      String? parametre,
      bool valeur = false}) async {
    final result = await post(Uri.parse("$_url/apps/changePropertie"),
        headers: Headers.instance.headers,
        body: json.encode({
          "serre": id,
          "user": user,
          "parametre": parametre,
          "valeur": valeur,
        }));

    print(json.decode(result.body));
  }

  // Future<Serre?> setParametersSerre(
  //     {required String descriptionValue,
  //     required String descriptionType,
  //     int id = 1}) async {
  //   final result = await patch(
  //     Uri.parse("$_url/api/v1/serre/$id"),
  //     headers: Headers.instance.headers,
  //     body: json.encode({descriptionType: descriptionValue}),
  //   );
  //   if (result.statusCode != 200) {
  //     print(json.decode(result.body));
  //   }
  //   print(json.decode(result.body));

  //   return Serre.fromJson(json.decode(result.body));
  // }

}
