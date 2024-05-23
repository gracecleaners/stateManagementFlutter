import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testingprovider/model/breadcrumbclass.dart';
import 'package:testingprovider/providers/breadcrumbprovider.dart';

class EnterBreadCrumb extends StatefulWidget {
  const EnterBreadCrumb({super.key});

  @override
  State<EnterBreadCrumb> createState() => _EnterBreadCrumbState();
}

class _EnterBreadCrumbState extends State<EnterBreadCrumb> {
  TextEditingController textController = TextEditingController();

  @override
  void initState() {
    textController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add a new item"),
      ),
      body: Column(
        children: [
          TextField(
            controller: textController,
            decoration: InputDecoration(hintText: "Enter an item"),
          ),
          TextButton(
              onPressed: () {
                final text = textController.text;
                if (text.isNotEmpty) {
                  final breadCrumbs = BreadCrumb(isActive: false, name: text);
                  context.read<BreadCrumbProvider>().add(breadCrumbs);
                  Navigator.of(context).pop();
                }
              },
              child: Text("Add"))
        ],
      ),
    );
  }
}
