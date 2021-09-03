import 'package:flutter/material.dart';

// deps
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

// bloc
import './logic/bloc/auth/auth.dart';
import './logic/bloc/login/login_bloc.dart';
import './logic/bloc/reminder/reminder.dart';

// repository
import './data/repositories/user_repository.dart';
import './data/repositories/reminder_repository.dart';

// models/adapter
import 'data/models/reminder/reminder.dart';

import './presentation/screens/_routes.dart';
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

  await Hive.openBox<Reminder>("reminders");

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
  // ? Inject a single instance of the userRepository
  runApp(MyApp(userRepository: UserRepository()));
}

class MyApp extends StatefulWidget {
  final UserRepository? userRepository;

  MyApp({Key? key, @required this.userRepository}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // ! repository initialization
  final ReminderRepository reminderRepository = ReminderRepository();

  final appRouter = AppRouter();

  AuthenticationBloc? authenticationBloc;
  UserRepository get userRepository => widget.userRepository!;

  @override
  void initState() {
    authenticationBloc = AuthenticationBloc(userRepository: userRepository);
    authenticationBloc!.add(AppStarted());

    // ! open hive box
    Hive.openBox<Reminder>("reminders");
    super.initState();
  }

  @override
  void dispose() {
    // ! close blocs
    authenticationBloc!.close();
    // ! close hive box...not sure where to dispose
    Hive.box("reminders").close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => ReminderBloc(reminderRepository)
            ..add(
              GetReminders(),
            ),
        ),
        BlocProvider(
          create: (_) => AuthenticationBloc(userRepository: userRepository),
        ),
        BlocProvider(
          create: (_) => LoginBloc(
              authenticationBloc: authenticationBloc,
              userRepository: userRepository),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Can Addis',
        theme: ThemeData(
          primaryColor: Colors.blue.shade300,
        ),
        home: SafeArea(
          child: TabRoute(),
          //  Build(
          //     authenticationBloc: authenticationBloc,
          //     userRepository: userRepository),
        ),
        onGenerateRoute: appRouter.onGenerateRoute,
      ),
    );
  }
}

class Build extends StatelessWidget {
  const Build({
    Key? key,
    required this.authenticationBloc,
    required this.userRepository,
  }) : super(key: key);

  final AuthenticationBloc? authenticationBloc;
  final UserRepository userRepository;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      bloc: authenticationBloc,
      builder: (BuildContext context, AuthenticationState state) {
        if (state is AuthenticationUninitialized) {
          return Splash();
        }
        if (state is AuthenticationAuthenticated) {
          return TabRoute();
        }
        if (state is AuthenticationUnauthenticated) {
          return Login(userRepository: userRepository);
        }
        if (state is AuthenticationLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Splash();
        }
      },
    );
  }
}
