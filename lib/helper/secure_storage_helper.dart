import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:rumahkuehany/models/user.dart';

class SecureStorageHelper {
  static final _storage = FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
  );

  static const _keyToken = 'token';
  static const _keyUser = 'user';

  static Future cacheToken(String token) async {
    await _storage.write(key: _keyToken, value: token);
  }

  static Future getToken() async {
    final token = await _storage.read(key: _keyToken);
    return token;
  }

  static Future cacheUser(User user) async {
    await _storage.write(key: _keyUser, value: jsonEncode(user.toJson()));
  }

  static Future<User?> getUser() async {
    final userString = await _storage.read(key: _keyUser);
    if (userString != null) {
      final userJson = jsonDecode(userString);
      final user = User.fromJson(userJson);
      return user;
    }
    return null;
  }
}
