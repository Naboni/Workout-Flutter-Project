import 'package:flutter/material.dart';
// deps
import 'package:weekday_selector/weekday_selector.dart';

class DeleteConfirmation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(7),
      ),
      child: Container(
        height: 150,
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Delete",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.grey[600],
              ),
            ),
            Text("Are you sure you want to delete?"),
            Row(
              children: [
                Spacer(),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop("no");
                  },
                  child: Text(
                    'NO',
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 15.0,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop("yes");
                  },
                  child: Text(
                    'YES',
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 15.0,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
