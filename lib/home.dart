import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Stopwatch")),
      body: Column(
        children: [
          // Stopwatch Place
          Expanded(flex: 2, child: Row()),
          // Control Buttons Place
          Expanded(
            flex: 2,
            child: Row(
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Icon(Icons.play_arrow_outlined),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Icon(Icons.stop_circle_sharp),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Icon(Icons.restart_alt),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
