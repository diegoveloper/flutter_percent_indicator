import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class SampleLinearPage extends StatefulWidget {
  @override
  _SampleLinearPageState createState() => _SampleLinearPageState();
}

class _SampleLinearPageState extends State<SampleLinearPage> {
  String state = 'Animation start';
  bool isRunning = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Linear Percent Indicators"),
        actions: [
          IconButton(
              icon: Icon(Icons.stop),
              onPressed: () {
                setState(() {
                  isRunning = false;
                });
              })
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(15.0),
                child: LinearPercentIndicator(
                  width: MediaQuery.of(context).size.width - 50,
                  animation: isRunning,
                  lineHeight: 20.0,
                  animationDuration: 3000,
                  percent: 0.5,
                  animateFromLastPercent: true,
                  center: Text("50.0%"),
                  linearStrokeCap: LinearStrokeCap.butt,
                  progressColor: Colors.red,
                  widgetIndicator: RotatedBox(
                      quarterTurns: 1,
                      child: Icon(Icons.airplanemode_active, size: 50)),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15.0),
                child: FittedBox(
                  child: LinearPercentIndicator(
                    width: 140.0,
                    fillColor: Colors.green,
                    linearGradient: LinearGradient(
                      colors: [Colors.red, Colors.blue],
                    ),
                    lineHeight: 14.0,
                    percent: 0.7,
                    center: Text(
                      "70.0%",
                      style: TextStyle(fontSize: 12.0),
                    ),
                    trailing: Icon(Icons.mood),
                    linearStrokeCap: LinearStrokeCap.roundAll,
                    backgroundColor: Colors.grey,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15.0),
                child: FittedBox(
                  child: LinearPercentIndicator(
                    width: 140.0,
                    fillColor: Colors.green,
                    lineHeight: 14.0,
                    percent: 0.5,
                    center: Text(
                      "50.0%",
                      style: TextStyle(fontSize: 12.0),
                    ),
                    trailing: Icon(Icons.mood),
                    linearStrokeCap: LinearStrokeCap.roundAll,
                    backgroundColor: Colors.grey,
                    progressColor: Colors.blue,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15.0),
                child: LinearPercentIndicator(
                  animation: true,
                  animationDuration: 500,
                  lineHeight: 20.0,
                  leading: Expanded(
                    child: Text("left content"),
                  ),
                  trailing: Expanded(
                      child: Text(
                    "right content",
                    textAlign: TextAlign.end,
                  )),
                  percent: 0.2,
                  center: Text("20.0%"),
                  linearStrokeCap: LinearStrokeCap.butt,
                  progressColor: Colors.red,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15.0),
                child: LinearPercentIndicator(
                  width: MediaQuery.of(context).size.width - 50,
                  animation: true,
                  lineHeight: 20.0,
                  animationDuration: 2000,
                  percent: 0.9,
                  animateFromLastPercent: true,
                  center: Text("90.0%"),
                  linearStrokeCap: LinearStrokeCap.roundAll,
                  progressColor: Colors.greenAccent,
                  maskFilter: MaskFilter.blur(BlurStyle.solid, 3),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15.0),
                child: LinearPercentIndicator(
                  width: MediaQuery.of(context).size.width - 50,
                  animation: true,
                  lineHeight: 20.0,
                  animationDuration: 2500,
                  percent: 0.8,
                  center: Text("80.0%"),
                  linearStrokeCap: LinearStrokeCap.roundAll,
                  progressColor: Colors.green,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15.0),
                child: LinearPercentIndicator(
                  animation: true,
                  lineHeight: 20.0,
                  animationDuration: 2500,
                  percent: 0.55,
                  center: Text("55.0%"),
                  linearStrokeCap: LinearStrokeCap.roundAll,
                  progressColor: Colors.green,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15.0),
                child: Column(
                  children: <Widget>[
                    LinearPercentIndicator(
                      width: 100.0,
                      lineHeight: 8.0,
                      percent: 0.2,
                      progressColor: Colors.red,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    LinearPercentIndicator(
                      width: 100.0,
                      lineHeight: 8.0,
                      percent: 0.5,
                      progressColor: Colors.orange,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    LinearPercentIndicator(
                      width: 100.0,
                      lineHeight: 8.0,
                      percent: 0.9,
                      progressColor: Colors.blue,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    LinearPercentIndicator(
                      width: 100.0,
                      lineHeight: 8.0,
                      percent: 1.0,
                      progressColor: Colors.lightBlueAccent,
                      restartAnimation: true,
                      animation: true,
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: LinearPercentIndicator(
                  lineHeight: 20,
                  center: Text('50%'),
                  progressColor: Colors.blueAccent,
                  percent: .5,
                  animation: true,
                  animationDuration: 5000,
                  onAnimationEnd: () =>
                      setState(() => state = 'End Animation at 50%'),
                ),
              ),
              Text(state),
            ],
          ),
        ),
      ),
    );
  }
}
