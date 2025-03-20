import 'package:flutter/material.dart';

/// A multi-segment linear progress indicator that displays three segments with different colors and styles.
/// One segment can optionally display stripes.
///
/// The total of all segments must be less than or equal to 1.0 (100%).
/// Each segment percentage must be between 0.0 and 1.0.
///
/// Example:
/// ```dart
/// MultiSegmentLinearIndicator(
///   segments: [
///     SegmentLinearIndicator(percent: 0.3, color: Colors.red, enableStripes: true),
///     SegmentLinearIndicator(percent: 0.4, color: Colors.blue),
///     SegmentLinearIndicator(percent: 0.3, color: Colors.green),
///   ],
///   lineHeight: 20,
///   barRadius: Radius.circular(10),
///   animation: true,
///   enableStripes: [1, 2], // Enable stripes for first and second segments
/// )
/// ```

/// Represents a segment in the linear indicator with a percentage and color.
class SegmentLinearIndicator {
  final double percent;
  final Color color;
  final bool enableStripes;

  SegmentLinearIndicator({
    required this.percent,
    required this.color,
    this.enableStripes = false,
  });
}

class MultiSegmentLinearIndicator extends StatefulWidget {
  /// List of segments to display in the indicator.
  final List<SegmentLinearIndicator> segments;

  /// Height of the progress bar
  final double lineHeight;

  /// Optional width of the progress bar. If null, fills the parent width
  final double? width;

  /// Border radius of the progress bar
  final Radius? barRadius;

  /// Padding around the progress bar
  final EdgeInsets padding;

  /// Whether to animate changes in the progress values
  final bool animation;

  /// Duration of the animation in milliseconds
  final int animationDuration;

  /// Animation curve to use
  final Curve curve;

  /// Whether to animate from the last percentage value or from 0
  final bool animateFromLastPercent;

  /// Callback when animation completes
  final VoidCallback? onAnimationEnd;

  /// Creates a multi-segment linear progress indicator.
  ///
  /// The sum of all segment percentages must be less than or equal to 1.0.
  MultiSegmentLinearIndicator({
    Key? key,
    required this.segments,
    this.lineHeight = 5.0,
    this.width,
    this.barRadius,
    this.padding = const EdgeInsets.symmetric(horizontal: 10.0),
    this.animation = false,
    this.animationDuration = 500,
    this.curve = Curves.linear,
    this.animateFromLastPercent = false,
    this.onAnimationEnd,
  }) : super(key: key) {
    final sum = segments.fold<double>(
      0.0,
      (sum, segment) => sum + segment.percent,
    );
    if (sum > 1.0) {
      throw Exception(
        'The sum of all segment percentages must be less than or equal to 1.0, but got $sum',
      );
    }
  }

  @override
  State<MultiSegmentLinearIndicator> createState() =>
      _MultiSegmentLinearIndicatorState();
}

