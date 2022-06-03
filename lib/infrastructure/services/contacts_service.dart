import 'dart:typed_data';

import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kt_dart/kt.dart';
import 'package:logging/logging.dart';

part 'contacts_service.freezed.dart';

class ContactsService {
  Future<KtList<DeviceContact>> getDeviceContacts() async {
    final List<Contact> contacts = await FlutterContacts.getContacts(
        withProperties: true, withPhoto: true);
    return contacts
        .toImmutableList()
        .filter((Contact it) => it.phones.isNotEmpty || it.emails.isNotEmpty)
        .map((Contact it) => _map(it));
  }

  DeviceContact _map(Contact contact) {
    return DeviceContact(
      id: contact.id,
      displayName: contact.displayName,
      initials: _initials(contact.name),
      photo: contact.photoOrThumbnail,
      phoneNums: contact.phones.map((Phone it) => it.number).toImmutableList(),
      emailAddresses:
          contact.emails.map((Email it) => it.address).toImmutableList(),
    );
  }

  String _initials(Name name) {
    String s = '';
    if (name.first.isNotEmpty) {
      s += name.first[0];
    }
    if (name.middle.isNotEmpty) {
      s += name.middle[0];
    }
    if (name.last.isNotEmpty) {
      s += name.last[0];
    }
    return s.toUpperCase();
  }
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

// ignore: unused_element
final Logger _logger = Logger('ContactsService');
