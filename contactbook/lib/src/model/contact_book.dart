import 'package:contactbook/src/model/contact.dart';
import 'package:flutter/material.dart';

class ContactBook extends ValueNotifier<List<Contact>>{
  ContactBook._sharedInstance(): super([]);
  static final ContactBook _shared = ContactBook._sharedInstance();

  factory ContactBook() => _shared;

  void add({required Contact contact}) {
    value.add(contact);
    notifyListeners();
  }

  void removeContact({required Contact contact}) {
    if (value.contains(contact)){
      value.remove(contact);
      notifyListeners();  
    }
    
  }

  Contact? contact({required int atIndex}) =>
      value.length > atIndex ? value[atIndex] : null;
}
