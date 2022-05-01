import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testing_provider/provider/bread_crumb_provider.dart';
import 'package:testing_provider/widget/bread_crumb_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Consumer<BreadCrumbProvider>(
          builder: (
            context,
            value,
            child,
          ) =>
              BreadCrumbWidget(
            breadCrumbs: value.items,
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pushNamed("/new_crumb");
          },
          child: const Text(
            "Add new bread crumb",
          ),
        ),
        TextButton(
          onPressed: () {
            context.read<BreadCrumbProvider>().reset();
          },
          child: const Text(
            "Reset",
          ),
        ),
      ],
    );
  }
}
