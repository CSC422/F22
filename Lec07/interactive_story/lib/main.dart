import 'package:flutter/material.dart';
import 'package:interactive_story/widgets/main_view.dart';

void main() => runApp(const InteractiveStory());

class InteractiveStory extends StatelessWidget {
  const InteractiveStory({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: const MainView(),
      debugShowCheckedModeBanner: false,
    );
  }
}
