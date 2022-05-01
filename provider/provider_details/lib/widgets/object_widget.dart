import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_details/provider/details_provider.dart';

class ObjectWidget extends StatelessWidget {
  const ObjectWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final object = context.watch<DetailsProvider>();
    return Container(
      height: 100,
      color: Colors.purple,
      child: Column(
        children: [
          const Text("Expensive widget"),
          const Text ("last update on"),
          Wrap(children: [Text(object.id,)]),
        ],
      ),
    );
  }
}