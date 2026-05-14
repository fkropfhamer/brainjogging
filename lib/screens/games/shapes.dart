import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Shapes extends StatefulWidget {
  const Shapes({super.key});

  @override
  State<Shapes> createState() => _ShapesState();
}

class _ShapesState extends State<Shapes> {
  var shapes = [
    Circle(50, 50, Colors.black),
    Rectangle(100, 100, Colors.greenAccent),
    Rectangle(100, 50, Colors.lightBlueAccent),
    Circle(200, 0, Colors.deepOrange)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Shapes")),
      body: Center(
          child: CustomPaint(
            size: Size(500, 500),
            painter: ShapesPainter(shapes),
            child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    shapes = [Circle(0, 0, Colors.green)];
                  });
                },
                child: const Text("test")),
          ),
        ),
    );
  }
}

abstract class Shape {
  final double x;
  final double y;
  final Color color;

  late final Paint paint;

  Shape(this.x, this.y, this.color) {
    paint = Paint()
      ..style = PaintingStyle.fill
      ..color = color;
  }

  void draw(Canvas canvas);
}

class Circle extends Shape {
  Circle(super.x, super.y, super.color);

  @override
  void draw(Canvas canvas) {
    canvas.drawCircle(Offset(x, y), 50, paint);
  }
}

class Rectangle extends Shape {
  Rectangle(super.x, super.y, super.color);

  @override
  void draw(Canvas canvas) {
    canvas.drawRect(Rect.fromLTWH(x, y, 50, 50), paint);
  }
}

class ShapesPainter extends CustomPainter {
  final List<Shape> shapes;

  ShapesPainter(this.shapes);

  @override
  void paint(Canvas canvas, Size size) {
    for (var shape in shapes) {
      shape.draw(canvas);
    }
  }

  @override
  bool shouldRepaint(covariant ShapesPainter oldDelegate) {
    return listEquals(shapes, oldDelegate.shapes);
  }
}
