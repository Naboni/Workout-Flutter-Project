import 'package:flutter/material.dart';
// deps
import 'package:flutter_bloc/flutter_bloc.dart';

// bloc
import '../../logic/bloc/auth/auth.dart';
import '../../logic/bloc/login/login.dart';

// repository
import '../../data/repositories/user_repository.dart';

// widgets
import '../../presentation/widgets/auth/login_form.dart';

class Login extends StatefulWidget {
  static const String routeName = '/login';
  final UserRepository? userRepository;

  Login({Key? key, @required this.userRepository})
      : assert(userRepository != null),
        super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  LoginBloc? _loginBloc;
  AuthenticationBloc? _authenticationBloc;

  UserRepository get _userRepository => widget.userRepository!;

  @override
  void initState() {
    _authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);
    _loginBloc = LoginBloc(
      userRepository: _userRepository,
      authenticationBloc: _authenticationBloc,
    );
    super.initState();
  }

  @override
  void dispose() {
    _loginBloc!.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: LoginForm(
          authenticationBloc: _authenticationBloc,
          loginBloc: _loginBloc,
        ),
      ),
    );
  }
}
