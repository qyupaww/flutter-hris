import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:morpheme_flutter_lite/core/endpoints/morpheme_endpoints.dart';
import 'package:morpheme_flutter_lite/core/environment.dart';
import 'package:morpheme_flutter_lite/core/global_variable.dart';
import 'package:morpheme_flutter_lite/core/utils/flutter_secure_storage_helper.dart';
import 'package:morpheme_http/morpheme_http.dart';

void setupLocatorCore() {
  locator.registerLazySingleton(() => const FlutterSecureStorage());
  // locator.registerLazySingleton(() => FirebaseRemoteConfig.instance);
  if (!kIsWeb) {
    locator.registerLazySingleton(
      () => MorphemeInspector(
        showInspectorOnShake: Environment.isNotProd,
        showNotification: Environment.isNotProd,
        saveInspectorToLocal: Environment.isNotProd,
      ),
    );
  }
  locator.registerLazySingleton(
    () => MorphemeHttp(
      timeout: 30000,
      showLog: false,
      morphemeInspector: kIsWeb ? null : locator(),
      headers: {'content-type': 'application/json'},
      authTokenOption: AuthTokenOption(
        typeHeader: 'Authorization',
        prefixHeader: 'Bearer',
        getToken: () => FlutterSecureStorageHelper.getToken(),
        authCondition: (request, response) async =>
            request.url == MorphemeEndpoints.login ||
            request.url == MorphemeEndpoints.register,
        onAuthTokenResponse: (response) async {
          final map = jsonDecode(response.body);
          await FlutterSecureStorageHelper.saveToken(map['data']['token']);
        },
        clearCondition: (request, response) async =>
            request.url == MorphemeEndpoints.logout,
        onClearToken: () => FlutterSecureStorageHelper.removeToken(),
        excludeEndpointUsageToken: [
          RegExp('/auth/login'),
          RegExp('/auth/register'),
          RegExp('/company'),
        ],
      ),
      // refreshTokenOption: RefreshTokenOption(
      //   method: RefreshTokenMethod.post,
      //   url: MorphemeEndpoints.refreshToken,
      //   condition: (request, response) =>
      //       request.url != MorphemeEndpoints.login && response.statusCode == 401,
      //   getBody: () async {
      //     final refreshToken =
      //         await FlutterSecureStorageHelper.getRefreshToken();

      //     return {
      //       'refresh_token': refreshToken ?? '',
      //     };
      //   },
      //   onResponse: (response) async {
      //     final map = jsonDecode(response.body);
      //     await FlutterSecureStorageHelper.saveRefreshToken(map['token']);
      //   },
      // ),
    ),
  );
}
