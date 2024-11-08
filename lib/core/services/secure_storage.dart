// secure_storage_service.dart
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  Future<void> saveUID(String uid) async {
    await _storage.write(key: 'userUID', value: uid);
  }

  Future<String?> getUID() async {
    return await _storage.read(key: 'uid');
  }
}
