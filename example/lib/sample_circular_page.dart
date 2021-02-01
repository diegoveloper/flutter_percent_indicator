import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

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
          padding: const EdgeInsets.symmetric(vertical: 10),
          children: <Widget>[
            CircularPercentIndicator(
              radius: 120.0,
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
              radius: 100.0,
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
              radius: 100.0,
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
                radius: 100.0,
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
                radius: 120.0,
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
              radius: 100.0,
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
              radius: 120.0,
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
                radius: 60.0,
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
                      radius: 45.0,
                      lineWidth: 4.0,
                      percent: 0.10,
                      center: Text("10%"),
                      progressColor: Colors.red,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                    ),
                    CircularPercentIndicator(
                      radius: 45.0,
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
                      radius: 45.0,
                      lineWidth: 4.0,
                      percent: 0.30,
                      center: Text("30%"),
                      progressColor: Colors.orange,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                    ),
                    CircularPercentIndicator(
                      radius: 45.0,
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
                      radius: 45.0,
                      lineWidth: 4.0,
                      percent: 0.90,
                      center: Text("90%"),
                      progressColor: Colors.green,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                    ),
                    CircularPercentIndicator(
                      radius: 45.0,
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
              radius: 80.0,
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
              onAnimationEnd: () => setState(() => state = 'End Animation at 50%'),
            ),
            const SizedBox(height: 20),
            CircularPercentIndicator(
              radius: 80.0,
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
