// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

// import 'dart:js_util';

// import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:project/main.dart';
// import 'package:project/presentation/screens/navigation_drawer.dart';
// import 'package:project/presentation/screens/settings.dart';

// import 'package:project/main.dart';
// import 'package:project/presentation/widgets/navigation/counter_dialogue.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that our counter starts at 0.
    // expect(find.text('15'), findsOneWidget);
    expect(find.text('14'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    // await tester.tap(find.byIcon(Icons.arrow_back_ios));
    // await tester.pump();

    // // Verify that our counter has incremented.
    // expect(find.text('15'), findsNothing);
    // expect(find.text('14'), findsOneWidget);
  });
}
