class Story {
  String storyText;
  String choice1;
  String choice2;
  String choice3;
  Story({
    required this.storyText,
    required this.choice1,
    required this.choice2,
    required this.choice3,
  });

  String getChoice(int i) {
    if (i == 1) {
      return choice1;
    } else if (i == 2) {
      return choice2;
    } else {
      return choice3;
    }
  }
}
