import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kt_dart/kt.dart';

part 'contacts_service.freezed.dart';

abstract class ContactsService {
  Future<KtList<DeviceContact>> getDeviceContacts();
}

@freezed
class DeviceContact with _$DeviceContact {
  factory DeviceContact({
    required String id,
    required String displayName,
    required String initials,
    required Uint8List? photo,
    // Phone numbers can be in various formats so they need to be normalized/cleaned down the line
    required KtList<String> phoneNums,
    required KtList<String> emailAddresses,
  }) = _DeviceContact;
}
