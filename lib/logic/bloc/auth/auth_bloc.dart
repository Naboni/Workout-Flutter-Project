import 'dart:async';

import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

// bloc
import 'auth.dart';

// repository
import '../../../data/repositories/user_repository.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository? userRepository;

  AuthenticationBloc({@required this.userRepository})
      : assert(userRepository != null),
        super(AuthenticationUninitialized());

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is AppStarted) {
      final bool hasToken = await userRepository!.hasToken();

      if (hasToken) {
        yield AuthenticationAuthenticated();
      } else {
        yield AuthenticationUnauthenticated();
      }
    }

    if (event is LoggedIn) {
      yield AuthenticationLoading();
      await userRepository!.persistToken(event.token!);
      yield AuthenticationAuthenticated();
    }

    if (event is LoggedOut) {
      yield AuthenticationLoading();
      await userRepository!.deleteToken();
      yield AuthenticationUnauthenticated();
    }
  }
}
