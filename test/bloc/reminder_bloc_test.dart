import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:project/data/models/reminder/reminder.dart';
import 'package:project/data/repositories/reminder_repository.dart';
import 'package:project/logic/bloc/reminder/reminder_bloc.dart';

class MockReminderRepository extends Mock implements ReminderRepository {}

void main() {
  MockReminderRepository mockReminderRepository;
  mockReminderRepository = MockReminderRepository();
  setUp(() {});
  group('Get Reports', () {
    List<Reminder> reminders = [
      Reminder()
        ..time = '2'
        ..days = [1, 2],
      Reminder()
        ..time = '2'
        ..days = [1, 2]
    ];
    final reminder = Reminder()
      ..time = '2'
      ..days = [1, 2];
    blocTest<ReminderBloc, ReminderState>(
      'emits [ReminderInitial, ReminderLoaded(reminders)] when GetReminer is successful',
      build: () {
        when(mockReminderRepository.getReminders())
            .thenAnswer((_) async => reminders);
        return ReminderBloc(mockReminderRepository);
      },
      act: (bloc) {
        bloc.add(GetReminders());
      },
      expect: () => [
        ReminderInitial(),
        ReminderLoaded(reminders),
      ],
    );
    blocTest<ReminderBloc, ReminderState>(
      'emits [ReminderLoaded(reminders)] when AddReminer is successful',
      build: () {
        when(mockReminderRepository.saveReminder(reminder))
            .thenAnswer((_) async => Future.value());
        when(mockReminderRepository.getReminders())
            .thenAnswer((_) async => reminders);
        return ReminderBloc(mockReminderRepository);
      },
      act: (bloc) {
        bloc.add(AddReminder(reminder));
      },
      expect: () => [
        ReminderLoaded(reminders),
      ],
    );

    blocTest<ReminderBloc, ReminderState>(
      'emits [ReminderLoaded(reminders)] when DeleteReminer is successful',
      build: () {
        when(mockReminderRepository.deleteReminder(reminder))
            .thenAnswer((_) async => Future.value());
        when(mockReminderRepository.getReminders())
            .thenAnswer((_) async => reminders);
        return ReminderBloc(mockReminderRepository);
      },
      act: (bloc) {
        bloc.add(DeleteReminder(reminder));
      },
      expect: () => [
        ReminderLoaded(reminders),
      ],
    );
  });
}
