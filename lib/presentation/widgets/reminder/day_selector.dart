import 'package:flutter/material.dart';
// deps
import 'package:weekday_selector/weekday_selector.dart';

class DaySelector extends StatefulWidget {
  const DaySelector({Key? key}) : super(key: key);

  @override
  _DaySelectorState createState() => _DaySelectorState();
}

class _DaySelectorState extends State<DaySelector> {
  // We start with all days selected.
  final values = List.filled(7, true);
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(7),
      ),
      child: Container(
        height: 150,
        padding: EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Repeat",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.grey[600],
              ),
            ),
            WeekdaySelector(
              // We display the last tapped value in the example app
              onChanged: (int day) {
                setState(() {
                  // Use module % 7 as Sunday's index in the array is 0 and
                  // DateTime.sunday constant integer value is 7.
                  final index = day % 7;
                  // We "flip" the value in this example, but you may also
                  // perform validation, a DB write, an HTTP call or anything
                  // else before you actually flip the value,
                  // it's up to your app's needs.
                  values[index] = !values[index];
                });
              },
              values: values,
            ),
            Row(
              children: [
                Spacer(),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'CANCEL',
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 15.0,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(values);
                  },
                  child: Text(
                    'OK',
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
