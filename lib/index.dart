import 'package:flutter/material.dart';
import 'package:flutter_calculator/button_widget.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({super.key});

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  String _result = "0";
  double _firstOperand = 0; //first number before operator
  String _operator = ""; // operator
  double _secondOperand = 0; //first number before operator
  bool _isOperatorPressed = false;

  static const buttonKeys = [
    "AC",
    "+/-",
    "%",
    "/",
    "7",
    "8",
    "9",
    "*",
    "4",
    "5",
    "6",
    "-",
    "1",
    "2",
    "3",
    "+",
    "",
    "0",
    ".",
    "="
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: const Text(
            'Flutter Calculator',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        body: Column(
          children: [
            Expanded(
                child: SingleChildScrollView(
              reverse: true,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 36, vertical: 10),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    "$_result",
                    style: const TextStyle(color: Colors.white, fontSize: 48),
                  ),
                ),
              ),
            )),
            Center(child: _buidButtons())
          ],
        ));
  }

  Widget _buidButtons() {
    List<Widget> rows = [];
    List<Widget> btns = [];
    int flex = 1;
    for (int i = 0; i < buttonKeys.length; i++) {
      String key = buttonKeys[i];
      if (key.isEmpty) {
        flex++;
        continue;
      } else {
        Widget btn = ButtonWidget(
          label: key,
          flex: flex,
          onClick: () => _onButtonClick(key),
        );
        btns.add(btn);
        flex = 1;
      }

      if ((i + 1) % 4 == 0) {
        rows.add(Row(
          children: btns,
        ));
        btns = [];
      }
    }
    if (btns.isNotEmpty) {
      rows.add(Row(
        children: btns,
      ));
      btns = [];
    }

    return Column(
      children: rows,
    );
  }

  // function to handle button clicks
  void _onButtonClick(String key) {
    setState(() {
      if (key == "AC") {
        //reset everyting to 0 or "" or false
        _result = "0";
        _firstOperand = 0;
        _operator = "";
        _secondOperand = 0;
        _isOperatorPressed = false;
      } else if (key == "+" || key == "-" || key == "*" || key == "/") {
        // press + - * /
        _operator = key;
        //string to double
        _firstOperand = double.tryParse(_result) ?? 0;
        _isOperatorPressed = true;
      } else if (key == "=") {
        //perform calculations
        //string to double
        _secondOperand = double.tryParse(_result) ?? 0;
        _calculate();
      } else if (key == "%") {
        _firstOperand = double.tryParse(_result) ?? 0;
        _result = (_firstOperand / 100).toString();
      } else if (key == ".") {
        // Only allow input "." one time
        if (!_result.contains(".")) {
          _result += ".";
        }
      } else {
        if (_isOperatorPressed) {
          // display second num if pressed operator
          _result = key;
          _isOperatorPressed = false;
        } else {
          if (_result == "0") {
            _result = key;
          } else {
            _result += key;
          }
        }
      }
    });
  }

  //function to calculate results
  void _calculate() {
    double result = 0;
    if (_operator == "+") {
      result = _firstOperand + _secondOperand;
    } else if (_operator == "-") {
      result = _firstOperand - _secondOperand;
    } else if (_operator == "*") {
      result = _firstOperand * _secondOperand;
    } else if (_operator == "/") {
      // the divisor cannot be 0
      if (_secondOperand != 0) {
        result = _firstOperand / _secondOperand;
      } else {
        _result = "0";
        return;
      }
    }
    // display result in screen
    _result = result.toString();
    _operator = "";
    _isOperatorPressed = false;
  }
}
