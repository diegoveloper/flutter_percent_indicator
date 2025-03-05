import 'package:flutter/material.dart';
import 'package:percent_indicator/flutter_percent_indicator.dart';

class MultiSegmentExample extends StatelessWidget {
  const MultiSegmentExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Multi-Segment Linear Indicator'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MultiSegmentLinearIndicator(
                width: MediaQuery.of(context).size.width - 40,
                lineHeight: 20.0,
                firstSegmentPercent: 0.3, // 30% blue
                secondSegmentPercent: 0.4, // 40% striped orange
                thirdSegmentPercent: 0.3, // 30% gray
                barRadius: Radius.circular(10),
              ),
              SizedBox(height: 20),
              Text(
                'Progress: 70%',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(
                'Blue: 30%, Striped: 40%, Remaining: 30%',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
