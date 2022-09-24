import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

void main() {
  runApp(MaterialApp(home: Scaffold(body: SamplePage())));
}

class SamplePage extends StatefulWidget {
  @override
  _SamplePageState createState() => _SamplePageState();
}

class _SamplePageState extends State<SamplePage> {
  void _openPage(Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => page,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MaterialButton(
              color: Colors.blueAccent,
              child: Text("Circular Library"),
              onPressed: () => _openPage(SampleCircularPage()),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
            ),
            MaterialButton(
              color: Colors.blueAccent,
              child: Text("Linear Library"),
              onPressed: () => _openPage(SampleLinearPage()),
            ),
          ],
        ),
      ),
    );
  }
}

class SampleCircularPage extends StatefulWidget {
  @override
  _SampleCircularPageState createState() => _SampleCircularPageState();
}

class _SampleCircularPageState extends State<SampleCircularPage> {
  String state = 'Animation start';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Circular Percent Indicators"),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            CircularPercentIndicator(
              radius: 60.0,
              animation: true,
              animationDuration: 1000,
              lineWidth: 10.0,
              percent: 1.0,
              reverse: false,
              arcType: ArcType.FULL_REVERSED,
              startAngle: 0.0,
              animateFromLastPercent: true,
              circularStrokeCap: CircularStrokeCap.round,
              backgroundColor: Colors.green,
              linearGradient: const LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                tileMode: TileMode.clamp,
                stops: [0.0, 1.0],
                colors: <Color>[
                  Colors.yellow,
                  Colors.red,
                ],
              ),
              widgetIndicator: Center(
                child: Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  padding: const EdgeInsets.all(5),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
              ),
              arcBackgroundColor: Colors.grey,
            ),
            CircularPercentIndicator(
              radius: 60.0,
              animation: true,
              animationDuration: 1000,
              lineWidth: 10.0,
              percent: 0.9,
              reverse: false,
              arcType: ArcType.FULL,
              startAngle: 0.0,
              animateFromLastPercent: true,
              circularStrokeCap: CircularStrokeCap.round,
              backgroundColor: Colors.green,
              linearGradient: const LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                tileMode: TileMode.clamp,
                stops: [0.0, 1.0],
                colors: <Color>[
                  Colors.yellow,
                  Colors.red,
                ],
              ),
              widgetIndicator: Center(
                child: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  padding: const EdgeInsets.all(5),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
              ),
              arcBackgroundColor: Colors.grey,
            ),
            CircularPercentIndicator(
              radius: 60.0,
              lineWidth: 13.0,
              animation: true,
              animationDuration: 3000,
              percent: 0.7,
              animateFromLastPercent: true,
              center: Text(
                "70.0%",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
              footer: Text(
                "Sales this week",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
              ),
              circularStrokeCap: CircularStrokeCap.round,
              progressColor: Colors.purple,
              widgetIndicator: RotatedBox(
                quarterTurns: 1,
                child: Icon(Icons.airplanemode_active, size: 30),
              ),
            ),
            CircularPercentIndicator(
              radius: 50.0,
              lineWidth: 10.0,
              percent: 0.5,
              center: Text("50%"),
              circularStrokeCap: CircularStrokeCap.round,
              backgroundColor: Colors.grey,
              maskFilter: MaskFilter.blur(BlurStyle.solid, 3),
              linearGradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.orange, Colors.yellow],
              ),
            ),
            CircularPercentIndicator(
              radius: 50.0,
              lineWidth: 10.0,
              percent: 0.8,
              header: Text("Icon header"),
              center: Icon(
                Icons.person_pin,
                size: 50.0,
                color: Colors.blue,
              ),
              reverse: true,
              backgroundColor: Colors.grey,
              progressColor: Colors.blue,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              CircularPercentIndicator(
                radius: 50.0,
                animation: true,
                animationDuration: 2000,
                lineWidth: 10.0,
                percent: 0.5,
                arcBackgroundColor: Colors.orangeAccent,
                arcType: ArcType.HALF,
                center: Text(
                  "40 hours",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
                ),
                circularStrokeCap: CircularStrokeCap.butt,
                backgroundColor: Colors.transparent,
                progressColor: Colors.red,
              ),
              CircularPercentIndicator(
                radius: 60.0,
                animation: true,
                animationDuration: 2000,
                lineWidth: 10.0,
                percent: 0.5,
                reverse: true,
                arcBackgroundColor: Colors.teal,
                arcType: ArcType.FULL,
                center: Text(
                  "20 hours",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
                ),
                circularStrokeCap: CircularStrokeCap.butt,
                backgroundColor: Colors.yellow,
                progressColor: Colors.red,
              ),
            ]),
            CircularPercentIndicator(
              radius: 50.0,
              animation: true,
              animationDuration: 2000,
              lineWidth: 10.0,
              percent: 0.5,
              startAngle: 90,
              center: Text(
                "Start angle 250",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
              ),
              circularStrokeCap: CircularStrokeCap.butt,
              backgroundColor: Colors.grey,
              progressColor: Colors.red,
            ),
            CircularPercentIndicator(
              radius: 60.0,
              lineWidth: 13.0,
              animation: true,
              animationDuration: 3000,
              percent: 0.7,
              animateFromLastPercent: true,
              center: Text(
                "70.0%",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
              footer: Text(
                "Sales this week",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
              ),
              circularStrokeCap: CircularStrokeCap.round,
              progressColor: Colors.purple,
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: CircularPercentIndicator(
                radius: 30.0,
                lineWidth: 5.0,
                percent: 1.0,
                center: Text("100%"),
                progressColor: Colors.green,
              ),
            ),
            Container(
              padding: EdgeInsets.all(15.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularPercentIndicator(
                      radius: 22.0,
                      lineWidth: 4.0,
                      percent: 0.10,
                      center: Text("10%"),
                      progressColor: Colors.red,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                    ),
                    CircularPercentIndicator(
                      radius: 22.0,
                      lineWidth: 4.0,
                      backgroundWidth: 1.0,
                      percent: 0.2,
                      animation: true,
                      center: Text("20%"),
                      progressColor: Colors.orangeAccent,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                    ),
                    CircularPercentIndicator(
                      radius: 22.0,
                      lineWidth: 4.0,
                      percent: 0.30,
                      center: Text("30%"),
                      progressColor: Colors.orange,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                    ),
                    CircularPercentIndicator(
                      radius: 22.0,
                      lineWidth: 4.0,
                      backgroundWidth: 8,
                      animation: true,
                      animationDuration: 200,
                      percent: 0.60,
                      center: Text("60%"),
                      progressColor: Colors.yellow,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                    ),
                    CircularPercentIndicator(
                      radius: 22.0,
                      lineWidth: 4.0,
                      percent: 0.90,
                      center: Text("90%"),
                      progressColor: Colors.green,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                    ),
                    CircularPercentIndicator(
                      radius: 22.0,
                      lineWidth: 4.0,
                      percent: 1.0,
                      animation: true,
                      restartAnimation: true,
                      center: CircleAvatar(
                        child: Icon(Icons.person),
                      ),
                      progressColor: Colors.redAccent,
                    ),
                  ],
                ),
              ),
            ),
            CircularPercentIndicator(
              radius: 40.0,
              lineWidth: 5.0,
              animation: true,
              percent: .5,
              animationDuration: 2500,
              animateFromLastPercent: true,
              center: Text(
                "50.0%",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
              footer: Text(
                state,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
              ),
              circularStrokeCap: CircularStrokeCap.round,
              progressColor: Colors.blueAccent,
              onAnimationEnd: () =>
                  setState(() => state = 'End Animation at 50%'),
            ),
            const SizedBox(height: 20),
            CircularPercentIndicator(
              radius: 40.0,
              backgroundColor: Colors.white,
              percent: .7,
              lineWidth: 10,
              backgroundWidth: 15,
              fillColor: Colors.transparent,
              circularStrokeCap: CircularStrokeCap.round,
              arcBackgroundColor: Colors.transparent,
              arcType: ArcType.HALF,
            ),
          ],
        ),
      ),
    );
  }
}

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
                  progressColor: Colors.red,
                  widgetIndicator: RotatedBox(
                      quarterTurns: 1,
                      child: Icon(Icons.airplanemode_active, size: 50)),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15.0),
                child: LinearPercentIndicator(
                  width: MediaQuery.of(context).size.width - 50,
                  lineHeight: 20.0,
                  animationDuration: 3000,
                  percent: 0.5,
                  animateFromLastPercent: true,
                  center: Text("50.0%"),
                  linearGradient: LinearGradient(
                    colors: <Color>[Color(0xffB07BE6), Color(0xff5BA2E0)],
                  ),
                  linearGradientBackgroundColor: LinearGradient(
                    colors: <Color>[Color(0xffe5d6fa), Color(0xffc8dff8)],
                  ),
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
                    barRadius: Radius.circular(7),
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
                    barRadius: Radius.circular(7),
                    backgroundColor: Colors.grey,
                    progressColor: Colors.blue,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15.0),
                child: FittedBox(
                  child: LinearPercentIndicator(
                    width: 140.0,
                    lineHeight: 40.0,
                    percent: 0.05,
                    center: Text(
                      "5.0%",
                      style: TextStyle(fontSize: 12.0),
                    ),
                    barRadius: Radius.circular(20),
                    backgroundColor: Colors.grey,
                    progressColor: Colors.red,
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
                  isRTL: true,
                  barRadius: Radius.elliptical(5, 15),
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
                  barRadius: Radius.circular(5),
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
                  barRadius: Radius.circular(3),
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
              Padding(
                padding: EdgeInsets.all(15),
                child: LinearPercentIndicator(
                  lineHeight: 20,
                  center: Text('50%'),
                  progressColor: Colors.pinkAccent,
                  barRadius: Radius.circular(10),
                  percent: .5,
                  animation: true,
                  animationDuration: 1000,
                ),
              ),
              Text('Rounded Edges'),
              Padding(
                padding: EdgeInsets.all(15),
                child: LinearPercentIndicator(
                  lineHeight: 20,
                  center: Text('60%'),
                  progressColor: Colors.purple,
                  barRadius: Radius.circular(5),
                  percent: .6,
                  animation: true,
                  animationDuration: 1200,
                ),
              ),
              Text('Soft Corner Edges'),
              Padding(
                padding: EdgeInsets.all(15),
                child: LinearPercentIndicator(
                  lineHeight: 20,
                  center: Text('70%'),
                  progressColor: Colors.deepPurple,
                  barRadius: Radius.elliptical(5, 10),
                  percent: .7,
                  animation: true,
                  animationDuration: 1400,
                ),
              ),
              Text('Custom Edges'),
            ],
          ),
        ),
      ),
    );
  }
}
