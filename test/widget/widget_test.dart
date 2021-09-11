import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:project/main.dart';
import 'package:project/presentation/screens/feeds.dart';
// import 'package:project/presentation/screens/feeds.dart';

void main() {
  Widget makeTestableWidget({required Widget child}) {
    return MaterialApp(
      home: child,
    );
  }

  testWidgets('Search', (WidgetTester tester) async {
    final addField = find.byKey(ValueKey('searchField'));

    await tester.pumpWidget(makeTestableWidget(child: Feeds()));
    await tester.enterText(addField, 'Simple');
    await tester.tap(addField);
    await tester.pump(); //rebuilds Widget

    expect(find.text('Simple'), findsNothing);
  });
  testWidgets('Test to see MaterialApp widget is in tree',
      (WidgetTester tester) async {
    await tester.pumpWidget(makeTestableWidget(child: MyApp()));

    expect(find.byType(MaterialApp), findsOneWidget);
  });

  testWidgets('Simple test',
      (WidgetTester tester) async {
    await tester.pumpWidget(makeTestableWidget(child: MyApp()));

    expect(find.byType(MaterialApp), findsOneWidget);
  });
}
