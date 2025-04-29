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
      appBar: AppBar(
        title: Text(
          "Stopwatch",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.black),
        child: Column(
          children: [
            // Stopwatch Place
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    hours.toString().padLeft(2, '0'),
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    ":",
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    minutes.toString().padLeft(2, '0'),
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    ":",
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    seconds.toString().padLeft(2, '0'),
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    ":",
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    milliseconds.toString().padLeft(3, '0'),
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            // Control Buttons Place
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FloatingActionButton.extended(
                    label: Text(
                      "Play",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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
                    icon: Icon(Icons.play_arrow_outlined, size: 40),
                  ),
                  FloatingActionButton.extended(
                    label: Text(
                      "Pause",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        _timer?.cancel();
                      });
                    },
                    icon: Icon(Icons.pause, size: 40),
                  ),
                  FloatingActionButton.extended(
                    label: Text(
                      "Reset",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        milliseconds = 0;
                        seconds = 0;
                        minutes = 0;
                        hours = 0;
                      });
                    },
                    icon: Icon(Icons.restart_alt, size: 40),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
