import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:project/data/models/models.dart';
// import 'package:project/data/models/exercise/exercise.dart';
import 'package:project/data/models/report/report.dart';
// import 'package:project/data/models/workout/workout.dart';
// import 'package:project/data/repositories/report_repository.dart';
import 'package:project/data/repositories/user_repository.dart';
import 'package:project/logic/bloc/auth_bloc/auth.dart';
import 'package:project/logic/bloc/report/report_bloc.dart';

class MockUserRepositories extends Mock implements UserRepositories {}

void main() {
  MockUserRepositories mockUserRepository;
  mockUserRepository = MockUserRepositories();
  setUp(() {});
  group('Authentication', () {
    final User user = User()
      ..age = 10
      ..id = '1'
      ..verified = false
      ..dateCreated = 'Mon'
      ..phoneNumber = '0912121212'
      ..rating = 2
      ..firstName = 'Naboni'
      ..lastName = 'Abebe'
      ..email = 'se.naboni.abebe@gmail.com'
      ..token = 'kgukhaio891798'
      ..profileImage = 'assets/images/course1'
      ..bio = 'peace'
      ..role = 'trainer';

    blocTest<AuthBloc, AuthState>(
      'emits [AuthAuthenticated()] when AppStarted is successful',
      build: () {
        when(mockUserRepository.hasUser())
            .thenAnswer((_) async => Future.value(true));
        return AuthBloc(mockUserRepository);
      },
      act: (bloc) {
        bloc.add(AppStarted());
      },
      expect: () => [
        AuthAuthenticated(),
      ],
    );

    blocTest<AuthBloc, AuthState>(
      'emits [AuthLoading(), AuthAuthenticated()] when LogIn successful',
      build: () {
        when(mockUserRepository.persisteUser('user'))
            .thenAnswer((_) async => Future.value());
        return AuthBloc(mockUserRepository);
      },
      act: (bloc) {
        bloc.add(LoggedIn(user: 'user'));
      },
      expect: () => [
        AuthLoading(),
        AuthAuthenticated(),
      ],
    );

    blocTest<AuthBloc, AuthState>(
      'emits [AuthLoading(), AuthUnauthenticated()] when LoggedOut is successful',
      build: () {
        when(mockUserRepository.deleteUser())
            .thenAnswer((_) async => Future.value());
        return AuthBloc(mockUserRepository);
      },
      act: (bloc) {
        bloc.add(LoggedOut());
      },
      expect: () => [
        AuthLoading(),
        AuthUnauthenticated(),
      ],
    );

    blocTest<AuthBloc, AuthState>(
      'emits [AuthLoading(), AuthUnauthenticated()] when DeleteAccount is successful',
      build: () {
        when(mockUserRepository.deleteAccount())
            .thenAnswer((_) async => Future.value(true));
        return AuthBloc(mockUserRepository);
      },
      act: (bloc) {
        bloc.add(DeleteAccount());
      },
      expect: () => [
        AuthLoading(),
        AuthUnauthenticated(),
      ],
    );
  });
}