class _MultiSegmentLinearIndicatorState
    extends State<MultiSegmentLinearIndicator>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  late List<Animation<double>> _segmentAnimations;
  late List<double> _segmentPercents;

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _segmentPercents = List.filled(widget.segments.length, 0.0);

    if (!widget.animation) {
      for (int i = 0; i < widget.segments.length; i++) {
        _segmentPercents[i] = widget.segments[i].percent;
      }
      return;
    }

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: widget.animationDuration),
    );

    _setupAnimations();

    _animationController!.addStatusListener((status) {
      if (widget.onAnimationEnd != null &&
          status == AnimationStatus.completed) {
        widget.onAnimationEnd!();
      }
    });

    _animationController!.forward();
  }

  void _setupAnimations() {
    _segmentAnimations = List.generate(widget.segments.length, (index) {
      final double start =
          widget.animateFromLastPercent ? _segmentPercents[index] : 0.0;

      return Tween<double>(
        begin: start,
        end: widget.segments[index].percent,
      ).animate(CurvedAnimation(
        parent: _animationController!,
        curve: widget.curve,
      ))
        ..addListener(() {
          setState(() {
            _segmentPercents[index] = _segmentAnimations[index].value;
          });
        });
    });
  }

  void _checkIfNeedCancelAnimation(MultiSegmentLinearIndicator oldWidget) {
    if (oldWidget.animation &&
        !widget.animation &&
        _animationController != null) {
      _animationController!.stop();
    }
  }

  @override
  void didUpdateWidget(MultiSegmentLinearIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.animation &&
        !_areSegmentsEqual(oldWidget.segments, widget.segments)) {
      _animationController!.duration =
          Duration(milliseconds: widget.animationDuration);
      _setupAnimations();
      _animationController!.forward(from: 0.0);
    } else if (!widget.animation) {
      for (int i = 0; i < widget.segments.length; i++) {
        _segmentPercents[i] = widget.segments[i].percent;
      }
    }

    _checkIfNeedCancelAnimation(oldWidget);
  }

  bool _areSegmentsEqual(
      List<SegmentLinearIndicator> a, List<SegmentLinearIndicator> b) {
    if (a.length != b.length) return false;

    for (int i = 0; i < a.length; i++) {
      if (a[i].percent != b[i].percent) return false;
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      padding: widget.padding,
      child: CustomPaint(
        painter: _MultiSegmentPainter(
          segments: widget.segments,
          segmentPercents: _segmentPercents,
          barRadius: widget.barRadius ?? Radius.zero,
        ),
        child: SizedBox(
          height: widget.lineHeight,
        ),
      ),
    );
  }
}

/// Custom painter for drawing the multi-segment progress bar
class _MultiSegmentPainter extends CustomPainter {
  final List<SegmentLinearIndicator> segments;
  final List<double> segmentPercents;
  final Radius barRadius;

  _MultiSegmentPainter({
    required this.segments,
    required this.segmentPercents,
    required this.barRadius,
  });

  @override
  void paint(Canvas canvas, Size size) {
    double startX = 0.0;

    for (int i = 0; i < segments.length; i++) {
      final segmentWidth = size.width * segmentPercents[i];
      final segmentPaint = Paint()
        ..color = segments[i].color
        ..style = PaintingStyle.fill;

      final segmentPath = Path();
      if (i == 0 && segmentPercents[i] == 1.0) {
        // Full width with full border radius
        segmentPath.addRRect(RRect.fromRectAndRadius(
          Rect.fromLTWH(startX, 0, segmentWidth, size.height),
          barRadius,
        ));
      } else if (i == 0) {
        // Round only the left side
        segmentPath.addRRect(RRect.fromRectAndCorners(
          Rect.fromLTWH(startX, 0, segmentWidth, size.height),
          topLeft: barRadius,
          bottomLeft: barRadius,
        ));
      } else if (i == segments.length - 1) {
        // Round only the right side for the last segment
        segmentPath.addRRect(RRect.fromRectAndCorners(
          Rect.fromLTWH(startX, 0, segmentWidth, size.height),
          topRight: barRadius,
          bottomRight: barRadius,
        ));
      } else {
        // No rounding for middle segments
        segmentPath.addRect(
          Rect.fromLTWH(startX, 0, segmentWidth, size.height),
        );
      }
      canvas.drawPath(segmentPath, segmentPaint);

      // Draw stripes if enabled for this segment
      if (segments[i].enableStripes) {
        _drawStripes(canvas, startX, segmentWidth, size.height);
      }

      startX += segmentWidth;
    }
  }

  void _drawStripes(Canvas canvas, double startX, double width, double height) {
    final stripePaint = Paint()
      ..color = Colors.white.withOpacity(0.3)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    const stripeSpacing = 8.0;

    canvas.save();
    canvas.clipRect(Rect.fromLTWH(startX, 0, width, height));

    for (double x = startX - height;
        x < startX + width + height;
        x += stripeSpacing) {
      canvas.drawLine(
        Offset(x, height),
        Offset(x + height, 0),
        stripePaint,
      );
    }
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
