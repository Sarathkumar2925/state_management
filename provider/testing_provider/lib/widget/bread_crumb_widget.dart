import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:testing_provider/model/bread_crumb.dart';

class BreadCrumbWidget extends StatelessWidget {
  final UnmodifiableListView<BreadCrumb> breadCrumbs;
  const BreadCrumbWidget({
    Key? key,
    required this.breadCrumbs,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: breadCrumbs
          .map(
            (breadcrumb) => Text(
              breadcrumb.title,
              style: TextStyle(
                color: breadcrumb.isActive ? Colors.blue : Colors.black,
              ),
            ),
          )
          .toList(),
    );
  }
}
