import 'package:flutter/material.dart';
import 'dart:async';

class StartWorkout extends StatefulWidget {
  List data;
  int reps;
  StartWorkout({Key key, this.data, this.reps}) : super(key: key);
  _StartWorkoutState createState() => _StartWorkoutState(data, reps);
}

class _StartWorkoutState extends State<StartWorkout>
    with TickerProviderStateMixin {
  Timer _timer;
  int _start;
  List data;
  int reps;
  int repsCouter = 1;
  int workoutIndex = 0;
  _StartWorkoutState(this.data, this.reps);

  bool isBreak = false;
  String trackAudio1 = "track1.mp3";
  String trackAudio2 = "track2.mp3";
  
  int levelClock;
  AnimationController _controller;
  // void _incrementCounter() {
  //   if (mounted) {
  //     setState(() {
  //       _counter++;
  //     });
  //   }
  // }

  void startTimer(index) {
    clock();
    _start = index - 2;
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          if (_start < 1) {
            timer.cancel();
            setBreak();
          } else {
            _start = _start - 1;
          }
        },
      ),
    );
  }

  void startBreak(index) {
    _start = index;
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          if (_start < 1) {
            timer.cancel();
          } else {
            _start = _start - 1;
          }
        },
      ),
    );
  }

  void setBreak() {
    startBreak(40);
    isBreak = !isBreak;
    Future.delayed(const Duration(milliseconds: 40000), () {
      setState(() {
        isBreak = !isBreak;
      });
      if (workoutIndex < data.length - 1) {
        // print(workoutIndex);
        // print(data.length);
        setState(() {
          workoutIndex = workoutIndex + 1;
        });
        startTimer(data[workoutIndex].rep);
      } else {
        setState(() {
          repsCouter = repsCouter + 1;
        });
        if (repsCouter <= reps) {
          setState(() {
            workoutIndex = 0;
            startTimer(data[workoutIndex].rep);
          });
        } else {
          Navigator.of(context).pop();
        }
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
    _controller.dispose();
  }

  clock() {
    levelClock = data[workoutIndex].rep;
    _controller = AnimationController(
        vsync: this, duration: Duration(seconds: levelClock));
    _controller.forward();
  }

  @override
  void initState() {
    super.initState();
    startTimer(data[workoutIndex].rep);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: isBreak
            ? Container(
                margin: EdgeInsets.only(top: 30.0, left: 10.0, right: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Center(
                        child: Text(
                      'Take a rest...',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 40.0),
                    )),
                    SizedBox(
                      height: 20.0,
                    ),
                    Center(
                      child: Text(
                        '$_start',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 40.0,
                            color: Color(0xffFF3E4D)),
                      ),
                    )
                  ],
                ))
            : Container(
                margin: EdgeInsets.only(top: 30.0, left: 10.0, right: 10.0),
                child: Column(
                  children: <Widget>[
                    Flexible(
                      child: Text(
                        data[workoutIndex].name,
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 35.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      margin:
                          EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
                      decoration: BoxDecoration(
                          color: data[workoutIndex].colorName,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      padding: EdgeInsets.all(5.0),
                      child: Image.asset(
                        data[workoutIndex].imageName,
                        height: 200.0,
                        width: 200.0,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Countdown(
                      animation: StepTween(
                        begin: levelClock, // THIS IS A USER ENTERED NUMBER
                        end: 0,
                      ).animate(_controller),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      "Exercise No: ${workoutIndex + 1}",
                      style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.normal,
                          color: Colors.grey),
                    ),
                    SizedBox(height: 10.0),
                    Flexible(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Total set: ${reps}",
                            style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.normal,
                                color: Colors.grey),
                          ),
                          Text(
                            "Current set: ${repsCouter}",
                            style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.normal,
                                color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30.0),
                    workoutIndex < data.length - 1
                        ? Text(
                            "Next : ${data[workoutIndex + 1].name}",
                            style:
                                TextStyle(fontSize: 20.0, color: Colors.grey),
                          )
                        : Text('')
                  ],
                ),
              ));
  }
}

class Countdown extends AnimatedWidget {
  Countdown({Key key, this.animation}) : super(key: key, listenable: animation);
  Animation<int> animation;

  @override
  build(BuildContext context) {
    Duration clockTimer = Duration(seconds: animation.value);

    String timerText =
        '${clockTimer.inMinutes.remainder(60).toString()}:${clockTimer.inSeconds.remainder(60).toString().padLeft(2, '0')}';

    // print('animation.value  ${animation.value} ');
    // print('inMinutes ${clockTimer.inMinutes.toString()}');
    // print('inSeconds ${clockTimer.inSeconds.toString()}');
    // print('inSeconds.remainder ${clockTimer.inSeconds.remainder(60).toString()}');

    return Text(
      "$timerText",
      style: TextStyle(
        fontSize: 40,
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}
