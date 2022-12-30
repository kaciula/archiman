import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStore {
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();
  String? _encryptionKey;

  String? get encryptionKey => _encryptionKey;

  Future<void> persistEncryptionKey(String encryptionKey) async {
    await _secureStorage.write(key: _encryptionStoreKey, value: encryptionKey);
    _encryptionKey = encryptionKey;
    return;
  }

  Future<bool> hasEncryptionKey() async {
    try {
      _encryptionKey = await _secureStorage.read(key: _encryptionStoreKey);
      return encryptionKey != null;
    } catch (e) {
      // It might be an old encryption key from a previous install but it's no longer usable
      return false;
    }
  }

  Future<void> deleteEncryptionKey() async {
    await _secureStorage.delete(key: _encryptionStoreKey);
    _encryptionKey = null;
    return;
  }
}

const String _encryptionStoreKey = 'key.encryption.store.key';
