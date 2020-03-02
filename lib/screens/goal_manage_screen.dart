import 'package:flutter/material.dart';

class GoalManageScreen extends StatelessWidget {
  static const routeName = '/manage-goal';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Create Goal'),
          backgroundColor: Color(0xff2d3436),
        ),
        body: Container(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(
                      hintText: 'Name of wat you want to achieve/to do', fillColor: Colors.white, focusColor: Colors.white),
                      style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          color: Color(0xff2d3436),
        ),
        backgroundColor: Color(0xff2d3436));
  }
}
