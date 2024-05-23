import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testingprovider/providers/breadcrumbprovider.dart';
import 'package:testingprovider/screens/breadcrumbdisplay.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Align(
            alignment: Alignment.center,
            child: Text(
              "Bread Crumb App",
              style: TextStyle(color: Colors.white),
            )),
      ),
      body: Column(
        children: [
          Consumer<BreadCrumbProvider>(builder: (context, value, child) {
            return BreadCrumbDisplay(breadCrumbs: value.items);
          }),
          TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed("/new");
              },
              child: const Text(
                "Add new bread crumb",
                style: TextStyle(color: Colors.blue),
              )),
          TextButton(
              onPressed: () {
                context.read<BreadCrumbProvider>().reset();
              },
              child: const Text(
                "Reset",
                style: TextStyle(color: Colors.blue),
              )),
        ],
      ),
    );
  }
}
