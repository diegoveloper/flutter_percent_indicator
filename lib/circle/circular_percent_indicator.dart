import 'package:vector_math/vector_math.dart' as vectorMath show radians;

import 'package:flutter/material.dart';
import 'package:percent_indicator/circle/enums/circular_stroke_cap.dart';
import 'package:percent_indicator/circle/enums/arc_type.dart';

// ignore: must_be_immutable
class CircularPercentIndicator extends StatefulWidget {
  /// Percent value between 0.0 and 1.0
  final double percent;
  final double diameter;

  /// Width of the progress bar of the circle
  final double lineWidth;

  /// Width of the unfilled background of the progress bar
  final double backgroundWidth;

  /// Color of the background of the circle , default = transparent
  final Color fillColor;

  /// First color applied to the complete circle
  final Color backgroundColor;

  Color? get progressColor => _progressColor;
  /* set progressColor(Color? colour) => _progressColor; */

  Color? _progressColor;

  /// true if you want the circle to have animation
  final bool animation;

  /// duration of the animation in milliseconds, It only applies if animation attribute is true
  final int animationDuration;

  /// widget at the top of the circle
  final Widget? header;

  /// widget at the bottom of the circle
  final Widget? footer;

  /// widget inside the circle
  final Widget? center;

  final LinearGradient? linearGradient;

  /// The kind of finish to place on the end of lines drawn, values supported: butt, round, square
  final CircularStrokeCap circularStrokeCap;

  /// the angle which the circle will start the progress (in degrees, eg: 0.0, 45.0, 90.0)
  final double startAngle;

  /// set true if you want to animate the linear from the last percent value you set
  final bool animateFromLastPercent;

  /// set false if you don't want to preserve the state of the widget
  final bool addAutomaticKeepAlive;

  /// set the arc type
  final ArcType? arcType;

  /// set a circular background color when use the arcType property
  final Color? arcBackgroundColor;

  /// set true when you want to display the progress in reverse mode
  final bool reverse;

  /// Creates a mask filter that takes the progress shape being drawn and blurs it.
  final MaskFilter maskFilter;

  /// set a circular curve animation type
  final Curve curve;

  /// set true when you want to restart the animation, it restarts only when reaches 1.0 as a value
  /// defaults to false
  final bool restartAnimation;

  /// Callback called when the animation ends (only if `animation` is true)
  final VoidCallback? onAnimationEnd;

  /// Display a widget indicator at the end of the progress. It only works when `animation` is true
  final Widget? widgetIndicator;

  /// Set to true if you want to rotate linear gradient in accordance to the [startAngle].
  final bool rotateLinearGradient;

  CircularPercentIndicator(
      {Key? key,
      this.percent = 0.0,
      this.lineWidth = 5.0,
      this.startAngle = 0.0,
      required this.diameter,
      this.fillColor = Colors.transparent,
      this.backgroundColor = const Color(0xFFB8C7CB),
      Color? progressColor = null,
      // negative values are ignored, replaced with lineWidth
      this.backgroundWidth = -1,
      this.linearGradient,
      this.animation = false,
      this.animationDuration = 500,
      this.header,
      this.footer,
      this.center,
      this.addAutomaticKeepAlive = true,
      required this.circularStrokeCap,
      this.arcBackgroundColor,
      this.arcType,
      this.animateFromLastPercent = false,
      this.reverse = false,
      this.curve = Curves.linear,
      required this.maskFilter,
      this.restartAnimation = false,
      required /**/ this.onAnimationEnd,
      this.widgetIndicator,
      this.rotateLinearGradient = false})

      // Expect only a linearGradient or a progressColor given.
      : assert(linearGradient != null && progressColor != null),
        super(key: key) {
    if (linearGradient != null && progressColor != null) {
      throw ArgumentError(
        'Cannot provide both linearGradient and progressColor',
      );
    }
    // Custom logic warning defaults to red if no colour or gradient is set...
    // Should remove the custom progressColor mutability for maintainability
    _progressColor = progressColor ?? Colors.red;

    assert(startAngle >= 0.0);
    assert(curve != null);
    if (percent < 0.0 || percent > 1.0) {
      throw Exception(
        "Percent value must be a double between 0.0 and 1.0",
      );
    }

    if (arcType == null && arcBackgroundColor != null) {
      throw ArgumentError(
        'arcType is required with arcBackgroundColor',
      );
    }
  }

