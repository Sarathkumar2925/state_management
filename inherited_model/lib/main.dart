import 'package:flutter/material.dart';
import 'package:inherited_model/available_color_model.dart';
import 'package:inherited_model/available_colors.dart';
import 'package:inherited_model/constants.dart';
import 'extensions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  MaterialColor color1 = Colors.green;
  MaterialColor color2 = Colors.grey;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: AvailableColorsModel(
          color1: color1,
          color2: color2,
          child: Column(
            children: [
              Row(
                children: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        color1 = colors.getRandomElement();
                      });
                    },
                    child: const Text('Change color one'),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        color2 = colors.getRandomElement();
                      });
                    },
                    child: const Text('Change color two'),
                  ),
                ],
              ),
              const ColorWidget(color: AvailableColors.one),
              const ColorWidget(color: AvailableColors.two),
            ],
          ),
        ),
      ),
    );
  }
}

class ColorWidget extends StatelessWidget {
  final AvailableColors color;
  const ColorWidget({Key? key, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = AvailableColorsModel.of(context, color);
    switch (color) {
      case AvailableColors.one:
        'Update color one'.log();
        break;
      case AvailableColors.two:
        'Update color two'.log();
        break;
    }

    return Container(
      height: 100,
      color: color == AvailableColors.one ? provider.color1 : provider.color2,
    );
  }
}
