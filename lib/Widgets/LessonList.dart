import 'package:flutter/material.dart';
import 'package:gpacalc/constants/app_constants.dart';
import 'package:gpacalc/data/datahelper.dart';

class LessonList extends StatelessWidget {
  const LessonList({required this.OnDismiss, Key? key}) : super(key: key);

  final Function OnDismiss;

  @override
  Widget build(BuildContext context) {
    var AllLessons = DataHelper.AllAddedLessons;
    return DataHelper.AllAddedLessons.length > 0
        ? ListView.builder(
            itemCount: DataHelper.AllAddedLessons.length,
            itemBuilder: (context, index) {
              return Dismissible(
                direction: DismissDirection.startToEnd,
                onDismissed: (direct) {
                  OnDismiss(index);
                },
                key: UniqueKey(),
                child: Card(
                  child: ListTile(
                    title: Text(DataHelper.AllAddedLessons[index].name),
                    leading: CircleAvatar(
                      backgroundColor: Constants.mainColor,
                      child: Text(
                        (DataHelper.AllAddedLessons[index].letterValue *
                                DataHelper.AllAddedLessons[index].creditValue)
                            .toStringAsFixed(1),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    subtitle: Text(
                        "${DataHelper.AllAddedLessons[index].creditValue} Credits, LetterValue ${DataHelper.AllAddedLessons[index].letterValue}"),
                  ),
                ),
              );
            })
        : Container(
            alignment: Alignment.center,
            child: const Text(
              "Please Add Lessons",
              style: TextStyle(fontSize: 24),
            ),
          );
  }
}
