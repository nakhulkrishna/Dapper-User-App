import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenManager {
  static final _storage = FlutterSecureStorage();

  // Function to get the token
  static Future<String?> getToken() async {
    return await _storage.read(key: 'auth_token');
  }
}
