import 'package:cry_tracker_app/db_ops/database_operations.dart';
import 'package:cry_tracker_app/utils/console_attempt_dialogue.dart';
import 'package:flutter/material.dart';

class RegisterCryDialogue extends StatelessWidget {
  const RegisterCryDialogue({super.key, required this.setStateCallback, required this.showCustomSnackbarCallback});
  final Function setStateCallback;
  final Function showCustomSnackbarCallback;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.grey[900],
      title: Text(
        "You Cried?!?",
        style: TextStyle(
          color: Colors.grey[200],
        ),
        ),
      actions: [
        TextButton(
          style: TextButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.primary,
          ),
          onPressed: () {
            setStateCallback(() {
              setLastCry(DateTime.now());
            });
            Navigator.pop(context);
            showDialog(context: context, builder: (_) => ConsolationAttemptDialogue());
          },
          child: Text("Yes",
            style: TextStyle(
              color: Colors.grey[900],
            ),
          ),
        ),

        TextButton(
          child: const Text("No"),
          onPressed: () {
            showCustomSnackbarCallback(
              SnackBar(content: Text(
                "Thank God!",
              ))
            );
            Navigator.pop(context);
          },
        ),
        
      ],
    );
  }
}