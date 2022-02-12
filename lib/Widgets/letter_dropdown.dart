import 'package:flutter/material.dart';

import '../constants/app_constants.dart';
import '../data/datahelper.dart';

class LetterDropdown extends StatefulWidget {
  const LetterDropdown({Key? key, required this.OnLetterSelected})
      : super(key: key);

  final Function OnLetterSelected;

  @override
  _LetterDropdownState createState() => _LetterDropdownState();
}

class _LetterDropdownState extends State<LetterDropdown> {
  double selectedValue = 4.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: Constants.DrowDownPadding,
      decoration: BoxDecoration(
          color: Constants.mainColor.shade100.withOpacity(0.3),
          borderRadius: Constants.bRadius),
      child: DropdownButton<double>(
        underline: Container(),
        items: DataHelper.AllLettersList(),
        elevation: 16,
        iconEnabledColor: Constants.mainColor.shade200,
        onChanged: (d) {
          setState(() {
            
            selectedValue = d!;
            widget.OnLetterSelected(selectedValue);
          });
        },
        value: selectedValue,
      ),
    );
  }
}
