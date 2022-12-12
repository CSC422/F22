import 'dart:convert';

class Pet {
  final int? id;
  final String name;
  final int age;
  final String species;
  final String imgUrl;
  Pet({
    required this.id,
    required this.name,
    required this.age,
    required this.species,
    required this.imgUrl,
  });

  Pet copyWith({
    int? id,
    String? name,
    int? age,
    String? species,
    String? imgUrl,
  }) {
    return Pet(
      id: id ?? this.id,
      name: name ?? this.name,
      age: age ?? this.age,
      species: species ?? this.species,
      imgUrl: imgUrl ?? this.imgUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'age': age,
      'species': species,
      'imgUrl': imgUrl,
    };
  }

  factory Pet.fromMap(Map<String, dynamic> map) {
    return Pet(
      id: map['id']?.toInt(),
      name: map['name'] ?? '',
      age: map['age']?.toInt() ?? 0,
      species: map['species'] ?? '',
      imgUrl: map['imgUrl'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Pet.fromJson(String source) => Pet.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Pet(id: $id, name: $name, age: $age, species: $species, imgUrl: $imgUrl)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Pet &&
        other.id == id &&
        other.name == name &&
        other.age == age &&
        other.species == species &&
        other.imgUrl == imgUrl;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        age.hashCode ^
        species.hashCode ^
        imgUrl.hashCode;
  }

  factory Pet.empty(id) {
    return Pet(
      id: 0,
      name: '',
      age: 0,
      species: '',
      imgUrl:'',
    );
  }
}
