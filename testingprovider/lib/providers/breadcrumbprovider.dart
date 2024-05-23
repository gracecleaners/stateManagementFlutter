import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:testingprovider/model/breadcrumbclass.dart';

class BreadCrumbProvider extends ChangeNotifier {
  final List<BreadCrumb> _items = [];
  UnmodifiableListView<BreadCrumb> get items => UnmodifiableListView(_items);

  // lets allow user add item to the breadcrumb
  void add(BreadCrumb breadCrumb) {
    for (final item in _items) {
      item.activate();
    }
    _items.add(breadCrumb);
    notifyListeners();
  }

  // enabling users to reset or remove all items from the breadcrumb
  void reset() {
    _items.clear();
    notifyListeners();
  }
}
