import 'package:flutter/material.dart';
import 'package:workout/Screens/About.dart';
import 'package:workout/Screens/RepDetail.dart';
import 'package:workout/Screens/WorkoutDetail.dart';
import 'package:workout/models/workoutData.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List data;
  @override
  void initState() {
    data = (workoutData.toList()..shuffle());
    data = (data.getRange(0, 5).toList());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 25.0, left: 10.0, right: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
          

              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Today\'s',
                      style: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
                          fontSize: 40.0),
                    ),
                    Text(
                      'Workout',
                      style: TextStyle(
                          fontStyle: FontStyle.normal,
                          color: Color(0xffB6B3CC),
                          fontSize: 40.0),
                    ),
                  ],
                ),
                SizedBox(width: 141),
                IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => About()),
              );
            },
            icon: Icon(Icons.info),
            color: Colors.black,
          ),
              ],
            ),
            Divider(
              height: 20.0,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, i) => Container(
                  padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
                  width: double.maxFinite,
                  child: Container(
                      height: 150.0,
                      child: GestureDetector(
                        onTap: () => {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      WorkoutDetail(index: (data[i].sr - 1))))
                        },
                        child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            elevation: 15,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                SizedBox(width: 5),
                                Container(
                                  decoration: BoxDecoration(
                                      color: data[i].colorName,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                  padding: EdgeInsets.all(5.0),
                                  child: Image.asset(
                                    data[i].imageName,
                                    height: 100.0,
                                    width: 100.0,
                                  ),
                                ),
                                SizedBox(width: 20),
                                Flexible(
                                    child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      data[i].name,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.0),
                                    ),
                                    Text(
                                      '${((data[i].rep / 60) % 60).round()} Minutes',
                                      style: TextStyle(
                                          fontSize: 20.0, color: Colors.grey),
                                    )
                                  ],
                                ))
                              ],
                            )),
                      )),
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16.0))),
        backgroundColor: Color(0xff8B78E6),
        child: Icon(
          Icons.fitness_center,
          size: 50.0,
        ),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => RepDetail(data: data)));
        },
      ),
    );
  }
}
