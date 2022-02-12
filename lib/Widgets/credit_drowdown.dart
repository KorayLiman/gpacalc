import 'package:flutter/material.dart';

import '../constants/app_constants.dart';
import '../data/datahelper.dart';

class CreditDropdown extends StatefulWidget {
  const CreditDropdown({Key? key, required this.OnCreditSelected})
      : super(key: key);
  final Function OnCreditSelected;
  @override
  _CreditDropdownState createState() => _CreditDropdownState();
}

class _CreditDropdownState extends State<CreditDropdown> {
  double selectedCreditValue = 1;

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
        items: DataHelper.allCreditsOfLessons(),
        elevation: 16,
        iconEnabledColor: Constants.mainColor.shade200,
        onChanged: (d) {
          setState(() {
            selectedCreditValue = d!;
            widget.OnCreditSelected(d);
          });
        },
        value: selectedCreditValue,
      ),
    );
  }
}
