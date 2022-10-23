class User {
  static const String reading = 'reading';
  static const String chess = 'chess';
  static const String traveling = 'traveling';
  String firstName = '';
  String lastName = '';
  Map<String, bool> interests = {
    reading: false,
    chess: false,
    traveling: false
  };
  bool newsletter = true;

  save() {
    //code to save to database or server
    print('saving user data');
    print('$firstName $lastName');
    if (interests[reading]!) {
      print(reading);
    }

    if (interests[chess]!) {
      print(chess);
    }

    if (interests[traveling]!) {
      print(traveling);
    }

    if (newsletter) {
      print('get newsletter');
    }
  }
}
