import 'package:flutter/material.dart';

class IndexPage extends StatelessWidget {
  const IndexPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Calculator'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const Expanded(child: Center(child: Text('Results'))),
          Container(
              color: Colors.blue, child: const Center(child: Text('Numbers')))
        ],
      ),
    );
  }
}
