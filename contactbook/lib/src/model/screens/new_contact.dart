import 'package:contactbook/src/model/contact.dart';
import 'package:contactbook/src/model/contact_book.dart';
import 'package:flutter/material.dart';

class NewContact extends StatefulWidget {
  const NewContact({ Key? key }) : super(key: key);

  @override
  State<NewContact> createState() => _NewContactState();
}

class _NewContactState extends State<NewContact> {
  late final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New Contact"),
      ),
      body: Column(
        children: [
          TextField(
            controller: _controller,
            decoration: const InputDecoration(
              hintText: "Enter name of the contact"
            ),
          ),
          TextButton(
            onPressed: () {
              final Contact _contact = Contact(name: _controller.text);
              ContactBook().add(contact: _contact);
              Navigator.of(context).pop();
            },
            child: const Text("Add contact"),
          ),
        ],
      ),
    );
  }
}