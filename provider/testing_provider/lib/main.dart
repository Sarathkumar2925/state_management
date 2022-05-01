import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testing_provider/provider/bread_crumb_provider.dart';
import 'package:testing_provider/screens/home_screen.dart';
import 'package:testing_provider/screens/new_crumb.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (BuildContext context) => BreadCrumbProvider(),
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text(
              "Home screen",
            ),
          ),
          body: const HomeScreen(),
        ),
        routes: {
          '/new_crumb': (context) => const NewCrumb(),
        },
      ),
    ),
  );
}
