import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_details/model/object.dart';
import 'package:provider_details/provider/object_provider.dart';

class ExpensiveWidget extends StatelessWidget {
  const ExpensiveWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final expensiveObject = context.select<ObjectProvider, ExpensiveObject>(
        (provider) => provider.expensiveObject);
    return Container();
  }
}
