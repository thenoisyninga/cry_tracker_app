import 'dart:ui';

import 'package:flutter/material.dart';

import '../utils/custom_buttons/settings_button.dart';
import '../utils/dialogues/credits.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'S E T T I N G S',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/backdrop/backdrop.png'),
                fit: BoxFit.cover)),
        child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: SettingsButton(
                      title: 'Credits',
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: ((context) => const Credits()));
                      },
                    )),
              ],
            )),
      ),
    );
  }
}
