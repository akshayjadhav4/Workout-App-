import 'package:flutter/material.dart';
import 'package:workout/models/workoutData.dart';

class WorkoutDetail extends StatefulWidget {
  int index;
  WorkoutDetail({Key key, this.index}) : super(key: key);
  @override
  _WorkoutDetailState createState() => _WorkoutDetailState(index);
}

class _WorkoutDetailState extends State<WorkoutDetail> {
  int index;
  _WorkoutDetailState(this.index);

  List data = workoutData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            margin: EdgeInsets.only(top: 35.0, left: 10.0, right: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  workoutData[index].name,
                  style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: data[index].colorName,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  padding: EdgeInsets.all(5.0),
                  child: Image.asset(
                    data[index].imageName,
                    height: 300.0,
                    width: 300.0,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  'Duration: ${((data[index].rep / 60) % 60).round()} Minutes',
                  style: TextStyle(fontSize: 20.0, color: Colors.grey),
                ),
                Text(
                  data[index].information,
                  textAlign: TextAlign.justify,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
