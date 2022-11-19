import 'dart:math';

import 'package:flutter/material.dart';

class ConsolationAttemptDialogue extends StatelessWidget {
  ConsolationAttemptDialogue({super.key});

  final List<String> consolationMessages = [
      "Ik I dont know what you are going through. Whatever it is that made you cry, I'm genuinely sorry about it. But I can make you a short promise, this is very temporary. Just wait for a bit longer, and it will all get better, and then soon enough, it will get positive. Just take charge, let it out, and wait <3",
      "I'm sorry about that.. I pray that whoever you are, this situation passes for you.. it gets better. Stay strong, I genuinely believe you can make it. Let it out if you need to, but after that, ik you will get back up <3"
    ];

  @override
  Widget build(BuildContext context) {
    final _random = new Random();
    return AlertDialog(
      backgroundColor: Colors.grey[900],
      title: Text(
        "Hey.. listen..",
        style: TextStyle(
          color: Colors.grey[300],
        )
        ),
      content: Text(
        consolationMessages[_random.nextInt(consolationMessages.length)],
        style: TextStyle(
          color: Colors.grey[300],
        ),
      ),
    );
  }
}