import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:kt_dart/kt.dart';
import 'package:logging/logging.dart';

import 'contacts_service.dart';

class ContactsService1 implements ContactsService {
  @override
  Future<KtList<DeviceContact>> getDeviceContacts() async {
    final List<Contact> contacts = await FlutterContacts.getContacts(
        withProperties: true, withThumbnail: true);
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

// ignore: unused_element
final Logger _logger = Logger('ContactsService1');
