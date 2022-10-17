import 'package:flutter/material.dart';
import 'package:interactive_story/widgets/story_ui.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Interactive Story'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
              decoration: BoxDecoration(
                color: const Color(0xff7c94b6),
                image: const DecorationImage(
                  image: AssetImage('assets/ocean.jpeg'),
                  fit: BoxFit.fill,
                  opacity: 0.4,
                ),
                border: Border.all(
                  color: Colors.black,
                  width: 4,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 12.0),
              child: const StoryUI()),
        ),
      ),
    );
  }
}
