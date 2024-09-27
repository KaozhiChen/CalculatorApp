import 'package:flutter/material.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({super.key});

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  String Result = "0";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Flutter Calculator'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16),
              alignment: Alignment.bottomRight,
              child: Text(
                Result,
                style: const TextStyle(color: Colors.white, fontSize: 60),
              ),
            ),
          ),
          GridView.count(
            crossAxisCount: 4, // 4 buttons per row
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.all(16),
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            children: [
              TextButton(onPressed: () {}, child: const Text("7")),
              TextButton(onPressed: () {}, child: const Text("8")),
              TextButton(onPressed: () {}, child: const Text("9")),
              TextButton(onPressed: () {}, child: const Text("/")),
              TextButton(onPressed: () {}, child: const Text("4")),
              TextButton(onPressed: () {}, child: const Text("5")),
              TextButton(onPressed: () {}, child: const Text("6")),
              TextButton(onPressed: () {}, child: const Text("*")),
              TextButton(onPressed: () {}, child: const Text("1")),
              TextButton(onPressed: () {}, child: const Text("2")),
              TextButton(onPressed: () {}, child: const Text("3")),
              TextButton(onPressed: () {}, child: const Text("-")),
              TextButton(onPressed: () {}, child: const Text("0")),
              TextButton(onPressed: () {}, child: const Text(".")),
              TextButton(onPressed: () {}, child: const Text("=")),
              TextButton(onPressed: () {}, child: const Text("+")),
            ],
          )
        ],
      ),
      // backgroundColor: Colors.black,
    );
  }
}
