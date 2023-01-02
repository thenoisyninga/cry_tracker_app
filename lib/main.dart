import 'package:cry_tracker_app/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  await Hive.initFlutter();
  await Hive.openBox('cry_tracker_database');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tear Tracker',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        scaffoldBackgroundColor: Colors.grey[900],
        dialogBackgroundColor: Colors.grey[900],
      ),
      home: const HomePage(),
    );
  }
}
