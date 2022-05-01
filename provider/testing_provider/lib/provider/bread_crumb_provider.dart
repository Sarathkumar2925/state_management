import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:testing_provider/model/bread_crumb.dart';

class BreadCrumbProvider extends ChangeNotifier {
  final List<BreadCrumb> _tems = <BreadCrumb>[];
  UnmodifiableListView<BreadCrumb> get items => UnmodifiableListView(
        _tems,
      );

  void add({required BreadCrumb breadCrumb}) {
    for (final item in _tems) {
      item.activate();
    }
    _tems.add(
      breadCrumb,
    );
    notifyListeners();
  }

  void reset() {
    _tems.clear();
    notifyListeners();
  }
}
