import 'package:flutter/material.dart';
import 'dart:async';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int milliseconds = 0;
  int seconds = 0;
  int minutes = 0;
  int hours = 0;
  Timer? _timer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Stopwatch")),
      body: Column(
        children: [
          // Stopwatch Place
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Text(
                    hours.toString().padLeft(2, '0'),
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 10),
                  Text(
                    ":",
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 10),
                  Text(
                    minutes.toString().padLeft(2, '0'),
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 10),
                  Text(
                    ":",
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 10),
                  Text(
                    seconds.toString().padLeft(2, '0'),
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 10),
                  Text(
                    ":",
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 10),
                  Text(
                    milliseconds.toString().padLeft(3, '0'),
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          // Control Buttons Place
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FloatingActionButton(
                    onPressed: () {
                      if (_timer == null || _timer?.isActive != true) {
                        _timer = Timer.periodic(Duration(milliseconds: 1), (
                          Timer timer,
                        ) {
                          setState(() {
                            milliseconds++;
                            if (milliseconds == 1000) {
                              seconds++;
                              milliseconds = 0;
                            }
                            if (seconds == 60) {
                              minutes++;
                              seconds = 0;
                            }
                            if (minutes == 60) {
                              hours++;
                              minutes = 0;
                            }
                          });
                        });
                      }
                    },
                    child: Icon(Icons.play_arrow_outlined, size: 40),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      setState(() {
                        _timer?.cancel();
                      });
                    },
                    child: Icon(Icons.pause, size: 40),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      setState(() {
                        milliseconds = 0;
                        seconds = 0;
                        minutes = 0;
                        hours = 0;
                      });
                    },
                    child: Icon(Icons.restart_alt, size: 40),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
