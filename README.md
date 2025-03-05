# Multi-Segment Linear Indicator

A Flutter package that provides a customizable linear progress indicator with three distinct segments, each with its own color and style. The middle segment can optionally display animated stripes.

## Features

- Three independently animated segments
- Customizable colors for each segment
- Optional striped pattern for the middle segment
- Smooth animations with customizable duration and curve
- Configurable border radius
- RTL support
- Flexible sizing and padding options

## Installation

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  multi_segment_linear_indicator: ^1.0.0
```

## Usage

### Basic Usage

```dart
import 'package:multi_segment_linear_indicator/multi_segment_linear_indicator.dart';

MultiSegmentLinearIndicator(
  firstSegmentPercent: 0.3,
  secondSegmentPercent: 0.4,
  thirdSegmentPercent: 0.3,
  lineHeight: 20,
  barRadius: Radius.circular(10),
  animation: true,
)
```

### Advanced Usage

```dart
MultiSegmentLinearIndicator(
  firstSegmentPercent: 0.3,
  secondSegmentPercent: 0.4,
  thirdSegmentPercent: 0.3,
  lineHeight: 20,
  width: 300, // Optional fixed width
  firstSegmentColor: Colors.blue,
  secondSegmentColor: Colors.orange,
  thirdSegmentColor: Colors.grey,
  hasStripes: true,
  barRadius: Radius.circular(10),
  padding: EdgeInsets.symmetric(horizontal: 16),
  animation: true,
  animationDuration: 1000,
  curve: Curves.easeInOut,
  animateFromLastPercent: true,
  onAnimationEnd: () {
    print('Animation completed');
  },
)
```

## Properties

| Property                 | Type            | Description                                       |
| ------------------------ | --------------- | ------------------------------------------------- |
| `firstSegmentPercent`    | `double`        | Percentage for the first segment (0.0 to 1.0)     |
| `secondSegmentPercent`   | `double`        | Percentage for the second segment (0.0 to 1.0)    |
| `thirdSegmentPercent`    | `double`        | Percentage for the third segment (0.0 to 1.0)     |
| `lineHeight`             | `double`        | Height of the progress bar                        |
| `width`                  | `double?`       | Optional fixed width. If null, fills parent width |
| `firstSegmentColor`      | `Color`         | Color of the first segment                        |
| `secondSegmentColor`     | `Color`         | Color of the second segment                       |
| `thirdSegmentColor`      | `Color`         | Color of the third segment (background)           |
| `hasStripes`             | `bool`          | Whether to show stripes in the second segment     |
| `barRadius`              | `Radius?`       | Border radius of the progress bar                 |
| `padding`                | `EdgeInsets`    | Padding around the progress bar                   |
| `animation`              | `bool`          | Whether to animate changes in progress values     |
| `animationDuration`      | `int`           | Duration of the animation in milliseconds         |
| `curve`                  | `Curve`         | Animation curve to use                            |
| `animateFromLastPercent` | `bool`          | Whether to animate from the last percentage value |
| `onAnimationEnd`         | `VoidCallback?` | Callback when animation completes                 |

## Notes

- The sum of all segment percentages must be less than or equal to 1.0
- Each segment percentage must be between 0.0 and 1.0
- The widget automatically handles state management and animations
- Stripes are only shown in the second segment when `hasStripes` is true

## Example

Check out the [example](example) directory for a complete sample application.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
