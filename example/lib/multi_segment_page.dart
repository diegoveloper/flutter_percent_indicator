import 'package:flutter/material.dart';
import 'package:percent_indicator/flutter_percent_indicator.dart';

class MultiSegmentPage extends StatefulWidget {
  @override
  _MultiSegmentPageState createState() => _MultiSegmentPageState();
}

class _MultiSegmentPageState extends State<MultiSegmentPage> {
  double firstSegment = 0.3;
  double secondSegment = 0.4;
  double thirdSegment = 0.3;

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        secondSegment = 0.5;
        thirdSegment = 0.2;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Multi Segment Progress'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MultiSegmentLinearIndicator(
                width: MediaQuery.of(context).size.width - 64,
                lineHeight: 30.0,
                firstSegmentPercent: 0.25,
                secondSegmentPercent: 0.4,
                thirdSegmentPercent: 0.35,
                firstSegmentColor: Color(0xFF4285F4),
                secondSegmentColor: Color(0xFF6DD5F6),
                thirdSegmentColor: Color(0xFFEFEFEF),
                enableStripes: [1],
                barRadius: Radius.circular(10.0),
                animation: true,
                animationDuration: 1000,
                curve: Curves.easeInOut,
                animateFromLastPercent: true,
                onAnimationEnd: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Animation completed!'),
                      duration: Duration(seconds: 1),
                    ),
                  );
                },
              ),
              SizedBox(height: 10),
              Text(
                'Static with easeInOut: 25% - 40% - 35%',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 30),
              MultiSegmentLinearIndicator(
                width: MediaQuery.of(context).size.width - 40,
                lineHeight: 20.0,
                firstSegmentPercent: 0.3,
                secondSegmentPercent: 0.4,
                thirdSegmentPercent: 0.3,
                firstSegmentColor: Color(0xFFBA0521),
                secondSegmentColor: Color(0xFF071437),
                thirdSegmentColor: Color(0xFFFF9205),
                enableStripes: [2],
                barRadius: Radius.circular(20),
              ),
              SizedBox(height: 10),
              Text(
                'Static: 30% - 40% - 30%',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 30),
              MultiSegmentLinearIndicator(
                width: MediaQuery.of(context).size.width - 40,
                lineHeight: 20.0,
                firstSegmentPercent: firstSegment,
                secondSegmentPercent: secondSegment,
                thirdSegmentPercent: thirdSegment,
                firstSegmentColor: Colors.green,
                secondSegmentColor: Colors.blue,
                thirdSegmentColor: Colors.orange,
                enableStripes: [1, 3],
                animation: true,
                animateFromLastPercent: true,
                animationDuration: 1000,
                curve: Curves.easeInOut,
                barRadius: Radius.circular(10),
              ),
              SizedBox(height: 10),
              Text(
                'Progress: ${(firstSegment * 100).toInt()}% - ${(secondSegment * 100).toInt()}% - ${(thirdSegment * 100).toInt()}%',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 30),
              MultiSegmentLinearIndicator(
                width: MediaQuery.of(context).size.width - 64,
                lineHeight: 30.0,
                firstSegmentPercent: 0.15,
                secondSegmentPercent: 0.4,
                thirdSegmentPercent: 0.45,
                firstSegmentColor: Color(0xFFBA0521),
                secondSegmentColor: Color(0xFFAEFAB00),
                thirdSegmentColor: Color(0xFFEFEFEF),
                enableStripes: [1],
                animation: true,
                animationDuration: 1000,
                curve: Curves.decelerate,
                animateFromLastPercent: true,
              ),
              SizedBox(height: 10),
              Text(
                'Static with decelerate: 25% - 40% - 35%',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
