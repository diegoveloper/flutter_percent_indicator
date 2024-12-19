import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('testing circular percent indicator widget',
      (WidgetTester tester) async {
    CircularPercentIndicator localWidget =
        CircularPercentIndicator(radius: 20.0);
    await tester.pumpWidget(MaterialApp(home: localWidget));
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

  testWidgets('show center widget in linear percent indicator widget',
      (WidgetTester tester) async {
    LinearPercentIndicator localWidget = LinearPercentIndicator(
      width: 100.0,
      center: Text('linear'),
    );

    await tester.pumpWidget(MaterialApp(home: localWidget));

    expect(find.byType(Center), findsOne);
  });

  testWidgets('show center widget in circular percent indicator widget',
      (WidgetTester tester) async {
    CircularPercentIndicator localWidget = CircularPercentIndicator(
      radius: 20.0,
      center: Text('circular'),
    );

    await tester.pumpWidget(MaterialApp(home: localWidget));

    expect(find.byType(Center), findsOne);
  });

  testWidgets('show header widget in circular percent indicator widget',
      (WidgetTester tester) async {
    CircularPercentIndicator localWidget = CircularPercentIndicator(
      radius: 20.0,
      header: Text('header'),
    );

    await tester.pumpWidget(MaterialApp(home: localWidget));

    final header = find.descendant(
      of: find.byType(Column),
      matching: find.byType(Text),
    );

    final container = find.descendant(
      of: find.byType(Column),
      matching: find.byType(Container),
    );
    expect(header, findsExactly(1));
    expect(container, findsExactly(1));

    expect(tester.getTopLeft(header).dy,
        lessThan(tester.getTopLeft(container).dy));
  });

  testWidgets('show footer widget in circular percent indicator widget',
      (WidgetTester tester) async {
    CircularPercentIndicator localWidget = CircularPercentIndicator(
      radius: 20.0,
      footer: Text('footer'),
    );

    await tester.pumpWidget(MaterialApp(home: localWidget));

    final header = find.descendant(
      of: find.byType(Column),
      matching: find.byType(Text),
    );

    final container = find.descendant(
      of: find.byType(Column),
      matching: find.byType(Container),
    );
    expect(header, findsExactly(1));
    expect(container, findsExactly(1));

    expect(tester.getTopLeft(header).dy,
        greaterThan(tester.getTopLeft(container).dy));
  });

  testWidgets('apply fillColor in circular percent indicator widget',
      (WidgetTester tester) async {
    CircularPercentIndicator localWidget = CircularPercentIndicator(
      radius: 20.0,
      fillColor: Colors.red,
    );

    await tester.pumpWidget(MaterialApp(home: localWidget));

    final material = find.byType(Material);

    expect(material, findsOne);

    expect((tester.firstWidget(material) as Material).color, Colors.red);
  });

  testWidgets('apply fillColor in linear percent indicator widget',
      (WidgetTester tester) async {
    LinearPercentIndicator localWidget = LinearPercentIndicator(
      width: 100.0,
      fillColor: Colors.red,
    );

    await tester.pumpWidget(MaterialApp(home: localWidget));

    final container = find.ancestor(
      of: find.byType(Row),
      matching: find.byType(Container),
    );

    expect((tester.firstWidget(container) as Container).color, Colors.red);
  });

  testWidgets('testing percent animation in circular percent indicator widget',
      (WidgetTester tester) async {
    final animationController = AnimationController(
      vsync: tester,
      duration: const Duration(milliseconds: 200),
    );

    await tester.pumpWidget(
      MaterialApp(
        home: AnimatedBuilder(
          animation: animationController,
          builder: (context, child) {
            return CircularPercentIndicator(
              radius: 100.0,
              fillColor: Colors.red,
              percent: animationController.value,
            );
          },
        ),
      ),
    );

    animationController.forward();

    await tester.pump(const Duration(milliseconds: 200));

    await tester.pumpAndSettle();

    final linear = find.byType(CircularPercentIndicator);

    expect((tester.firstWidget(linear) as CircularPercentIndicator).percent, 1.0);

    animationController.dispose();
  });
  testWidgets('testing percent animation in linear percent indicator widget',
      (WidgetTester tester) async {
    final animationController = AnimationController(
      vsync: tester,
      duration: const Duration(milliseconds: 200),
    );

    await tester.pumpWidget(
      MaterialApp(
        home: AnimatedBuilder(
          animation: animationController,
          builder: (context, child) {
            return LinearPercentIndicator(
              width: 100.0,
              fillColor: Colors.red,
              percent: animationController.value,
            );
          },
        ),
      ),
    );

    animationController.forward();

    await tester.pump(const Duration(milliseconds: 200));

    await tester.pumpAndSettle();

    final linear = find.byType(LinearPercentIndicator);

    expect((tester.firstWidget(linear) as LinearPercentIndicator).percent, 1.0);

    animationController.dispose();
  });
}
