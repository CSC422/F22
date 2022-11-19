/// Demonstrates how to create a custom controller to change the speed of an
/// animation

import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class SpeedyAnimation extends StatefulWidget {
  const SpeedyAnimation({Key? key}) : super(key: key);

  @override
  State<SpeedyAnimation> createState() => _SpeedyAnimationState();
}

class _SpeedyAnimationState extends State<SpeedyAnimation> {
  final sc = SpeedController('curves', speedMultiplier: 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Controller'),
      ),
      body: Center(
        child: RiveAnimation.network(
          'https://cdn.rive.app/animations/vehicles.riv',
          fit: BoxFit.cover,
          animations: const ['idle'],
          controllers: [sc],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: sc.speedUp,
        tooltip: 'Speed Up',
        child: const Icon(Icons.speed),
      ),
    );
  }
}

class SpeedController extends SimpleAnimation {
  double speedMultiplier;

  SpeedController(
    String animationName, {
    double mix = 1,
    this.speedMultiplier = 1.2,
  }) : super(animationName, mix: mix);

  @override
  void apply(RuntimeArtboard artboard, double elapsedSeconds) {
    if (instance == null || !instance!.keepGoing) {
      isActive = false;
    }
    instance!
      ..animation.apply(instance!.time, coreContext: artboard, mix: mix)
      ..advance(elapsedSeconds * speedMultiplier);
  }

  speedUp() {
    speedMultiplier += 0.5;
  }
}
