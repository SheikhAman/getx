import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late RiveAnimationController _controller;

  void _togglePlay() =>
      setState(() => _controller.isActive = !_controller.isActive);

  /// Tracks if the animation is playing by whether controller is running
  bool get isPlaying => _controller.isActive;

  @override
  void initState() {
    super.initState();
    _controller = SimpleAnimation('to_light');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Center(
                child: Icon(
                  Icons.settings,
                  size: 144,
                  color: Colors.grey,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('Version 1.0.0'),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.shop),
              title: Text('About Us'),
            ),
            Divider(),
            Flexible(
              child: Center(
                child: RiveAnimation.asset(
                  'assets/anims/git_theme.riv',
                  controllers: [_controller],
                  // Update the play state when the widget's initialized
                  onInit: (_) => setState(() {}),
                ),
              ),
            ),
          ],
        ),
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
