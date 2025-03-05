import 'package:flutter/material.dart';

/// A linear progress indicator that displays three segments with different colors and styles.
/// The middle segment can optionally display stripes.
///
/// The total of all segments must be less than or equal to 1.0 (100%).
/// Each segment percentage must be between 0.0 and 1.0.
///
/// Example:
/// ```dart
/// MultiSegmentLinearIndicator(
///   firstSegmentPercent: 0.3,
///   secondSegmentPercent: 0.4,
///   thirdSegmentPercent: 0.3,
///   lineHeight: 20,
///   barRadius: Radius.circular(10),
///   animation: true,
/// )
/// ```
class MultiSegmentLinearIndicator extends StatefulWidget {
  /// Percentage for the first segment (0.0 to 1.0)
  final double firstSegmentPercent;

  /// Percentage for the second segment (0.0 to 1.0)
  final double secondSegmentPercent;

  /// Percentage for the third segment (0.0 to 1.0)
  final double thirdSegmentPercent;

  /// Height of the progress bar
  final double lineHeight;

  /// Optional width of the progress bar. If null, fills the parent width
  final double? width;

  /// Color of the first segment
  final Color firstSegmentColor;

  /// Color of the second segment
  final Color secondSegmentColor;

  /// Color of the third segment (background)
  final Color thirdSegmentColor;

  /// Whether to show stripes in the second segment
  final bool hasStripes;

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
  /// The sum of [firstSegmentPercent], [secondSegmentPercent], and [thirdSegmentPercent]
  /// must be less than or equal to 1.0.
  const MultiSegmentLinearIndicator({
    Key? key,
    required this.firstSegmentPercent,
    required this.secondSegmentPercent,
    required this.thirdSegmentPercent,
    this.lineHeight = 5.0,
    this.width,
    this.firstSegmentColor = Colors.blue,
    this.secondSegmentColor = Colors.orange,
    this.thirdSegmentColor = Colors.grey,
    this.hasStripes = true,
    this.barRadius,
    this.padding = const EdgeInsets.symmetric(horizontal: 10.0),
    this.animation = false,
    this.animationDuration = 500,
    this.curve = Curves.linear,
    this.animateFromLastPercent = false,
    this.onAnimationEnd,
  })  : assert(firstSegmentPercent >= 0 && firstSegmentPercent <= 1.0,
            'First segment percentage must be between 0.0 and 1.0'),
        assert(secondSegmentPercent >= 0 && secondSegmentPercent <= 1.0,
            'Second segment percentage must be between 0.0 and 1.0'),
        assert(thirdSegmentPercent >= 0 && thirdSegmentPercent <= 1.0,
            'Third segment percentage must be between 0.0 and 1.0'),
        assert(
            firstSegmentPercent + secondSegmentPercent + thirdSegmentPercent <=
                1.0,
            'Sum of all segments must be less than or equal to 1.0'),
        super(key: key);

  @override
  State<MultiSegmentLinearIndicator> createState() =>
      _MultiSegmentLinearIndicatorState();
}

