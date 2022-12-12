import '../domain/pet.dart';

enum Columns {
  id,
  name,
  age,
  createdAt,
  updatedAt,
  species,
  imgUrl,
}

const kDatabaseName = "animals.db";
const kDatabaseVersion = 1;

const kTableName = 'pets_table';

const kAppTitle = 'Pets Demo';

final kDummyPetsData = [
  Pet.fromMap({
    'id': 1,
    'name': 'Goofy',
    'age': 5,
    'species': 'Dog',
    'imgUrl':
        'https://upload.wikimedia.org/wikipedia/en/thumb/5/50/Goofy_Duckipedia.png/220px-Goofy_Duckipedia.png',
  }),
  Pet.fromMap({
    'id': 2,
    'name': 'kitty',
    'age': 2,
    'species': 'cat',
    'imgUrl': 'https://images.unsplash.com/photo-1547721064-da6cfb341d50',
  }),
  Pet.fromMap({
    'id': 3,
    'name': 'Lassie',
    'age': 4,
    'species': 'Dog',
    'imgUrl':
        'https://upload.wikimedia.org/wikipedia/en/thumb/5/5d/Lassie_1994_movie_poster.jpg/220px-Lassie_1994_movie_poster.jpg',
  }),
];
