import 'package:interactive_story/model/story_model.dart';

class IStoryData {
  int storyLevel = 0;
  List<Story> storyDB = [
    Story(
        storyText: 'You see a ship in the ocean, do you want to go aboard?',
        choice1: 'Go aboard the ship',
        choice2: 'Look for another adventure',
        choice3: 'Go home and sleep!'),
    Story(
        storyText: 'It is a pirate ship, what should you do?',
        choice1: 'Wow, an amazing adventure',
        choice2: 'Run back home',
        choice3: 'Call the police'),
    Story(
        storyText: 'Enter dark forest?',
        choice1: 'Yes',
        choice2: 'Run back home',
        choice3: 'Restart'),
    Story(
        storyText: 'You are adventurous, \n but watch your moral campus',
        choice1: "Restart",
        choice2: '',
        choice3: ''),
    Story(
        storyText: 'You are so brave',
        choice1: "Restart",
        choice2: '',
        choice3: ''),
    Story(
        storyText: 'This is a great option \n you should never join pirates',
        choice1: 'Look for another adventure',
        choice2: 'Restart',
        choice3: ''),
    Story(
        storyText: 'You need to explore more',
        choice1: "Restart",
        choice2: '',
        choice3: ''),
  ];

  Story getStory() {
    return Story(
        storyText: storyDB[storyLevel].storyText,
        choice1: storyDB[storyLevel].choice1,
        choice2: storyDB[storyLevel].choice2,
        choice3: storyDB[storyLevel].choice3);
  }

  void nextStory(int choice) {
    if (choice == 1 && storyLevel == 0) {
      storyLevel = 1;
    } else if (choice == 2 && storyLevel == 0) {
      storyLevel = 2;
    } else if (choice == 3 && storyLevel == 0) {
      storyLevel = 6;
    } else if (choice == 1 && storyLevel == 1) {
      storyLevel = 3;
    } else if (choice == 2 && storyLevel == 1) {
      storyLevel = 6;
    } else if (choice == 3 && storyLevel == 1) {
      storyLevel = 5;
    } else if (choice == 1 && storyLevel == 2) {
      storyLevel = 4;
    } else if (choice == 2 && storyLevel == 2) {
      storyLevel = 6;
    } else if (choice == 3 && storyLevel == 2) {
      restartGame();
    } else if (storyLevel >= 3) {
      restartGame();
    }
    // ignore: avoid_print
    print('Story Level $storyLevel');
  }

  void restartGame() {
    storyLevel = 0;
  }

  bool isVisible() {
    return (storyLevel < 3);
  }
}
