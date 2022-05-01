import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_details/model/base_model.dart';
import 'package:provider_details/provider/details_provider.dart';

class ExpensiveWidget extends StatefulWidget {
  const ExpensiveWidget({Key? key}) : super(key: key);

  @override
  State<ExpensiveWidget> createState() => _ExpensiveWidgetState();
}

class _ExpensiveWidgetState extends State<ExpensiveWidget> {
  @override
  Widget build(BuildContext context) {
    final ExpensiveObject expensiveObject =
        context.select<DetailsProvider, ExpensiveObject>(
      (value) => value.expensiveWidget,
    );
    return Container(
      height: 100,
      color: Colors.blue,
      child: Column(
        children: [
          const Text("Expensive widget"),
          const Text ("last update on"),
          Wrap(children: [Text(expensiveObject.lastUpdatedOn,)]),
        ],
      ),
    );
  }
}
