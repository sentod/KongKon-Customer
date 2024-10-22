import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Basket {
  static _getAndroidOptions() => const AndroidOptions(
    encryptedSharedPreferences: true,
  );
  final storage = FlutterSecureStorage(aOptions: _getAndroidOptions());
}

