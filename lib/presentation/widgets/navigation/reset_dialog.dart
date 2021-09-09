import 'package:flutter/material.dart';

Future<void> resetDialog(BuildContext context) async {
  return await showDialog(
      context: context,
      builder: (context) {
        return ResetDialogue();
      });
}

class ResetDialogue extends StatelessWidget {
  const ResetDialogue({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        child: Text(
          'Are you sure you want to reset your progress?',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20),
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            'YES',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            'NO',
            style: TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }
}
