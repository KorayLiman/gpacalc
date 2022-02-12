import 'package:flutter/material.dart';
import 'package:gpacalc/constants/app_constants.dart';

class ShowAverage extends StatelessWidget {
  const ShowAverage(
      {required this.Average, required this.LessonCount, Key? key})
      : super(key: key);

  final double Average;
  final int LessonCount;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          LessonCount > 0 ? "$LessonCount Many Lessons" : "Choose Lessons",
          style: Constants.LessonCountStyle,
        ),
        Text(
          Average > 0 ? "${Average.toStringAsFixed(2)}" : "0.0",
          style: Constants.AverageStyle,
        ),
        Text(
          "Average",
          style: Constants.LessonCountStyle,
        ),
      ],
    );
  }
}
