import 'package:flutter/material.dart';
// deps
import 'package:lottie/lottie.dart';
// model
import '../../../data/models/exercise/exercise.dart';

class ExerciseModal extends StatefulWidget {
  final int position;
  final int length;
  final List<Exercise> exerciseList;
  const ExerciseModal({
    Key? key,
    required this.position,
    required this.length,
    required this.exerciseList,
  }) : super(key: key);

  @override
  _ExerciseModalState createState() => _ExerciseModalState();
}

class _ExerciseModalState extends State<ExerciseModal> {
  int _modalControllerIndex = 0;

  void _next() {
    setState(() {
      _modalControllerIndex++;
    });
    _checkDisabled();
  }

  void _prev() {
    setState(() {
      _modalControllerIndex--;
    });
    _checkDisabled();
  }

  bool? _isPrevDisabled;
  bool? _isNextDisabled;

  // index 0 for prev, 1 for next
  List<bool> _checkDisabled() {
    // ! POSITION IS NOT THE ONE THAT CHANGEGS! ONLY _modalControllerIndex changes
    // ! and prev and next are changged based on the sum of position and _modalControllerIndex
    print("position ${widget.position + _modalControllerIndex}");

    if (widget.position + _modalControllerIndex == widget.length - 1)
      setState(() {
        _isNextDisabled = true;
      });
    else
      setState(() {
        _isNextDisabled = false;
      });

    if (widget.position + _modalControllerIndex == 0)
      setState(() {
        _isPrevDisabled = true;
      });
    else
      setState(() {
        _isPrevDisabled = false;
      });
    return [_isPrevDisabled!, _isNextDisabled!];
  }

  @override
  void initState() {
    // TODO: implement initState
    _checkDisabled();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: double.infinity,
              child: Lottie.asset(widget
                  .exerciseList[widget.position + _modalControllerIndex]
                  .lottieUrl),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FittedBox(
                    child: Text(
                      widget
                          .exerciseList[widget.position + _modalControllerIndex]
                          .name,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    widget.exerciseList[widget.position + _modalControllerIndex]
                        .description,
                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: TextButton(
                      child: Text(
                        'CLOSE',
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.w300),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  )
                ],
              ),
            ),
            Container(
              color: Colors.black,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _prevControllerButtonBuilder(_isPrevDisabled!, _prev),
                  Text(
                    '${widget.position + 1 + _modalControllerIndex}/${widget.length}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                    ),
                  ),
                  _nextControllerButtonBuilder(_isNextDisabled!, _next),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  IconButton _prevControllerButtonBuilder(bool isDisabled, Function prev) {
    return isDisabled
        ? IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.skip_previous,
              color: Colors.grey[700],
            ),
          )
        : IconButton(
            onPressed: () {
              prev();
            },
            icon: Icon(
              Icons.skip_previous,
              color: Colors.white,
            ),
          );
  }

  IconButton _nextControllerButtonBuilder(bool isDisabled, Function next) {
    return isDisabled
        ? IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.skip_next,
              color: Colors.grey[700],
            ),
          )
        : IconButton(
            onPressed: () {
              next();
            },
            icon: Icon(
              Icons.skip_next,
              color: Colors.white,
            ),
          );
  }
}
