class Serre {
  String temperature = "";
  String humiditeSol = "";
  String humiditeAir = "";
  String ph = "";
  String luminosite = "";
  String token="";
  bool ventilateur = false;
  bool arroseur = false;
  bool lumiere = true;
  String? userSerre;

  Serre({
    required this.temperature,
    required this.humiditeSol,
    required this.humiditeAir,
    required this.ph,
    required this.luminosite,
    required this.ventilateur,
    required this.arroseur,
    required this.lumiere,
    required this.token,
    this.userSerre,
  });

  Serre.fromJson(Map<String, dynamic> json) {
    temperature = json['temperature'];
    humiditeSol = json['humiditeSol'];
    humiditeAir = json['humiditeAir'];
    ph = json['ph'];
    luminosite = json['luminosite'];
    token = json['token'];
    ventilateur = json['ventilateur'];
    arroseur = json['arroseur'];
    lumiere = json['lumiere'];
    userSerre = json['user_serre'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['temperature'] = temperature;
    data['humiditeSol'] = humiditeSol;
    data['humiditeAir'] = humiditeAir;
    data['ph'] = ph;
    data['luminosite'] = luminosite;
    data['token'] = token;
    data['ventilateur'] = ventilateur;
    data['arroseur'] = arroseur;
    data['lumiere'] = lumiere;
    data['user_serre'] = userSerre;

    return data;
  }
}
