import "dart:math";

// dummy data Used for testing
class MyData {
  final random = Random();
  List<Set> names = [
    {
      'Ahmed',
      'Hassan',
      'Ali',
      'Yousef',
      'Hesham',
      'Steven',
      'Mahmoud',
      'Omar',
    },
    {
      'Nada',
      'Hana',
      'Sara',
      'Noura',
      'Salma',
      'Sahar',
      'Samar',
      'Doha',
      'Dina',
    },
  ];

  var db = [];

  bool addName() {
    int gender = random.nextInt(2);
    if (names[gender].isNotEmpty) {
      int index = random.nextInt(names[gender].length);
      var element = names[gender].elementAt(index);
      names[gender].remove(element);

      db.add({
        'id': IDGen.nextID(),
        'name': element,
        'votes': 0,
        'gender': gender == 0 ? 'male' : 'female',
      });
    }
    return names[gender].isNotEmpty;
  }

  void reset() {
    db.clear();
    names = [
      {
        'Ahmed',
        'Hassan',
        'Ali',
        'Yousef',
        'Hesham',
        'Steven',
        'Mahmoud',
        'Omar',
      },
      {
        'Nada',
        'Hana',
        'Sara',
        'Noura',
        'Salma',
        'Sahar',
        'Samar',
        'Doha',
        'Dina',
      },
    ];
  }
}

class IDGen {
  static int id = 0;
  static int nextID() => id++;
}
