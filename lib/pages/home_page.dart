import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

const primaryColor = Color(0xFF0c7bbb);

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.sizeOf(context);
    const textColor = Color(0xFF333333);

    final isPortrait = size.height >= size.width;
    // 回転させて表示

    return Scaffold(
      body: RotatedBox(
        quarterTurns: isPortrait ? 1 : 0,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              child: _TriangleBanner(
                size: Size(size.width * 0.1, size.width * 0.1),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(size.width * 0.08),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '初星学園　プロデューサー科',
                    style: textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: textColor,
                    ),
                  ),
                  const Gap(16),
                  SelectableText(
                    'ダイス',
                    style: textTheme.displayLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    ),
                  ),
                  const Gap(4),
                  Text(
                    '@dicenull',
                    style: textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    ),
                  ),
                  const Spacer(),
                  const Row(
                    children: [
                      Icon(Icons.home_outlined, size: 16, color: textColor),
                      Gap(2),
                      Text('6VN36M29', style: TextStyle(color: textColor)),
                    ],
                  ),
                  const Row(
                    children: [
                      Icon(Icons.person_outlined, size: 16, color: textColor),
                      Gap(2),
                      Text(
                        '@dicenull',
                        style: TextStyle(color: textColor),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TriangleBanner extends StatelessWidget {
  const _TriangleBanner({
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: size,
      painter: _TrianglePainter(),
      child: SizedBox(
        width: size.width,
        height: size.height,
      ),
    );
  }
}

class _TrianglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = primaryColor
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width, 0)
      ..lineTo(0, size.height)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