class _MultiSegmentLinearIndicatorState
    extends State<MultiSegmentLinearIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _firstSegmentAnimation;
  late Animation<double> _secondSegmentAnimation;
  late Animation<double> _thirdSegmentAnimation;

  double _firstPercent = 0.0;
  double _secondPercent = 0.0;
  double _thirdPercent = 0.0;

  @override
  void initState() {
    super.initState();

    if (!widget.animation) {
      _firstPercent = widget.firstSegmentPercent;
      _secondPercent = widget.secondSegmentPercent;
      _thirdPercent = widget.thirdSegmentPercent;
      return;
    }

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: widget.animationDuration),
    );

    _setupAnimations();
    _animationController.forward();
  }

  void _setupAnimations() {
    final double firstStart =
        widget.animateFromLastPercent ? _firstPercent : 0.0;
    final double secondStart =
        widget.animateFromLastPercent ? _secondPercent : 0.0;
    final double thirdStart =
        widget.animateFromLastPercent ? _thirdPercent : 0.0;

    _firstSegmentAnimation = Tween<double>(
      begin: firstStart,
      end: widget.firstSegmentPercent,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: widget.curve,
    ))
      ..addListener(() {
        setState(() {
          _firstPercent = _firstSegmentAnimation.value;
        });
      });

    _secondSegmentAnimation = Tween<double>(
      begin: secondStart,
      end: widget.secondSegmentPercent,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: widget.curve,
    ))
      ..addListener(() {
        setState(() {
          _secondPercent = _secondSegmentAnimation.value;
        });
      });

    _thirdSegmentAnimation = Tween<double>(
      begin: thirdStart,
      end: widget.thirdSegmentPercent,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: widget.curve,
    ))
      ..addListener(() {
        setState(() {
          _thirdPercent = _thirdSegmentAnimation.value;
        });
      });

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed &&
          widget.onAnimationEnd != null) {
        widget.onAnimationEnd!();
      }
    });
  }

  @override
  void didUpdateWidget(MultiSegmentLinearIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.animation &&
        (oldWidget.firstSegmentPercent != widget.firstSegmentPercent ||
            oldWidget.secondSegmentPercent != widget.secondSegmentPercent ||
            oldWidget.thirdSegmentPercent != widget.thirdSegmentPercent)) {
      _animationController.duration =
          Duration(milliseconds: widget.animationDuration);
      _setupAnimations();
      _animationController.forward(from: 0.0);
    } else if (!widget.animation) {
      _firstPercent = widget.firstSegmentPercent;
      _secondPercent = widget.secondSegmentPercent;
      _thirdPercent = widget.thirdSegmentPercent;
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      padding: widget.padding,
      child: CustomPaint(
        painter: _MultiSegmentPainter(
          firstSegmentPercent: _firstPercent,
          secondSegmentPercent: _secondPercent,
          thirdSegmentPercent: _thirdPercent,
          firstSegmentColor: widget.firstSegmentColor,
          secondSegmentColor: widget.secondSegmentColor,
          thirdSegmentColor: widget.thirdSegmentColor,
          hasStripes: widget.hasStripes,
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
  final double firstSegmentPercent;
  final double secondSegmentPercent;
  final double thirdSegmentPercent;
  final Color firstSegmentColor;
  final Color secondSegmentColor;
  final Color thirdSegmentColor;
  final bool hasStripes;
  final Radius barRadius;

  _MultiSegmentPainter({
    required this.firstSegmentPercent,
    required this.secondSegmentPercent,
    required this.thirdSegmentPercent,
    required this.firstSegmentColor,
    required this.secondSegmentColor,
    required this.thirdSegmentColor,
    required this.hasStripes,
    required this.barRadius,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint backgroundPaint = Paint()
      ..color = thirdSegmentColor
      ..style = PaintingStyle.fill;

    // Draw background (third segment)
    final backgroundPath = Path()
      ..addRRect(RRect.fromRectAndRadius(
        Rect.fromLTWH(0, 0, size.width, size.height),
        barRadius,
      ));
    canvas.drawPath(backgroundPath, backgroundPaint);

    // Calculate segment widths
    final firstSegmentWidth = size.width * firstSegmentPercent;
    final secondSegmentWidth = size.width * secondSegmentPercent;
    final secondSegmentStart = firstSegmentWidth;

    // Draw first segment
    if (firstSegmentPercent > 0) {
      final firstSegmentPaint = Paint()
        ..color = firstSegmentColor
        ..style = PaintingStyle.fill;

      final firstSegmentPath = Path();
      if (firstSegmentPercent == 1.0) {
        // If it's full width, use full border radius
        firstSegmentPath.addRRect(RRect.fromRectAndRadius(
          Rect.fromLTWH(0, 0, firstSegmentWidth, size.height),
          barRadius,
        ));
      } else {
        // Only round the left side
        firstSegmentPath.addPath(
          Path()
            ..addRRect(RRect.fromRectAndCorners(
              Rect.fromLTWH(0, 0, firstSegmentWidth, size.height),
              topLeft: barRadius,
              bottomLeft: barRadius,
            )),
          Offset.zero,
        );
      }
      canvas.drawPath(firstSegmentPath, firstSegmentPaint);
    }

    // Draw second segment
    if (secondSegmentPercent > 0) {
      final secondSegmentPaint = Paint()
        ..color = secondSegmentColor
        ..style = PaintingStyle.fill;

      final secondSegmentPath = Path();
      if (firstSegmentPercent == 0 && secondSegmentPercent == 1.0) {
        // If it's full width, use full border radius
        secondSegmentPath.addRRect(RRect.fromRectAndRadius(
          Rect.fromLTWH(secondSegmentStart, 0, secondSegmentWidth, size.height),
          barRadius,
        ));
      } else if (firstSegmentPercent == 0) {
        // Round only the left side
        secondSegmentPath.addRRect(RRect.fromRectAndCorners(
          Rect.fromLTWH(secondSegmentStart, 0, secondSegmentWidth, size.height),
          topLeft: barRadius,
          bottomLeft: barRadius,
        ));
      } else if (firstSegmentPercent + secondSegmentPercent == 1.0) {
        // Round only the right side
        secondSegmentPath.addRRect(RRect.fromRectAndCorners(
          Rect.fromLTWH(secondSegmentStart, 0, secondSegmentWidth, size.height),
          topRight: barRadius,
          bottomRight: barRadius,
        ));
      } else {
        // No rounding
        secondSegmentPath.addRect(
          Rect.fromLTWH(secondSegmentStart, 0, secondSegmentWidth, size.height),
        );
      }
      canvas.drawPath(secondSegmentPath, secondSegmentPaint);

      // Draw stripes if enabled
      if (hasStripes) {
        final stripePaint = Paint()
          ..color = Colors.white.withOpacity(0.3)
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2;

        const stripeSpacing = 8.0;

        canvas.save();
        canvas.clipRect(Rect.fromLTWH(
            secondSegmentStart, 0, secondSegmentWidth, size.height));

        for (double x = secondSegmentStart - size.height;
            x < secondSegmentStart + secondSegmentWidth + size.height;
            x += stripeSpacing) {
          canvas.drawLine(
            Offset(x, size.height),
            Offset(x + size.height, 0),
            stripePaint,
          );
        }
        canvas.restore();
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
