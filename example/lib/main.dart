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
            // Preview section
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
                      firstSegmentPercent: firstSegment,
                      secondSegmentPercent: secondSegment,
                      thirdSegmentPercent: thirdSegment,
                      firstSegmentColor: firstColor,
                      secondSegmentColor: secondColor,
                      thirdSegmentColor: thirdColor,
                      hasStripes: hasStripes,
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

            // Controls section
            // Card(
            //   child: Padding(
            //     padding: const EdgeInsets.all(16.0),
            //     child: Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         const Text(
            //           'Controls',
            //           style: TextStyle(
            //             fontSize: 20,
            //             fontWeight: FontWeight.bold,
            //           ),
            //         ),
            //         const SizedBox(height: 16),

            //         // Animation controls
            //         const Text(
            //           'Animation',
            //           style: TextStyle(
            //             fontSize: 16,
            //             fontWeight: FontWeight.bold,
            //           ),
            //         ),
            //         SwitchListTile(
            //           title: const Text('Enable Animation'),
            //           value: animate,
            //           onChanged: (value) => setState(() => animate = value),
            //         ),
            //         if (animate) ...[
            //           _buildSlider(
            //             'Animation Duration (ms)',
            //             animationDuration.toDouble(),
            //             (value) =>
            //                 setState(() => animationDuration = value.round()),
            //             min: 100,
            //             max: 5000,
            //           ),
            //           SwitchListTile(
            //             title: const Text('Animate From Last Percent'),
            //             value: animateFromLastPercent,
            //             onChanged: (value) =>
            //                 setState(() => animateFromLastPercent = value),
            //           ),
            //           ListTile(
            //             title: const Text('Animation Curve'),
            //             trailing: DropdownButton<Curve>(
            //               value: animationCurve,
            //               items: curves.map((curve) {
            //                 return DropdownMenuItem(
            //                   value: curve,
            //                   child: Text(_getCurveName(curve)),
            //                 );
            //               }).toList(),
            //               onChanged: (value) {
            //                 if (value != null) {
            //                   setState(() => animationCurve = value);
            //                 }
            //               },
            //             ),
            //           ),
            //           const Divider(),
            //         ],

            //         // Segment percentages
            //         _buildSlider(
            //           'First Segment',
            //           firstSegment,
            //           (value) => setState(() => firstSegment = value),
            //         ),
            //         _buildSlider(
            //           'Second Segment',
            //           secondSegment,
            //           (value) => setState(() => secondSegment = value),
            //         ),
            //         _buildSlider(
            //           'Third Segment',
            //           thirdSegment,
            //           (value) => setState(() => thirdSegment = value),
            //         ),

            //         const Divider(),

            //         // Line height
            //         _buildSlider(
            //           'Line Height',
            //           lineHeight,
            //           (value) => setState(() => lineHeight = value),
            //           min: 5,
            //           max: 50,
            //         ),

            //         // Border radius
            //         _buildSlider(
            //           'Border Radius',
            //           borderRadius,
            //           (value) => setState(() => borderRadius = value),
            //           min: 0,
            //           max: 25,
            //         ),

            //         // Stripes toggle
            //         SwitchListTile(
            //           title: const Text('Show Stripes'),
            //           value: hasStripes,
            //           onChanged: (value) => setState(() => hasStripes = value),
            //         ),

            //         // Color pickers
            //         ListTile(
            //           title: const Text('First Segment Color'),
            //           trailing: _buildColorBox(firstColor),
            //           onTap: () => _showColorPicker(
            //             context,
            //             firstColor,
            //             (color) => setState(() => firstColor = color),
            //           ),
            //         ),
            //         ListTile(
            //           title: const Text('Second Segment Color'),
            //           trailing: _buildColorBox(secondColor),
            //           onTap: () => _showColorPicker(
            //             context,
            //             secondColor,
            //             (color) => setState(() => secondColor = color),
            //           ),
            //         ),
            //         ListTile(
            //           title: const Text('Third Segment Color'),
            //           trailing: _buildColorBox(thirdColor),
            //           onTap: () => _showColorPicker(
            //             context,
            //             thirdColor,
            //             (color) => setState(() => thirdColor = color),
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  Widget _buildSlider(
    String label,
    double value,
    ValueChanged<double> onChanged, {
    double min = 0.0,
    double max = 1.0,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('$label: ${value.toStringAsFixed(2)}'),
        Slider(
          value: value,
          min: min,
          max: max,
          onChanged: onChanged,
        ),
      ],
    );
  }

  Widget _buildColorBox(Color color) {
    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: Colors.black26),
      ),
    );
  }

  void _showColorPicker(
    BuildContext context,
    Color initialColor,
    ValueChanged<Color> onColorChanged,
  ) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Pick a color'),
        content: SingleChildScrollView(
          child: ColorPicker(
            initialColor: initialColor,
            onColorChanged: onColorChanged,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}

// Simple color picker widget
class ColorPicker extends StatelessWidget {
  final Color initialColor;
  final ValueChanged<Color> onColorChanged;

  const ColorPicker({
    Key? key,
    required this.initialColor,
    required this.onColorChanged,
  }) : super(key: key);

  static const List<Color> _colors = [
    Colors.red,
    Colors.pink,
    Colors.purple,
    Colors.deepPurple,
    Colors.indigo,
    Colors.blue,
    Colors.lightBlue,
    Colors.cyan,
    Colors.teal,
    Colors.green,
    Colors.lightGreen,
    Colors.lime,
    Colors.yellow,
    Colors.amber,
    Colors.orange,
    Colors.deepOrange,
    Colors.brown,
    Colors.grey,
    Colors.blueGrey,
    Colors.black,
  ];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        for (final color in _colors)
          InkWell(
            onTap: () => onColorChanged(color),
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color:
                      color == initialColor ? Colors.white : Colors.transparent,
                  width: 2,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
