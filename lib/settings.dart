import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        actions: [
          IconButton(
              onPressed: () => showAboutDialog(context: context),
              icon: Icon(Icons.info))
        ],
      ),
      body: const Text("TODO"),
    );
  }
}
