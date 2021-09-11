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

    blocTest<ReminderBloc, ReminderState>(
      'emits [ReminderInitial, ReminderLoaded(reminders)] when successful',
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
  });
}
