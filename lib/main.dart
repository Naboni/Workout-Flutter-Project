import 'package:flutter/material.dart';

// deps
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:project/data/models/user/registration_data.dart';
import 'package:project/presentation/screens/auth/login.dart';

// bloc
import './logic/bloc/reminder/reminder.dart';
import './logic/bloc/workout/workout.dart';
import 'logic/bloc/ticker/timer_bloc.dart';
import 'logic/bloc/ticker/ticker.dart';

// repository
import './data/repositories/user_repository.dart';
import './data/repositories/reminder_repository.dart';

// models/adapter
import 'data/models/workout/workout.dart';
import 'data/models/exercise/exercise.dart';
import 'data/models/reminder/reminder.dart';

// utils
import './utils/prefrence.dart';

import './presentation/screens/_routes.dart';
import 'logic/bloc/auth_bloc/auth.dart';
import 'logic/bloc/login_bloc/login.dart';
import 'tab_route.dart';
import './presentation/router.dart';

// ! bloc lifecycle observer
class MyBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    print('onCreate -- ${bloc.runtimeType}');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print('onChange -- ${bloc.runtimeType}, $change');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print('onError -- ${bloc.runtimeType}, $error');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    print('onClose -- ${bloc.runtimeType}');
  }
}

// ? Instantiate local notification
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() async {
  // ! Insure all widgets are binded(built) before initalizing any object
  WidgetsFlutterBinding.ensureInitialized();

  // ? Initialize hive & register adapters
  await Hive.initFlutter();
  Hive.registerAdapter(ReminderAdapter());
  Hive.registerAdapter(WorkoutAdapter());
  Hive.registerAdapter(ExerciseAdapter());

  await Hive.openBox<Reminder>("reminders");
  await Hive.openBox<Workout>("workouts");

  // ? Initialize local notification
  // for default icon
  var initializationSettingsAndroid = AndroidInitializationSettings('ic');
  var initializationSettings =
      InitializationSettings(android: initializationSettingsAndroid);
  await flutterLocalNotificationsPlugin.initialize(initializationSettings,
      onSelectNotification: (String? payload) async {
    if (payload != null) {
      debugPrint('notification payload $payload');
    }
  });

  // ? Run the bloc observer(for debuging purpose)
  Bloc.observer = MyBlocObserver();

  // ! repository initialization
  final ReminderRepository reminderRepository = ReminderRepository();
  runApp(RepositoryProvider(
    create: (context) => UserRepositories(),
    child: MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) {
          return AuthBloc()..add(AppStarted());
        }),
        BlocProvider(
          create: (context) => ReminderBloc(reminderRepository)
            ..add(
              GetReminders(),
            ),
        ),
        BlocProvider(create: (context) => WorkoutBloc()),
        BlocProvider(create: (_) => TimerBloc(ticker: Ticker())),
      ],
      child: MyApp(),
    ),
  ));
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final appRouter = AppRouter();
  final data = RegistrationData();
  @override
  void initState() {
    // ? Future delayed b/c cant use async/await on init
    Future.delayed(Duration.zero, () async {
      // ! check if db is already populated
      var isPopulated = await Pref.checkIfPopulated();
      if (!isPopulated) {
        Pref.setPopulated();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    // ! close hive box...not sure where to dispose
    Hive.box("reminders").close();
    Hive.box("workouts").close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is AuthAuthenticated) {
            return TabRoute(data: data);
          }
          if (state is AuthUnauthenticated) {
            //! MAKE THIS TO THE PAGE ROUTE VIEW LATTER
            return TabRoute(data: data);
            // return Intro();
          }
          if (state is AuthLoading) {
            //! ADD A SPLASH SCREEN PLS
            return Scaffold(body: CircularProgressIndicator());
          }
          return Scaffold(body: CircularProgressIndicator());
        },
      ),
      debugShowCheckedModeBanner: false,
      title: 'Can Addis',
      theme: ThemeData(
        primaryColor: Colors.blue.shade300,
      ),
      onGenerateRoute: appRouter.onGenerateRoute,
    );
  }
}
