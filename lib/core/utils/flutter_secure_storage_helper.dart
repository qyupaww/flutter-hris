import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:morpheme_flutter_lite/core/global_variable.dart';
import 'package:morpheme_flutter_lite/features/auth/login/data/models/response/login_response.dart';

abstract final class KeyFlutterSecureStorage {
  static const String keyToken = 'token';
  static const String keyRefreshToken = 'refreshToken';
  static const String keyUser = 'user';
}

abstract final class FlutterSecureStorageHelper {
  static final _fss = locator<FlutterSecureStorage>();

  static Future<String?> getToken() =>
      _fss.read(key: KeyFlutterSecureStorage.keyToken);
  static Future<void> saveToken(String? token) =>
      _fss.write(key: KeyFlutterSecureStorage.keyToken, value: token);
  static Future<void> removeToken() =>
      _fss.delete(key: KeyFlutterSecureStorage.keyToken);

  static Future<String?> getRefreshToken() =>
      _fss.read(key: KeyFlutterSecureStorage.keyRefreshToken);
  static Future<void> saveRefreshToken(String? refreshToken) => _fss.write(
    key: KeyFlutterSecureStorage.keyRefreshToken,
    value: refreshToken,
  );
  static Future<void> removeRefreshToken() =>
      _fss.delete(key: KeyFlutterSecureStorage.keyRefreshToken);

  static Future<UserLogin?> getUser() async {
    final user = await _fss.read(key: KeyFlutterSecureStorage.keyUser);
    return user != null ? UserLogin.fromJson(user) : null;
  }

  static Future<void> saveUser(UserLogin? user) =>
      _fss.write(key: KeyFlutterSecureStorage.keyUser, value: user?.toJson());
  static Future<void> removeUser() =>
      _fss.delete(key: KeyFlutterSecureStorage.keyUser);
}
