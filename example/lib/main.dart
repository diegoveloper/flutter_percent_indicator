import 'package:flutter/material.dart';
import 'package:percent_indicator_example/sample_circular_page.dart';
import 'package:percent_indicator_example/sample_linear_page.dart';

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
