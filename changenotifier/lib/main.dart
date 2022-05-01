import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

SliderData sliderData = SliderData();

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: InheritedChangeNotifier(
          sliderData: sliderData,
          child: Builder(builder: (BuildContext context) {  
            return Column(
            children: [
              Slider(
                value: InheritedChangeNotifier.of(context),
                onChanged: (value) {
                  sliderData.value = value;
                },
              ),
              Row(
                children: [
                  Opacity(
                    opacity: InheritedChangeNotifier.of(context),
                    child: Container(
                      height: 100,
                      color: Colors.amber,
                    ),
                  ),
                  Opacity(
                    opacity: InheritedChangeNotifier.of(context),
                    child: Container(
                      height: 100,
                      color: Colors.purple,
                    ),
                  ),
                ].expandEqually().toList(),
              )
            ],
          );
          },),
        ),
      ),
    );
  }
}

extension Expand on Iterable<Widget> {
  Iterable<Widget> expandEqually() => map(
        (w) => Expanded(child: w),
      );
}

class SliderData extends ChangeNotifier {
  double _value = 0.0;
  double get value => _value;
  set value(double newValue) {
    if (newValue != _value) {
      _value = newValue;
      notifyListeners();
    }
  }
}

class InheritedChangeNotifier extends InheritedNotifier<SliderData> {
  const InheritedChangeNotifier(
      {Key? key, required Widget child, required SliderData sliderData})
      : super(
          key: key,
          child: child,
          notifier: sliderData,
        );

  static double of(BuildContext context) =>
      context
          .dependOnInheritedWidgetOfExactType<InheritedChangeNotifier>()
          ?.notifier
          ?.value ??
      0.0;
}
