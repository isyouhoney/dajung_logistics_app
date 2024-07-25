import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage with _Cache2Pref {
  static const FlutterSecureStorage _storage = FlutterSecureStorage();

  static Future<dynamic?> get(Cached key) async {
    return await _storage.read(key: _Cache2Pref.wrap(key));
  }

  static Future<bool> set(Cached key, dynamic data) async {
    await _storage..write(key: _Cache2Pref.wrap(key), value: data);
    return true;
  }

  static Future<bool> remove(Cached key) async {
    await _storage.delete(key: _Cache2Pref.wrap(key));
    return true;
  }

  static Future<bool> clear() async {
    await _storage.deleteAll();
    return true;
  }

  static Future<void> saveToken(String accessToken, String refreshToken) async {
    await _storage.write(key: 'access', value: accessToken);
    await _storage.write(key: 'refresh', value: refreshToken);
  }

  static Future<void> deleteAllTokens() async {
    await _storage.delete(key: 'access');
    await _storage.delete(key: 'refresh');
  }
}

enum Cached { ACCESS, REFRESH, FCM, SIGNIN }

mixin _Cache2Pref {
  static String wrap(Cached cache) {
    switch (cache) {
      case Cached.ACCESS:
        return 'access';
      case Cached.REFRESH:
        return 'refresh';
      case Cached.FCM:
        return 'fcm';
      case Cached.SIGNIN:
        return 'signin';
      default:
        return '';
    }
  }
}