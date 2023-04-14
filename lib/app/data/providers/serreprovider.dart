import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart';
import 'package:kora/app/core/widgets/snackbar.dart';
import 'package:kora/app/modules/home/controllers/home_controller.dart';
import 'package:web_socket_channel/io.dart';

import '../models/serre.dart';
import 'header.dart';

class SerreProvider {
  static const String _url = 'https://koraapi.alwaysdata.net';
  static final SerreProvider _instace = SerreProvider._();
  static SerreProvider get instance => _instace;
  SerreProvider._();
  GetStorage storage = GetStorage();

  Future<Serre?> getSerre() async {
    int? id = int.tryParse(storage.read("id"));
    if (id != null) {
      final result = await get(Uri.parse("$_url/api/v1/serre/$id"),
          headers: Headers.instance.headers);
      if (result.statusCode != 200 && result.statusCode != 201) {
        return null;
      }
      print(json.decode(result.body));
      return Serre.fromJson(json.decode(result.body));
    } else {
      Snackbar snackbar = const Snackbar();
      snackbar.showSnackbar(
          title: "Erreur", message: "Vous n'etes connecté à aucune");
    }
  }

  Future<IOWebSocketChannel> serreConnection() async {
    final wsUrl =
        'wss://koraapi.alwaysdata.net/ws/user/${storage.read("token")}/';
    var channel = IOWebSocketChannel.connect(wsUrl,
        pingInterval: const Duration(seconds: 10));
    channel.stream.asBroadcastStream().listen((event) {
      Map data = json.decode(event);
      // print(event);
      if (data["text"] == 'Websocket Accept') {
        Snackbar snackbar = const Snackbar();
        snackbar.showSnackbar(
            title: "succes", message: "La connexion au serveur accepté");
      } else if (data["text"]["type"] == "Accept Request") {
        storage.write("tokenSerre", "${data['text']['serre']}");
        storage.write("id", "${data['text']['data']['pk']}");
        Snackbar snackbar = const Snackbar();
        Get.find<HomeController>().recuperEtats();
        snackbar.showSnackbar(
            title: "succes", message: "La requete a ete accepté");
      } else {
        Snackbar snackbar = const Snackbar();
        snackbar.showSnackbar(
            title: "Echec", message: "La requete a ete refusé");
      }
    });
    return channel;
  }

  Future setparameters(
      {required tokenSerre,
      required user,
      String? parametre,
      bool valeur = false}) async {
    final result = await post(Uri.parse("$_url/apps/changePropertie"),
        headers: Headers.instance.headers,
        body: json.encode({
          "serre": tokenSerre,
          "user": user,
          "parametre": parametre,
          "valeur": valeur.toString(),
        }));
    // print(json.decode(result.body));
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
