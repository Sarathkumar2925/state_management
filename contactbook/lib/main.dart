import 'package:contactbook/src/model/contact.dart';
import 'package:contactbook/src/model/contact_book.dart';
import 'package:contactbook/src/model/screens/new_contact.dart';
import 'package:flutter/material.dart';

void main() {
  return runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: const MyApp(),
        routes: {"/new-contact": ((context) => const NewContact())});
  }
}

// class MyApp extends StatefulWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
      ),
      body:const  HomeScreen(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.of(context).pushNamed('/new-contact');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      builder: (BuildContext context, value, Widget? child) {
        final List<Contact> contacts = value as List<Contact>;
        return ListView.builder(
          itemCount: contacts.length,
          itemBuilder: (BuildContext context, int index) {
            final Contact _contact = contacts[index];
            return Dismissible(
              key: Key(_contact.id),
              onDismissed: (_){
                contacts.remove(_contact);
              },
              child: ListTile(
                title: Text(_contact.name),
              ),
            );
          },
        );
      },
      valueListenable: ContactBook(),
    );
  }
}
