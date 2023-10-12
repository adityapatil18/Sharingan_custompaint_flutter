import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class Sharingan extends StatefulWidget {
  Sharingan({Key? key}) : super(key: key);

  @override
  State<Sharingan> createState() => _SharinganState();
}

class _SharinganState extends State<Sharingan> with TickerProviderStateMixin {
  late AnimationController _controller = AnimationController(
    vsync: this,
    duration: Duration(seconds: 5),
  )..repeat(reverse: true);

  late Animation<double> _animation = Tween<double>(begin: 0, end: 5).animate(
      CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn));

  AudioPlayer _audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    _playMusic(); // Play music when the widget is initialized.
  }

  void _playMusic() async {
    await _audioPlayer.play(AssetSource(
        'sharingan.mp3')); // Replace with the path to your music file.
  }

  @override
  void dispose() {
    _controller.dispose();
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sharingan',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        child: RotationTransition(
          turns: _animation,
          child: CustomPaint(
            painter: SharinganPainter(),
          ),
        ),
      ),
    );
  }
}

class SharinganPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width / 2;
    final h = size.height / 2;
    final blackCircle = Paint()
      ..color = Colors.black
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final redCircle = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.fill;

    final innerCircle = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;

    final center = Offset(size.width / 2, size.height / 2);

    final sharingan = Path();
    sharingan.moveTo(w, h - 100);
    sharingan.arcToPoint(
      Offset(w - 25, h + 10),
      radius: const Radius.circular(100),
      clockwise: false,
    );
    sharingan.arcToPoint(
      Offset(w - 80, h + 60),
      radius: const Radius.circular(100),
      clockwise: true,
    );
    sharingan.arcToPoint(
      Offset(w + 20, h + 20),
      radius: const Radius.circular(100),
      clockwise: false,
    );
    sharingan.arcToPoint(
      Offset(w + 90, h + 40),
      radius: const Radius.circular(100),
      clockwise: true,
    );
    sharingan.arcToPoint(
      Offset(w + 10, h - 25),
      radius: const Radius.circular(100),
      clockwise: false,
    );
    sharingan.arcToPoint(
      Offset(w, h - 100),
      radius: const Radius.circular(100),
      clockwise: true,
    );

    canvas.drawCircle(center, 100, redCircle);
    canvas.drawCircle(center, 60, blackCircle);
    canvas.drawPath(sharingan, paint);
    canvas.drawCircle(center, 20, innerCircle);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