  @override
  _CircularPercentIndicatorState createState() =>
      _CircularPercentIndicatorState();
}

class _CircularPercentIndicatorState extends State<CircularPercentIndicator>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  AnimationController? _animationController;
  Animation? _animation;
  double _percent = 0.0;

  @override
  void dispose() {
    if (_animationController != null) {
      _animationController!.dispose();
    }
    super.dispose();
  }

  @override
  void initState() {
    if (widget.animation) {
      _animationController = AnimationController(
          vsync: this,
          duration: Duration(milliseconds: widget.animationDuration));
      _animation = Tween(
        begin: 0.0,
        end: widget.percent,
      ).animate(
        CurvedAnimation(
          parent: _animationController!,
          curve: widget.curve,
        ),
      )..addListener(() {
          setState(() {
            _percent = _animation?.value;
          });
          if (widget.restartAnimation && _percent == 1.0) {
            _animationController?.repeat(
              min: 0,
              max: 1.0,
            );
          }
        });
      _animationController?.addStatusListener((status) {
        if (widget.onAnimationEnd != null &&
            status == AnimationStatus.completed) {
          widget.onAnimationEnd!();
        }
      });
      _animationController?.forward();
    } else {
      _updateProgress();
    }
    super.initState();
  }

  void _checkIfNeedCancelAnimation(CircularPercentIndicator oldWidget) {
    if (oldWidget.animation &&
        !widget.animation &&
        _animationController != null) {
      _animationController!.stop();
    }
  }

  @override
  void didUpdateWidget(CircularPercentIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.percent != widget.percent ||
        oldWidget.startAngle != widget.startAngle) {
      if (_animationController != null) {
        _animationController!.duration =
            Duration(milliseconds: widget.animationDuration);
        _animation = Tween(
                begin: widget.animateFromLastPercent ? oldWidget.percent : 0.0,
                end: widget.percent)
            .animate(
          CurvedAnimation(
            parent: _animationController!,
            curve: widget.curve,
          ),
        );
        _animationController!.forward(from: 0.0);
      } else {
        _updateProgress();
      }
    }
    _checkIfNeedCancelAnimation(oldWidget);
  }

  _updateProgress() {
    setState(() {
      _percent = widget.percent;
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    var items = <Widget>[];
    if (widget.header != null) {
      items.add(widget.header!);
    }
    items.add(
      Container(
        height: widget.diameter,
        width: widget.diameter,
        child: Stack(
          children: [
            CustomPaint(
              painter: CirclePainter(
                  progress: _percent * 360,
                  progressColor: widget.progressColor,
                  backgroundColor: widget.backgroundColor,
                  startAngle: widget.startAngle,
                  circularStrokeCap: widget.circularStrokeCap,
                  radius: (widget.diameter / 2) - widget.lineWidth / 2,
                  lineWidth: widget.lineWidth,
                  backgroundWidth: //negative values ignored, replaced with lineWidth
                      widget.backgroundWidth >= 0.0
                          ? (widget.backgroundWidth)
                          : widget.lineWidth,
                  arcBackgroundColor: widget.arcBackgroundColor,
                  arcType: widget.arcType,
                  reverse: widget.reverse,
                  linearGradient: widget.linearGradient,
                  maskFilter: widget.maskFilter,
                  rotateLinearGradient: widget.rotateLinearGradient),
              child: (widget.center != null)
                  ? Center(child: widget.center)
                  : Container(),
            ),
            if (widget.widgetIndicator != null && widget.animation)
              Positioned.fill(
                child: Transform.rotate(
                  angle: vectorMath.radians(
                      (widget.circularStrokeCap != CircularStrokeCap.butt &&
                              widget.reverse)
                          ? -15
                          : 0),
                  child: Transform.rotate(
                    angle: vectorMath
                        .radians((widget.reverse ? -360 : 360) * _percent),
                    child: Transform.translate(
                      offset: Offset(
                        (widget.circularStrokeCap != CircularStrokeCap.butt)
                            ? widget.lineWidth / 2
                            : 0,
                        (-widget.diameter / 2 + widget.lineWidth / 2),
                      ),
                      child: widget.widgetIndicator,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );

    if (widget.footer != null) {
      items.add(widget.footer!);
    }

    return Material(
      color: widget.fillColor,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: items,
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => widget.addAutomaticKeepAlive;
}
