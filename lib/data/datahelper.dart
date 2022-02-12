import 'package:flutter/material.dart';
import 'package:gpacalc/modals/lesson.dart';

class DataHelper {
  static List<String> _AllLetters() {
    return ["AA", "BA", "BB", "CB", "CC", "DC", "DD", "FD", "FF"];
  }

  static double convertLetterToNote(String Letter) {
    switch (Letter) {
      case "AA":
        return 4.0;
      case "BA":
        return 3.5;
      case "BB":
        return 3.0;
      case "CB":
        return 2.5;
      case "CC":
        return 2.0;
      case "DC":
        return 1.5;
      case "DD":
        return 1.0;
      case "FD":
        return 0.5;
      case "FF":
        return 0.0;
      default:
        return 1.0;
    }
  }

  static List<DropdownMenuItem<double>> AllLettersList() {
    return _AllLetters()
        .map((e) => DropdownMenuItem(
              child: Text(e),
              value: convertLetterToNote(e),
            ))
        .toList();
  }

  static List<int> _allCredits() {
    return List.generate(10, (index) => index + 1).toList();
  }

  static List<DropdownMenuItem<double>> allCreditsOfLessons() {
    return _allCredits()
        .map((e) => DropdownMenuItem(
              child: Text(e.toString()),
              value: e.toDouble(),
            ))
        .toList();
  }

  static AddLesson(Lesson Less) {
    AllAddedLessons.add(Less);
  }

  static List<Lesson> AllAddedLessons = [];

  static double CalculateAverage() {
    double TotalNote = 0, TotalCredits = 0;
    AllAddedLessons.forEach((element) {
      TotalNote += (element.creditValue * element.letterValue);
      TotalCredits += element.creditValue;
    });
    return TotalNote / TotalCredits;
  }
}
