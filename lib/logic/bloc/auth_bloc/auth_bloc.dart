import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:project/data/repositories/user_repository.dart';

import 'auth.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserRepositories userRepositories;
  AuthBloc(this.userRepositories) : super(AuthUninitialized());

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    // TODO: implement mapEventToState
    if (event is AppStarted) {
      final bool? hasUser = await userRepositories.hasUser();
      if (hasUser!) {
        yield AuthAuthenticated();
      } else {
        yield AuthUnauthenticated();
      }
    }
    if (event is LoggedIn) {
      yield AuthLoading();
      await userRepositories.persisteUser(event.user);
      yield AuthAuthenticated();
    }
    if (event is LoggedOut) {
      yield AuthLoading();
      await userRepositories.deleteUser();
      yield AuthUnauthenticated();
    }
    if (event is DeleteAccount) {
      yield AuthLoading();
      await userRepositories.deleteAccount();
      yield AuthUnauthenticated();
    }
  }
}
