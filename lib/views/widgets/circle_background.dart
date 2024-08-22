import 'dart:math';
import 'package:flutter/material.dart';

class CircleBackground extends StatefulWidget {
  final int numberOfCircles;
  final List<Color> colors;

  const CircleBackground({
    Key? key,
    this.numberOfCircles = 10,
    this.colors = const [Color.fromRGBO(7, 98, 217, 1.0), Colors.black],
  }) : super(key: key);

  @override
  _CircleBackgroundState createState() => _CircleBackgroundState();
}

class _CircleBackgroundState extends State<CircleBackground> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),  // Aumentamos a duração
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOutCubic,  // Curva mais suave
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return CustomPaint(
          painter: CircleAndOvalPainter(
            numberOfCircles: widget.numberOfCircles,
            colors: widget.colors,
            animation: _animation,
          ),
          child: Container(),
        );
      },
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;
    if (bottomInset > 0) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }
}

class CircleAndOvalPainter extends CustomPainter {
  final int numberOfCircles;
  final List<Color> colors;
  final Animation<double> animation;
  final Random random = Random();
  late List<Offset> circlePositions;
  late List<double> circleRadii;
  late List<Color> circleColors;

  CircleAndOvalPainter({
    required this.numberOfCircles,
    required this.colors,
    required this.animation,
  }) : super(repaint: animation) {
    circlePositions = List.generate(numberOfCircles, (_) => Offset.zero);
    circleRadii = List.generate(numberOfCircles, (_) => 0.0);
    circleColors = List.generate(numberOfCircles, (_) => Colors.white);
  }

  @override
  void paint(Canvas canvas, Size size) {
    final double animationValue = animation.value;

    // Definir as cores para cada camada
    final List<Color> layerColors = [
      Color.fromRGBO(5, 199, 242, 1.0), //azul claro
      Color.fromRGBO(1, 1, 1, 1.0), //preto
      Color.fromRGBO(4, 75, 217, 1.0), //azul escuro
    ];

    // Definir os retângulos para cada camada
    final List<Rect> layerRects = [
      Rect.fromLTRB(
        -size.width * 0.25,
        -size.height * 0.55 - (size.height * 0.05 * animationValue),
        size.width * 1.48,
        size.height * 0.863 - (size.height * 0.05 * animationValue),
      ),
      Rect.fromLTRB(0
          -size.width * 0.22,
        -size.height * 0.52 - (size.height * 0.05 * animationValue),
        size.width * 1.6,
        size.height * 0.854 - (size.height * 0.05 * animationValue),
      ),
      Rect.fromLTRB(
        -size.width * 0.2,
        -size.height * 0.5 - (size.height * 0.05 * animationValue),
        size.width * 1.6,
        size.height * 0.85 - (size.height * 0.05 * animationValue),
      ),
    ];

    // Desenhar cada camada
    for (int i = 0; i < 3; i++) {
      final ovalPaint = Paint()
        ..color = layerColors[i]
        ..style = PaintingStyle.fill;

      canvas.drawOval(layerRects[i], ovalPaint);
    }

    // Desenhar círculos aleatórios
    for (int i = 0; i < numberOfCircles; i++) {
      if (circlePositions[i] == Offset.zero) {
        circlePositions[i] = Offset(
          random.nextDouble() * size.width,
          random.nextDouble() * size.height,
        );
        circleRadii[i] = random.nextDouble() * 20 + 10;
        circleColors[i] = colors[random.nextInt(colors.length)].withOpacity(0);
      }

      double y = circlePositions[i].dy - (size.height * 0.15 * animationValue);

      final paint = Paint()
        ..color = circleColors[i]
        ..style = PaintingStyle.fill;

      canvas.drawCircle(Offset(circlePositions[i].dx, y), circleRadii[i], paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
