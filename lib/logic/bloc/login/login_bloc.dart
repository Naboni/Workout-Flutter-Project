import 'dart:async';

import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

// bloc
import '../auth/auth.dart';
import 'login.dart';

// repository
import '../../../data/repositories/user_repository.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository? userRepository;
  final AuthenticationBloc? authenticationBloc;

  LoginBloc({
    @required this.userRepository,
    @required this.authenticationBloc,
  })  : assert(userRepository != null),
        assert(authenticationBloc != null),
        super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is LoginButtonPressed) {
      yield LoginLoading();

      try {
        final token = await userRepository!.authenticate(
          username: event.username,
          password: event.password,
        );

        authenticationBloc!.add(LoggedIn(token: token));
        yield LoginInitial();
      } catch (error) {
        yield LoginFailure(error: error.toString());
      }
    }
  }
}
