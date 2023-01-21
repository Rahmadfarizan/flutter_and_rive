import 'package:flutter/material.dart';
import 'package:flutter_and_rive/components/carousel.dart';
import 'package:flutter_and_rive/components/custom_controller.dart';
import 'package:flutter_and_rive/components/example_state_machine.dart';
import 'package:flutter_and_rive/components/liquid_download.dart';
import 'package:flutter_and_rive/components/little_machine.dart';
import 'package:flutter_and_rive/components/play_one_shot_animation.dart';
import 'package:flutter_and_rive/components/play_pause_animation.dart';
import 'package:flutter_and_rive/components/play_pause_animation_beastoid.dart';
import 'package:flutter_and_rive/components/simple_animation.dart';
import 'package:flutter_and_rive/components/simple_machine_listener.dart';
import 'package:flutter_and_rive/components/simple_network_animation.dart';
import 'package:flutter_and_rive/components/simple_state_machine.dart';
import 'package:flutter_and_rive/components/state_machine_skills.dart';

void main() => runApp(
      MaterialApp(
        title: 'Rive Example',
        home: const RiveExampleApp(),
        darkTheme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: _backgroundColor,
          appBarTheme: const AppBarTheme(backgroundColor: _appBarColor),
          colorScheme:
              ColorScheme.fromSwatch().copyWith(primary: _primaryColor),
        ),
        themeMode: ThemeMode.dark,
      ),
    );

/// An example application demoing Rive.
class RiveExampleApp extends StatefulWidget {
  const RiveExampleApp({Key? key}) : super(key: key);

  @override
  State<RiveExampleApp> createState() => _RiveExampleAppState();
}

class _RiveExampleAppState extends State<RiveExampleApp> {
  // Example animations
  final _pages = [
    const _Page('Simple Animation - Asset', SimpleAssetAnimation()),
    const _Page('Simple Animation - Network', SimpleNetworkAnimation()),
    const _Page('Play/Pause Animation', PlayPauseAnimation()),
    const _Page('Play One-Shot Animation', PlayOneShotAnimation()),
    const _Page('Button State Machine', ExampleStateMachine()),
    const _Page('Skills Machine', StateMachineSkills()),
    const _Page('State Beastoid', StateBeastoid()),
    const _Page('Little Machine', LittleMachine()),
    const _Page('Liquid Download', LiquidDownload()),
    const _Page('Custom Controller - Speed', SpeedyAnimation()),
    const _Page('Simple State Machine', SimpleStateMachine()),
    const _Page('State Machine with Listener', StateMachineListener()),
    const _Page('Animation Carousel', AnimationCarousel()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Rive Examples')),
      body: Center(
        child: ListView.separated(
          shrinkWrap: true,
          itemBuilder: (context, index) => _NavButton(page: _pages[index]),
          separatorBuilder: (context, index) => const SizedBox(height: 16),
          itemCount: _pages.length,
        ),
      ),
    );
  }
}

/// Class used to organize demo pages.
class _Page {
  final String name;
  final Widget page;

  const _Page(this.name, this.page);
}

/// Button to navigate to demo pages.
class _NavButton extends StatelessWidget {
  const _NavButton({required this.page});

  final _Page page;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: SizedBox(
          width: 250,
          child: Center(
            child: Text(
              page.name,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute<void>(
              builder: (context) => page.page,
            ),
          );
        },
      ),
    );
  }
}

const _appBarColor = Color(0xFF323232);
const _backgroundColor = Color(0xFF1D1D1D);
const _primaryColor = Color(0xFF57A5E0);
