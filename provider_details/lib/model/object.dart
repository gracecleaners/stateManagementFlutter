import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

@immutable
class BaseObject {
  final String id;
  final String lastUpdated;

  BaseObject()
      : id = const Uuid().v4(),
        lastUpdated = DateTime.now().toIso8601String();

  // we are going to start identifying an object by using id (but before we do this, we need to first implement equality and hashCode)
  @override
  bool operator ==(covariant BaseObject other) => id == other.id;
  
  @override
  int get hashCode => id.hashCode;
  
}

// defining a class that holds our expensive object 
@immutable 
class ExpensiveObject extends BaseObject{
  
}

@immutable 
class CheapObject extends BaseObject{
  
}
