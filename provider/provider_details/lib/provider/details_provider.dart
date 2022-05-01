import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider_details/model/base_model.dart';
import 'package:uuid/uuid.dart';

class DetailsProvider extends ChangeNotifier {
  late String id;
  late final CheapObject _cheapWidget;
  late final ExpensiveObject _expensiveWidget;
  late StreamSubscription _cheapWidgetSub;
  late StreamSubscription _expensiveWidgetSub;

  DetailsProvider()
      : id = const Uuid().v4(),
        _cheapWidget = CheapObject(),
        _expensiveWidget = ExpensiveObject();

  CheapObject get cheapWidget => _cheapWidget;
  ExpensiveObject get expensiveWidget => _expensiveWidget;

  void start() {
    _cheapWidgetSub = Stream.periodic(const Duration(seconds: 1)).listen(
      (_) {
        log("updating cheap");
        _cheapWidget = CheapObject();
        notifyListeners();
      },
    );

    _expensiveWidgetSub =
        Stream.periodic(const Duration(seconds: 10)).listen((_) {
      log("updating expensive");
      _expensiveWidget = ExpensiveObject();
      notifyListeners();
    });
  }

  void stop() {
    _cheapWidgetSub.cancel();
    _expensiveWidgetSub.cancel();
  }

  @override
  void notifyListeners() {
    id = const Uuid().v4();
    super.notifyListeners();
  }
}
