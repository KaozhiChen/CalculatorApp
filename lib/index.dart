import 'package:flutter/material.dart';
import 'package:flutter_calculator/button_widget.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({super.key});

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  String _result = "0";
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

  void _onButtonClick(String key) {
    setState(() {
      if (key == "AC") {
        _result = "0";
      } else {
        if (_result == "0") {
          _result = key;
        } else {
          _result += key;
        }
      }
    });
  }
}
