import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:project/data/models/exercise/exercise.dart';
import 'package:project/data/models/reminder/reminder.dart';
import 'package:project/data/models/report/report.dart';
import 'package:project/data/models/workout/workout.dart';
import 'package:project/main.dart';
import 'package:project/presentation/screens/feeds.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
// import 'package:project/presentation/screens/feeds.dart';

Future<void> pain() async{
  // ? Initialize hive & register adapters
  await Hive.initFlutter();
  Hive.registerAdapter(ReminderAdapter());
  Hive.registerAdapter(WorkoutAdapter());
  Hive.registerAdapter(ExerciseAdapter());
  Hive.registerAdapter(ReportAdapter());

  await Hive.openBox<Workout>("workouts");
  await Hive.openBox<Report>("report");
  await Hive.openBox<Reminder>("reminders");
  // // ? Initialize local notification
  // // for default icon
  // var initializationSettingsAndroid = AndroidInitializationSettings('ic');
  // var initializationSettings =
  // InitializationSettings(android: initializationSettingsAndroid);
  // await flutterLocalNotificationsPlugin.initialize(initializationSettings,
  //     onSelectNotification: (String? payload) async {
  //       if (payload != null) {
  //         debugPrint('notification payload $payload');
  //       }
  //     });
  //
  // // ? Run the bloc observer(for debuging purpose)
  // Bloc.observer = MyBlocObserver();
}
void main() {
  Widget makeTestableWidget({required Widget child}) {
    return MaterialApp(
      home: child,
    );
  }

  testWidgets('Search', (WidgetTester tester) async {
    final addField = find.byKey(ValueKey('searchField'));
    await tester.pumpWidget(Feeds());

    await tester.pumpWidget(makeTestableWidget(child: Feeds()));
    await tester.enterText(addField, 'Simple');
    await tester.tap(addField);
    await tester.pump(); //rebuilds Widget

    expect(find.text('Simple'), findsNothing);
  });
  testWidgets('Test to see MaterialApp widget is in tree',
      (WidgetTester tester) async {
    await tester.runAsync(() => pain());
    await tester.pumpWidget(MyApp());
    await tester.pumpWidget(makeTestableWidget(child: MyApp()));

    expect(find.byType(MaterialApp), findsOneWidget);
  });

  testWidgets('Simple test',
      (WidgetTester tester) async {
    await tester.pumpWidget(makeTestableWidget(child: MyApp()));

    expect(find.byType(MaterialApp), findsOneWidget);
  });
}
