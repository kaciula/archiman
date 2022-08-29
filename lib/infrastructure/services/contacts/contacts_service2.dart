import 'package:fast_contacts/fast_contacts.dart';
import 'package:kt_dart/kt.dart';

import 'contacts_service.dart';

class ContactsService2 implements ContactsService {
  @override
  Future<KtList<DeviceContact>> getDeviceContacts() async {
    final List<Contact> contacts = await FastContacts.allContacts;
    return contacts
        .toImmutableList()
        .filter((Contact it) => it.phones.isNotEmpty || it.emails.isNotEmpty)
        .map((Contact it) => _map(it));
  }

  DeviceContact _map(Contact contact) {
    return DeviceContact(
      id: contact.id,
      displayName: contact.displayName,
      initials: _initials(contact.structuredName),
      photo: null, // This should be fetched live when scrolling
      phoneNums: contact.phones.map((String it) => it).toImmutableList(),
      emailAddresses: contact.emails.map((String it) => it).toImmutableList(),
    );
  }

  String _initials(StructuredName? name) {
    if (name != null) {
      String s = '';
      if (name.givenName.isNotEmpty) {
        s += name.givenName[0];
      }
      if (name.middleName.isNotEmpty) {
        s += name.middleName[0];
      }
      if (name.familyName.isNotEmpty) {
        s += name.familyName[0];
      }
      return s.toUpperCase();
    }
    return '';
  }
}
