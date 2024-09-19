# Blinking Circle

A Flutter package that provides a blinking circle widget.

## Usage

```dart
import 'package:blinking_circle/blinking_circle.dart';

BlinkingCircle(
  onTap: () {
    // Handle tap
  },
  circleColor: Colors.red,
  circleSize: 100.0,
  containerWidth: 150.0,
  containerHeight: 150.0,
  containerDecoration: BoxDecoration(
    color: Colors.blue,
    borderRadius: BorderRadius.circular(10.0),
  ),
);
