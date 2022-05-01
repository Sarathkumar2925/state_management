import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testing_provider/model/bread_crumb.dart';
import 'package:testing_provider/provider/bread_crumb_provider.dart';

class NewCrumb extends StatelessWidget {
  const NewCrumb({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _controller = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Add new crumb",
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
            ),
          ),
          TextButton(
            onPressed: () {
              final String _text = _controller.text;
              if (_text.isNotEmpty) {
                final BreadCrumb breadCrumb = BreadCrumb(
                  isActive: false,
                  name: _text,
                );

                Provider.of<BreadCrumbProvider>(
                  context,
                  listen: false,
                ).add(
                  breadCrumb: breadCrumb,
                );

                Navigator.of(context).pop();
              }
            },
            child: const Text("Add crumb"),
          ),
        ],
      ),
    );
  }
}
