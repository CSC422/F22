enum Gender { male, female }

class Record {
  final int id;
  final String name;
  int votes;
  final Gender gender;

  Record(this.name, this.votes, this.gender, this.id);

  Record.fromMap(Map<String, dynamic> map)
      : assert(map['id'] != null),
        assert(map['name'] != null),
        assert(map['votes'] != null),
        assert(map['gender'] != null),
        id = map['id'],
        name = map['name'],
        votes = map['votes'],
        gender = map['gender'].toString().toLowerCase() == Gender.male.name
            ? Gender.male
            : Gender.female;

  @override
  String toString() {
    return "Record: {$id:$name:$votes:$gender}";
  }
}
