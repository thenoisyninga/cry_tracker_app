import 'package:cry_tracker_app/pages/settings.dart';
import 'package:cry_tracker_app/utils/dialogues/credits.dart';
import 'package:cry_tracker_app/utils/register_cry_dialogue.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../db_ops/database_operations.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    if (getDateSinceLastCry() == null) {
      setLastCry(DateTime(DateTime.now().year));
    }
  }

  @override
  Widget build(BuildContext context) {
    int criedSince = getDaysSinceLastCry();

    void showCustomSnackbar(SnackBar snackBar) {
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Image(
          image: AssetImage('assets/appBar/appBarTitle.png'),
          height: 45,
        ),
        actions: [
          IconButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: ((context) => (const SettingsPage()))));
          }, icon: const Icon(Icons.settings))
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/backdrop/backdrop.png'),
                fit: BoxFit.cover)),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("You haven't cried since",
                style: TextStyle(color: Colors.white)),
            Text(criedSince.toString(),
                style: const TextStyle(color: Colors.white, fontSize: 150)),
            const Text("days.",
                style: TextStyle(
                  color: Colors.white,
                )),
          ],
        )),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.water_drop, color: Colors.grey[200], size: 20),
        onPressed: () {
          showDialog(
              context: context,
              builder: (_) => RegisterCryDialogue(
                    setStateCallback: setState,
                    showCustomSnackbarCallback: showCustomSnackbar,
                  ));
        },
      ),
    );
  }
}
