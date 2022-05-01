import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_details/model/base_model.dart';
import 'package:provider_details/provider/details_provider.dart';

class CheapWidget extends StatelessWidget {
  const CheapWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CheapObject cheapWidget =
        context.select<DetailsProvider, CheapObject>(
      (value) => value.cheapWidget,
    );
    return Container(
      height: 100,
      color: Colors.yellow,
      child: Column(
        children: [
          const Text("Cheap widget"),
          const Text ("last update on"),
          Text(cheapWidget.lastUpdatedOn),
        ],
      ),
    );
  }
}