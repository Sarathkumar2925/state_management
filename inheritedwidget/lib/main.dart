import 'dart:developer' as devtools show log;

import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ApiProvider(
        api: Api(),
        child: const HomeScreen(),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ValueKey? _valKey = const ValueKey<String?>(null);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(ApiProvider.of(context).api.dateAndTime ?? ''),
      ),
      body: GestureDetector(
          onTap: () async {
            final Api api = ApiProvider.of(context).api;
            final String dateAndTime = await api.getDateAndTime();

            dateAndTime.log();

            setState(() {
              _valKey = ValueKey(dateAndTime);
            });
          },
          child: DateAndTimeWidget(key: _valKey,)),
    );
  }
}

class DateAndTimeWidget extends StatelessWidget {
  const DateAndTimeWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      height: double.infinity,
      child: Text(
        ApiProvider.of(context).api.dateAndTime ?? 'tap to get date and time',
      ),
    );
  }
}

class Api {
  String? dateAndTime;

  Future<String> getDateAndTime() {
    return Future.delayed(
            const Duration(seconds: 1), () => DateTime.now().toIso8601String())
        .then((value) {
      dateAndTime = value;
      return value;
    });
  }
}

class ApiProvider extends InheritedWidget {
  final String id;
  final Api api;

  ApiProvider({Key? key, required this.api, required Widget child})
      : id = const Uuid().v4(),
        super(key: key, child: child);

  @override
  bool updateShouldNotify(covariant ApiProvider oldWidget) {
    return id != oldWidget.id;
  }

  static ApiProvider of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<ApiProvider>()!;
}

extension Log on Object {
  void log() => devtools.log(toString());
}
