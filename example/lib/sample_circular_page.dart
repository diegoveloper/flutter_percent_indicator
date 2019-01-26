import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class SampleCircularPage extends StatefulWidget {
  @override
  _SampleCircularPageState createState() => _SampleCircularPageState();
}

class _SampleCircularPageState extends State<SampleCircularPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Circular Percent Indicators"),
      ),
      body: Center(
        child: ListView(children: <Widget>[
          new CircularPercentIndicator(
            radius: 100.0,
            lineWidth: 10.0,
            percent: 0.8,
            header: new Text("Icon header"),
            center: new Icon(
              Icons.person_pin,
              size: 50.0,
              color: Colors.blue,
            ),
            backgroundColor: Colors.grey,
            progressColor: Colors.blue,
          ),
          new CircularPercentIndicator(
            radius: 130.0,
            animation: true,
            animationDuration: 2000,
            lineWidth: 15.0,
            startAngle: 45.0,
            percent: 0.6,
            center: new Text(
              "40 hours",
              style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
            circularStrokeCap: CircularStrokeCap.butt,
            backgroundColor: Colors.yellow,
            progressColor: Colors.red,
          ),
          new CircularPercentIndicator(
            radius: 120.0,
            lineWidth: 13.0,
            animation: true,
            percent: 0.7,
            animateFromLastPercent: true,
            center: new Text(
              "70.0%",
              style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
            footer: new Text(
              "Sales this week",
              style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
            ),
            circularStrokeCap: CircularStrokeCap.round,
            progressColor: Colors.purple,
          ),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: new CircularPercentIndicator(
              radius: 60.0,
              lineWidth: 5.0,
              percent: 1.0,
              center: new Text("100%"),
              progressColor: Colors.green,
            ),
          ),
          Container(
            padding: EdgeInsets.all(15.0),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new CircularPercentIndicator(
                  radius: 45.0,
                  lineWidth: 4.0,
                  percent: 0.10,
                  center: new Text("10%"),
                  progressColor: Colors.red,
                ),
                new Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                ),
                new CircularPercentIndicator(
                  radius: 45.0,
                  lineWidth: 4.0,
                  percent: 0.30,
                  center: new Text("30%"),
                  progressColor: Colors.orange,
                ),
                new Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                ),
                new CircularPercentIndicator(
                  radius: 45.0,
                  lineWidth: 4.0,
                  animation: true,
                  animationDuration: 200,
                  percent: 0.30,
                  center: new Text("60%"),
                  progressColor: Colors.yellow,
                ),
                new Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                ),
                new CircularPercentIndicator(
                  radius: 45.0,
                  lineWidth: 4.0,
                  percent: 0.90,
                  center: new Text("90%"),
                  progressColor: Colors.green,
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
