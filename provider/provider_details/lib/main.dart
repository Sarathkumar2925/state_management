import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_details/provider/details_provider.dart';
import 'package:provider_details/widgets/cheap_widget.dart';
import 'package:provider_details/widgets/expensive_widget.dart';
import 'package:provider_details/widgets/object_widget.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (BuildContext context) => DetailsProvider(),
    child: MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Home page",
          ),
        ),
        body: const HomePage(),
      ),
    ),
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            Expanded(child: CheapWidget()),
            Expanded(child: ExpensiveWidget()),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            Expanded(child: ObjectWidget()),
          ],
        ),
        Row(
          children: [
            TextButton(
              onPressed: () {
                context.read<DetailsProvider>().start();
              },
              child: const Text("start"),
            ),
            TextButton(
              onPressed: () {
                context.read<DetailsProvider>().stop();
              },
              child: const Text("stop"),
            ),
          ],
        )
      ],
    );
  }
}
