import 'package:flutter/material.dart';
import 'package:percent_indicator/flutter_percent_indicator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Multi-Segment Indicator Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: const MultiSegmentDemo(),
    );
  }
}

class MultiSegmentDemo extends StatefulWidget {
  const MultiSegmentDemo({Key? key}) : super(key: key);

  @override
  State<MultiSegmentDemo> createState() => _MultiSegmentDemoState();
}

class _MultiSegmentDemoState extends State<MultiSegmentDemo> {
  double firstSegment = 0.3;
  double secondSegment = 0.4;
  double thirdSegment = 0.3;
  double lineHeight = 30.0;
  bool hasStripes = true;
  double borderRadius = 10.0;
  Color firstColor = const Color(0xFF4285F4);
  Color secondColor = const Color(0xFF6DD5F6);
  Color thirdColor = const Color(0xFFEFEFEF);
  bool animate = true;
  int animationDuration = 1000;
  bool animateFromLastPercent = true;
  Curve animationCurve = Curves.easeInOut;

  final List<Curve> curves = [
    Curves.linear,
    Curves.easeIn,
    Curves.easeOut,
    Curves.easeInOut,
    Curves.elasticIn,
    Curves.elasticOut,
    Curves.bounceIn,
    Curves.bounceOut,
  ];

  String _getCurveName(Curve curve) {
    return curve.toString().split('.').last;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Multi-Segment Indicator Demo'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MultiSegmentLinearIndicator(
                      width: MediaQuery.of(context).size.width - 64,
                      lineHeight: lineHeight,
                      segments: [
                        SegmentLinearIndicator(
                            percent: firstSegment, color: firstColor),
                        SegmentLinearIndicator(
                            percent: secondSegment,
                            color: secondColor,
                            enableStripes: hasStripes),
                        SegmentLinearIndicator(
                          percent: thirdSegment,
                          color: thirdColor,
                        ),
                      ],
                      barRadius: Radius.circular(borderRadius),
                      animation: animate,
                      animationDuration: animationDuration,
                      curve: animationCurve,
                      animateFromLastPercent: animateFromLastPercent,
                      onAnimationEnd: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Animation completed!'),
                            duration: Duration(seconds: 1),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
