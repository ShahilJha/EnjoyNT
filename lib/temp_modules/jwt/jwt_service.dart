import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'jwt_decode.dart';

class JWTService {
  late String _jwtToken;
  late Map<String, dynamic> _payload;
  final storage = const FlutterSecureStorage();

  JWTService() {
    init();
  }

  void init() async {
    String? token = await storage.read(key: "jwt");
    if (token == null) {
      _jwtToken = '';
      _payload = {};
    } else {
      _jwtToken = token;
      _payload = JwtDecoder.parseJwt(token);
    }
  }

  String get token => _jwtToken;

  Future setToken(String str) async {
    _jwtToken = str;
    await storage.write(key: "jwt", value: str);
    setPayload(_jwtToken);
  }

  void setPayload(String token) {
    _payload = JwtDecoder.parseJwt(token);
  }

  Map<String, dynamic> get payload => _payload;

  bool get isEmpty => _jwtToken == '' ? true : false;

  bool get hasExpired =>
      isEmpty == true ? true : JwtDecoder.isExpired(_jwtToken);

  Future<void> deleteJWT() async {
    await storage.delete(key: 'jwt');
    init();
  }
}
