import 'package:flutter/material.dart';
import 'package:workout/Screens/StartWorkout.dart';

class RepDetail extends StatefulWidget {
  List data;
  RepDetail({Key key, this.data}) : super(key: key);
  _RepDetailState createState() => _RepDetailState(data);
}

class _RepDetailState extends State<RepDetail> {
  List data;
  _RepDetailState(this.data);
  final repController = TextEditingController();
  String reps;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff8B78E6),
        title: Text('Set Reps'),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(20.0),
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: repController,
                  decoration: InputDecoration(
                      icon: Icon(Icons.repeat),
                      labelText: "Number of reps ",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 20.0),
                child: SizedBox(
                  width: 200.0,
                  child: RaisedButton(
                      onPressed: () {
                        reps = repController.text;
                        if (reps != '' && int.parse(reps) != 0) {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => StartWorkout(
                                      data: data, reps: int.parse(reps))));
                        } else {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Error'),
                                  content: Text("Enter number of reps"),
                                  actions: <Widget>[
                                    FlatButton(
                                      child: Text(
                                        'OK',
                                      ),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    )
                                  ],
                                );
                              });
                        }
                      },
                      child: Text(
                        'Start Workout',
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                      ),
                      color: Color(0xff8B78E6)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
