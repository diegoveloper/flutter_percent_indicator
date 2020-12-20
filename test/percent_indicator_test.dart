import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('testing circular percent indicator widget',
      (WidgetTester tester) async {
    CircularPercentIndicator localWidget =
        CircularPercentIndicator(radius: 20.0);
    await tester.pumpWidget(localWidget);
    expect(localWidget.percent, 0.0);
  });

  testWidgets('testing linear percent indicator widget',
      (WidgetTester tester) async {
    LinearPercentIndicator localWidget = LinearPercentIndicator(
      width: 100.0,
    );
    await tester.pumpWidget(MaterialApp(home: localWidget));
    expect(localWidget.percent, 0.0);
  });
}
