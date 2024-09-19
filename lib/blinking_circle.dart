
import 'package:flutter/material.dart';

class BlinkingCircle extends StatefulWidget {
  final VoidCallback onTap;
  final Color circleColor;
  final double circleSize;
  final double containerWidth;
  final double containerHeight;
  final Decoration? containerDecoration;
  final Widget? child;

  const BlinkingCircle({
    Key? key,
    required this.onTap,
    this.circleColor = Colors.black,
    this.circleSize = 70.0,
    this.containerWidth = 100.0,
    this.containerHeight = 100.0,
    this.containerDecoration,
    this.child,
  }) : super(key: key);

  @override
  _BlinkingCircleState createState() => _BlinkingCircleState();
}

class _BlinkingCircleState extends State<BlinkingCircle>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _blinkAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _blinkAnimation = Tween<double>(
      begin: 1.0,
      end: 0.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _controller.forward();
        }
      });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: widget.containerWidth,
        height: widget.containerHeight,
        decoration: widget.containerDecoration ??
            BoxDecoration(
              border: Border.all(
                width: 3,
                color: Color(0xD3D3D3FF).withOpacity(_blinkAnimation.value),
              ),
            ),
        child: Center(
          child: Container(
            width: widget.circleSize,
            height: widget.circleSize,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: widget.circleColor,
            ),
            child: widget.child ??
                Center(
                  child: Text(
                    'Tap',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ),
          ),
        ),
      ),
    );
  }
}
