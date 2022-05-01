import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

@immutable
class BaseModel {
  final String uuid;
  final String lastUpdatedOn;

  BaseModel()
      : uuid = const Uuid().v4(),
        lastUpdatedOn = DateTime.now().toIso8601String();

  @override
  bool operator ==(covariant BaseModel other) => uuid == other.uuid;

  @override
  int get hashCode => uuid.hashCode;

}

class CheapObject extends BaseModel {}

class ExpensiveObject extends BaseModel {}
