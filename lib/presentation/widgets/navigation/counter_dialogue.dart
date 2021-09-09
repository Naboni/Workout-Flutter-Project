import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/logic/cubit/counter_cubit.dart';

Future<void> counterDialog(BuildContext context) async {
  return await showDialog(
      context: context,
      builder: (context) {
        return BlocProvider<CounterCubit>(
          create: (context) => CounterCubit(),
          child: CountdownTimerDialogue(),
        );
      });
}

class CountdownTimerDialogue extends StatelessWidget {
  const CountdownTimerDialogue({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        height: MediaQuery.of(context).size.height * 0.2,
        width: MediaQuery.of(context).size.width * 0.8,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Set Duration (10 ~ 15 secs)',
              style: TextStyle(fontSize: 20),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                    BlocProvider.of<CounterCubit>(context).decrement();
                  },
                  child: Container(
                    height: 100,
                    width: MediaQuery.of(context).size.width * 0.25,
                    decoration: BoxDecoration(),
                    child: Icon(Icons.arrow_back_ios),
                  ),
                ),
                BlocBuilder<CounterCubit, CounterState>(
                  builder: (context, state) {
                    if (state.counterValue < 10) {
                      state.counterValue = 10;
                    }
                    if (state.counterValue > 15) {
                      state.counterValue = 15;
                    }

                    return Container(
                      child: Text(
                        state.counterValue.toString(),
                        style: TextStyle(fontSize: 40),
                      ),
                    );
                  },
                ),
                InkWell(
                  onTap: () {
                    BlocProvider.of<CounterCubit>(context).increment();
                  },
                  child: Container(
                    height: 100,
                    width: MediaQuery.of(context).size.width * 0.25,
                    decoration: BoxDecoration(),
                    child: Icon(Icons.arrow_forward_ios),
                  ),
                ),
              ],
            ),
            Text(
              'secs',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            'CANCEL',
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            'SET',
            style: TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }
}
