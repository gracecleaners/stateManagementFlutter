import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testingprovider/homepage.dart';
import 'package:testingprovider/providers/breadcrumbprovider.dart';
import 'package:testingprovider/screens/enteritem.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (_) => BreadCrumbProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
      routes: {'/new': (context) => const EnterBreadCrumb()},
    );
  }
}
