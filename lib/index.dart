import 'package:flutter/material.dart';
import 'package:flutter_calculator/button_widget.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({super.key});

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  String result = "0";
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
    "0",
    "",
    ".",
    "="
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: const Text('Flutter Calculator'),
          centerTitle: true,
        ),
        body: Container(
          child: Column(
            children: [
              Expanded(
                  child: Center(
                child: Text(result),
              )),
              Container(
                child: Center(
                    // child: Row(
                    //   children: [
                    //     ButtonWidget(label: '0', flex: 2),
                    //     ButtonWidget(label: '.'),
                    //     ButtonWidget(
                    //       label: '=',
                    //     )
                    //   ],
                    // ),
                    child: _buidButtons()),
              )
            ],
          ),
        ));
  }

  Widget _buidButtons() {
    List<Widget> rows = [];
    List<Widget> btns = [];
    for (int i = 0; i < buttonKeys.length; i++) {
      String key = buttonKeys[i];
      Widget btn = ButtonWidget(label: key);
      btns.add(btn);
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
}
