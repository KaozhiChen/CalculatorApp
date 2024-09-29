import 'package:flutter/material.dart';
// import 'package:flutter_calculator/index.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Calculator App',
      home: IndexPage(),
    );
  }
}

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

  // store button keys
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
            'Calculator App',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        body: Column(
          children: [
            // Display area for the result
            Expanded(
                child: SingleChildScrollView(
              reverse: true,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 36, vertical: 10),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    _result,
                    style: const TextStyle(color: Colors.white, fontSize: 48),
                  ),
                ),
              ),
            )),

            // display area for the button
            Center(child: _buidButtons())
          ],
        ));
  }

  // Widget to build buttons
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

    // Solving the floating-point precision issue.
    result = double.parse(result.toStringAsFixed(10));

    // display result in screen
    _result = result.toString();
    _operator = "";
    _isOperatorPressed = false;
  }
}

// ButtonWidget to custom buttons
class ButtonWidget extends StatelessWidget {
  final String label;
  final int flex;
  final Function onClick;
  static const topKeys = ["AC", "+/-", "%"];
  static const rightKeys = ["/", "*", "-", "+", "="];

  const ButtonWidget(
      {required this.label, this.flex = 1, required this.onClick, super.key});

  @override
  Widget build(BuildContext context) {
    // buttons layout
    return Expanded(
      flex: flex,
      child: TextButton(
        onPressed: () => onClick(),
        child: Container(
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
              color: topKeys.contains(label)
                  ? Colors.grey[400]
                  : rightKeys.contains(label)
                      ? Colors.orange
                      : Colors.grey[800],
              borderRadius: flex > 1
                  ? const BorderRadius.all(Radius.circular(1000.0))
                  : null,
              shape: flex > 1 ? BoxShape.rectangle : BoxShape.circle),
          child: Center(
            child: Center(
              child: Text(
                label,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
                softWrap: false,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
