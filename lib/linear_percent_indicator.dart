import 'package:flutter/material.dart';

enum LinearStrokeCap { butt, round, roundAll }

class LinearPercentIndicator extends StatefulWidget {
  ///Percent value between 0.0 and 1.0
  final double percent;
  final double width;

  ///Height of the line
  final double lineHeight;

  ///First color applied to the complete line
  final Color backgroundColor;
  final Color progressColor;

  ///true if you want the Line to have animation
  final bool animation;

  ///duration of the animation in milliseconds, It only applies if animation attribute is true
  final int animationDuration;

  ///widget at the left of the Line
  final Widget leading;

  ///widget at the right of the Line
  final Widget trailing;

  ///widget inside the Line
  final Widget center;

  ///The kind of finish to place on the end of lines drawn, values supported: butt, round, roundAll
  final LinearStrokeCap linearStrokeCap;

  LinearPercentIndicator(
      {Key key,
      this.percent = 0.0,
      this.lineHeight = 5.0,
      @required this.width,
      this.backgroundColor = const Color(0xFFB8C7CB),
      this.progressColor = Colors.red,
      this.animation = false,
      this.animationDuration = 500,
      this.leading,
      this.trailing,
      this.center,
      this.linearStrokeCap})
      : super(key: key) {
    if (percent < 0.0 || percent > 1.0) {
      throw new Exception("Percent value must be a double between 0.0 and 1.0");
    }
  }

  @override
  _LinearPercentIndicatorState createState() => _LinearPercentIndicatorState();
}

class _LinearPercentIndicatorState extends State<LinearPercentIndicator>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation _animation;
  double _percent = 0.0;

  @override
  void dispose() {
    if (_animationController != null) {
      _animationController.dispose();
    }
    super.dispose();
  }

  @override
  void initState() {
    if (widget.animation) {
      _animationController = new AnimationController(
          vsync: this,
          duration: Duration(milliseconds: widget.animationDuration));
      _animation = new Tween(begin: 0.0, end: widget.percent)
          .animate(_animationController)
            ..addListener(() {
              setState(() {
                _percent = _animation.value;
              });
            });
      _animationController.forward();
    } else {
      _updateProgress();
    }
    super.initState();
  }

  @override
  void didUpdateWidget(LinearPercentIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.percent != widget.percent) {
      if (_animationController != null) {
        _animationController.forward(from: 0.0);
      } else {
        _updateProgress();
      }
    }
  }

  _updateProgress() {
    setState(() {
      _percent = widget.percent;
    });
  }

  @override
  Widget build(BuildContext context) {
    var items = new List<Widget>();
    if (widget.leading != null) {
      items.add(
          Padding(padding: EdgeInsets.only(right: 5.0), child: widget.leading));
    }
    items.add(Container(
        width: widget.width,
        height: widget.lineHeight * 2,
        child: CustomPaint(
          painter: LinearPainter(
              progress: _percent,
              progressColor: widget.progressColor,
              backgroundColor: widget.backgroundColor,
              linearStrokeCap: widget.linearStrokeCap,
              lineWidth: widget.lineHeight),
          child: (widget.center != null)
              ? Center(child: widget.center)
              : Container(),
        )));

    if (widget.trailing != null) {
      items.add(
          Padding(padding: EdgeInsets.only(left: 5.0), child: widget.trailing));
    }

    return Material(
      child: new Container(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: items,
      )),
    );
  }
}

class LinearPainter extends CustomPainter {
  final Paint _paintBackground = new Paint();
  final Paint _paintLine = new Paint();
  final lineWidth;
  final progress;
  final Color progressColor;
  final Color backgroundColor;
  final LinearStrokeCap linearStrokeCap;

  LinearPainter(
      {this.lineWidth,
      this.progress,
      this.progressColor,
      this.backgroundColor,
      this.linearStrokeCap = LinearStrokeCap.butt}) {
    _paintBackground.color = backgroundColor;
    _paintBackground.style = PaintingStyle.stroke;
    _paintBackground.strokeWidth = lineWidth;

    _paintLine.color = progressColor;
    _paintLine.style = PaintingStyle.stroke;
    _paintLine.strokeWidth = lineWidth;
    if (linearStrokeCap == LinearStrokeCap.round) {
      _paintLine.strokeCap = StrokeCap.round;
    } else if (linearStrokeCap == LinearStrokeCap.butt) {
      _paintLine.strokeCap = StrokeCap.butt;
    } else {
      _paintLine.strokeCap = StrokeCap.round;
      _paintBackground.strokeCap = StrokeCap.round;
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    final start = Offset(0.0, size.height / 2);
    final end = Offset(size.width, size.height / 2);
    canvas.drawLine(start, end, _paintBackground);
    canvas.drawLine(
        start, Offset(size.width * progress, size.height / 2), _paintLine);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
