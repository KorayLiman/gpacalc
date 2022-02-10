import 'package:flutter/material.dart';
import 'package:gpacalc/constants/app_constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var key0 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                child: Container(
                  child: const Text("Form"),
                  color: Colors.purple,
                ),
              )
            ],
          ),
          Expanded(
            child: Container(
              child: const Text("Form"),
              color: Colors.blue,
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
          _buidTextFormField(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.add)),
              IconButton(onPressed: () {}, icon: Icon(Icons.add)),
              IconButton(onPressed: () {}, icon: Icon(Icons.add)),
            ],
          )
        ],
      ),
      key: key0,
    );
  }

  _buidTextFormField() {
    return TextFormField(
        decoration: InputDecoration(
            hintText: "Math",
            border: OutlineInputBorder(borderRadius: Constants.bRadius),
            filled: true,
            fillColor: Constants.mainColor.shade100.withOpacity(0.2)));
  }
}
