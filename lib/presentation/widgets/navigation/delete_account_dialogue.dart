import 'package:flutter/material.dart';

Future<void> deleteAccountDialog(BuildContext context) async {
  return await showDialog(
      context: context,
      builder: (context) {
        return DeleteAccountDialogue();
      });
}

class DeleteAccountDialogue extends StatelessWidget {
  const DeleteAccountDialogue({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        child: Text(
          'Are you sure you want to delete your account?',
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
