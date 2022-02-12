import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:gpacalc/Widgets/LessonList.dart';
import 'package:gpacalc/Widgets/credit_drowdown.dart';
import 'package:gpacalc/Widgets/letter_dropdown.dart';
import 'package:gpacalc/Widgets/showAverage.dart';
import 'package:gpacalc/constants/app_constants.dart';
import 'package:gpacalc/data/datahelper.dart';
import 'package:gpacalc/modals/lesson.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var key0 = GlobalKey<FormState>();

  double selectedLetterValue = 4;
  double selectedCreditValue = 1;
  String Lesson1 = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Center(
            child: Text(
              "GPA Calculator",
              style: Constants.HeaderStyle,
              textAlign: TextAlign.center,
            ),
          )),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                flex: 2,
                child: _buildForm(),
              ),
              Expanded(
                flex: 1,
                child: ShowAverage(
                    Average: DataHelper.CalculateAverage(),
                    LessonCount: DataHelper.AllAddedLessons.length),
              )
            ],
          ),
          Expanded(
            child: LessonList(
              OnDismiss: (index) {
                DataHelper.AllAddedLessons.removeAt(index);
                setState(() {});
              },
            ),
          )
        ],
      ),
    );
  }

  _buildForm() {
    return Form(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: _buidTextFormField(),
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                  child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: LetterDropdown(
                  OnLetterSelected: (letter) {
                    selectedLetterValue = letter;
                  },
                ),
              )),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: CreditDropdown(OnCreditSelected: (credit) {
                    selectedCreditValue = credit;
                  }),
                ),
              ),
              IconButton(
                  onPressed: () {
                    if (key0.currentState!.validate()) {
                      key0.currentState!.save();
                      var lessonToBeAdded = Lesson(
                          Lesson1, selectedLetterValue, selectedCreditValue);
                      DataHelper.AddLesson(lessonToBeAdded);
                      setState(() {});
                      ;
                    }
                  },
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    color: Constants.mainColor,
                  )),
            ],
          ),
          SizedBox(
            height: 10,
          )
        ],
      ),
      key: key0,
    );
  }

  _buidTextFormField() {
    return TextFormField(
        onSaved: (value) {
          setState(() {
            Lesson1 = value!;
          });
        },
        validator: (val) {
          if (val!.length <= 0) {
            return "Enter Lesson Name";
          } else {
            return null;
          }
        },
        decoration: InputDecoration(
            hintText: "Math",
            border: OutlineInputBorder(
                borderRadius: Constants.bRadius, borderSide: BorderSide.none),
            filled: true,
            fillColor: Constants.mainColor.shade100.withOpacity(0.2)));
  }
}
