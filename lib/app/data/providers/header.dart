class Headers {
  final _headers = {
    'accept': '*/*',
    "Content-Type": "application/json",
  };
  static final Headers _instance = Headers._();

  static Headers get instance => _instance;

  Headers._();

  Map<String, String> get headers => _headers;

  setAuthorization(String auth) {
    _headers['Authorization'] = "Bearer $auth";
  }

  removeAuth() {
    _headers.removeWhere((key, value) => key == "Authorization");
  }
}
