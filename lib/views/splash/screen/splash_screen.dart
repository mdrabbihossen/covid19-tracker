import 'dart:async';

import 'package:covid19_tracker/views/world_stats/screens/world_state.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(vsync: this, duration: const Duration(seconds: 3))
        ..repeat();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const WorldStats(),
        ),
      );
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: _controller,
<<<<<<< HEAD
              child: Image.asset('assets/images/virus.png'),
              builder: (context, child) {
                return Transform.rotate(
                    angle: _controller.value * 2.0 * math.pi, child: child);
              },
            )
=======
              child: Center(
                child: Image.asset(
                  'assets/images/virus.png',
                  width: 200,
                  height: 200,
                ),
              ),
              builder: (context, Widget? child) {
                return Transform.rotate(
                  angle: _controller.value * 2.6 * math.pi,
                  child: child,
                );
              },
            ),
            SizedBox(height: size.height * .03),
             const Align(
               alignment: Alignment.center,
               child: Text(
                'COVID-19 Tracker',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
            ),
             ),
>>>>>>> 400e9c283ba1cb325a9beb55869aef23d4b1095f
          ],
        ),
      ),
    );
  }
}
