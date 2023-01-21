/// Demonstrates how to play and pause a looping animation
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class StateBeastoid extends StatefulWidget {
  const StateBeastoid({Key? key}) : super(key: key);

  @override
  State<StateBeastoid> createState() => _StateBeastoidState();
}

class _StateBeastoidState extends State<StateBeastoid> {
  /// Controller for playback
  late RiveAnimationController _controller;
  String animations = "Idle";

  /// Toggles between play and pause animation states
  void _togglePlay() => setState(() {
        // _controller.isActive = !_controller.isActive;
        if (animations == "Idle") {
          animations = "Walk";
          _controller = SimpleAnimation('Walk');
        } else {
          _controller = SimpleAnimation('Idle');
          animations = "Idle";
        }
      });

  /// Tracks if the animation is playing by whether controller is running
  bool get isPlaying => _controller.isActive;

  @override
  void initState() {
    super.initState();
    _controller = SimpleAnimation(animations);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animation Example'),
      ),
      body: RiveAnimation.asset(
        'assets/beastoid.riv',
        controllers: [_controller],
        // animations: ['Idle', 'Walk'],
        // Update the play state when the widget's initialized
        // onInit: (_) => setState(() {}),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _togglePlay,
        tooltip: isPlaying ? 'Pause' : 'Play',
        child: Icon(
          isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }
}
