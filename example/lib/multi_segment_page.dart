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
                segments: [
                  SegmentLinearIndicator(
                    percent: 0.25,
                    color: Color(0xFF4285F4),
                    enableStripes: true,
                  ),
                  SegmentLinearIndicator(
                    percent: 0.4,
                    color: Color(0xFF6DD5F6),
                  ),
                  SegmentLinearIndicator(
                    percent: 0.35,
                    color: Color(0xFFEFEFEF),
                  ),
                ],
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
                segments: [
                  SegmentLinearIndicator(
                    percent: 0.3,
                    color: Color(0xFFBA0521),
                  ),
                  SegmentLinearIndicator(
                    percent: 0.4,
                    color: Color(0xFF071437),
                    enableStripes: true,
                  ),
                  SegmentLinearIndicator(
                    percent: 0.3,
                    color: Color(0xFFFF9205),
                  ),
                ],
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
                segments: [
                  SegmentLinearIndicator(
                    percent: firstSegment,
                    color: Colors.green,
                    enableStripes: true,
                  ),
                  SegmentLinearIndicator(
                    percent: secondSegment,
                    color: Colors.blue,
                    enableStripes: true,
                  ),
                  SegmentLinearIndicator(
                    percent: thirdSegment,
                    color: Colors.orange,
                  ),
                ],
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
                segments: [
                  SegmentLinearIndicator(
                    percent: 0.15,
                    color: Color(0xFFBA0521),
                    enableStripes: true,
                  ),
                  SegmentLinearIndicator(
                      percent: 0.4, color: Color(0xFFAEFAB00)),
                  SegmentLinearIndicator(
                      percent: 0.45, color: Color(0xFFEFEFEF)),
                ],
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
