import 'package:flutter/material.dart';
import 'package:interactive_story/data/story.dart';
import 'choice_button.dart';

class StoryUI extends StatefulWidget {
  const StoryUI({super.key});

  @override
  State<StoryUI> createState() => _StoryUIState();
}

class _StoryUIState extends State<StoryUI> {
  final IStoryData appLogic = IStoryData();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(180, 230, 230, 255),
            border: Border.all(
              color: Colors.blue[900]!,
              width: 4,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          height: 240,
          margin: const EdgeInsets.all(12.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                appLogic.getStory().storyText,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.blue[800],
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        Column(
          children: choiceButtons(),
        ),
      ],
    );
  }

  List<Widget> choiceButtons() {
    List<Widget> choices = [];
    final List myColors = [
      Colors.teal,
      Colors.blue,
      Colors.amber,
    ];

    for (int i = 1; i < 4; i++) {
      choices.add(ChoiceButton(
        title: appLogic.getStory().getChoice(i),
        onpress: () {
          setState(() {
            appLogic.nextStory(i);
          });
        },
        color: myColors[i - 1],
        visibilty: (i == 1 || appLogic.isVisible()),
      ));
    }

    return choices;
  }
}
