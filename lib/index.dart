import 'package:flutter/material.dart';
import 'package:flutter_calculator/button_widget.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({super.key});

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  String result = "0";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: Colors.black,
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
                child: const Center(
                  child: const Row(
                    children: [ButtonWidget(label: '1')],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
