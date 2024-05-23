import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider_details/model/object.dart';
import 'package:uuid/uuid.dart';

class ObjectProvider extends ChangeNotifier {
  late String id;
  late CheapObject _cheapObject;
  late StreamSubscription _cheapObjectStreamsub;
  late ExpensiveObject _expensiveObject;
  late StreamSubscription _expensiveObjectStreamsub;

  // getters
  CheapObject get cheapObject => _cheapObject;
  ExpensiveObject get expensiveObject => _expensiveObject;

  // creating constructor for our ObjectProvider
  ObjectProvider()
      : id = const Uuid().v4(),
        _cheapObject = CheapObject(),
        _expensiveObject = ExpensiveObject();
  // creating function that kicks in the stream

  // reset id whenever notifyListeners are called
  @override
  void notifyListeners() {
    id = const Uuid().v4();
    super.notifyListeners();
  }

  void start() {
    _cheapObjectStreamsub = Stream.periodic(
      const Duration(seconds: 1),
    ).listen((_) {
      _cheapObject = CheapObject();
      notifyListeners();
    });
    _expensiveObjectStreamsub = Stream.periodic(
      const Duration(seconds: 10),
    ).listen((_) {
      _expensiveObject = ExpensiveObject();
      notifyListeners();
    });
  }

  void stop() {
    _cheapObjectStreamsub.cancel();
    _expensiveObjectStreamsub.cancel();
  }
}
