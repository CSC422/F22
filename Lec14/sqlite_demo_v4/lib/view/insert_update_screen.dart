import 'package:flutter/material.dart';
import '../constants/constants.dart';
import '../data/pets_repository.dart';
import '../domain/pet.dart';

class InsertUpdateScreen extends StatefulWidget {
  final bool update;
  const InsertUpdateScreen({super.key, this.update = false});

  @override
  State<InsertUpdateScreen> createState() => _InsertUpdateScreenState();
}

class _InsertUpdateScreenState extends State<InsertUpdateScreen> {
  final petsRepository = PetsRepository.instance;
  //controllers used in insert/update operation UI
  TextEditingController idUpdateController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController speciesController = TextEditingController();
  TextEditingController imgUrlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          widget.update
              ? Container(
                  padding: const EdgeInsets.all(20),
                  child: TextField(
                    controller: idUpdateController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Pet id',
                    ),
                    onChanged: (id) {
                      if (widget.update) {
                        petsRepository.fetchPet(id).then((pet) {
                          setState(() {
                            nameController.text = pet.name;
                            ageController.text = pet.age.toString();
                            speciesController.text = pet.species;
                            imgUrlController.text = pet.imgUrl;
                          });
                        });
                      }
                    },
                  ),
                )
              : const SizedBox(),
          Container(
            padding: const EdgeInsets.all(20),
            child: TextField(
              controller: nameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Pet Name',
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: TextField(
              controller: ageController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Pet age',
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: TextField(
              controller: speciesController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Pet Species',
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: TextField(
              controller: imgUrlController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Pet Image Url',
              ),
            ),
          ),
          widget.update
              ? ElevatedButton(
                  child: const Text('Update Pet Details'),
                  onPressed: () {
                    Pet pet = Pet(
                      id: int.parse(idUpdateController.text),
                      name: nameController.text,
                      age: int.parse(ageController.text),
                      species: speciesController.text,
                      imgUrl: imgUrlController.text,
                    );

                    petsRepository.update(pet).then((rowsAffected) =>
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('$rowsAffected rows updated'))));
                  },
                )
              : ElevatedButton(
                  child: const Text('Insert Pet Details'),
                  onPressed: () {
                    String name = nameController.text;
                    int age = int.parse(ageController.text);
                    String species = speciesController.text;
                    String imgUrl = imgUrlController.text;
                    petsRepository.insert(name, age, species, imgUrl).then(
                        (id) => ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content:
                                    Text('Pet $id inserted successfully'))));
                  },
                ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.amber,
            ),
            onPressed: () {
              for (var pet in kDummyPetsData) {
                petsRepository.insert(
                    pet.name, pet.age, pet.species, pet.imgUrl);
              }
            },
            child: const Text('Fill Dummy Data'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    ageController.dispose();
    super.dispose();
  }
}
