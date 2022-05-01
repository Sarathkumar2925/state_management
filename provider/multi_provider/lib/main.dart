import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Home Screen",
          ),
        ),
        body: const HomeScreen(),
      ),
    ),
  );
}

Stream<String> newStream(Duration duration) => Stream.periodic(
      duration,
      (_) => now(),
    );

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider.value(
          value: newStream(
            const Duration(
              seconds: 1,
            ),
          ),
          initialData: (_) => Seconds(),
        ),
        StreamProvider.value(
          value: newStream(
            const Duration(
              seconds: 5,
            ),
          ),
          initialData:(_) => Minutes(),
        ),
      ],
      child: Column(
        children: [
            Row(
            children: const [
               SecondsWidget(),
              MinutesWidget()
            ],
          )
        ],
      ),
    );
  }
}

/// Function to return current time as ISO string.
String now() => DateTime.now().toIso8601String();

@immutable
class Seconds {
  final String value;
  Seconds() : value = now();
}

@immutable
class Minutes {
  final String value;
  Minutes() : value = now();
}

class SecondsWidget extends StatelessWidget {
  const SecondsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Seconds seconds = context.watch<Seconds>();
    return Expanded(
      child: Container(
        color: Colors.yellow,
        child: Text(
          seconds.value,
        ),
      ),
    );
  }
}

class MinutesWidget extends StatelessWidget {
  const MinutesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Minutes minutes = context.watch<Minutes>();
    return Expanded(
      child: Container(
        color: Colors.blue,
        child: Text(
          minutes.value,
        ),
      ),
    );
  }
}
