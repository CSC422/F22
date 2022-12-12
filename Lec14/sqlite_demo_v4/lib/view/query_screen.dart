import 'package:flutter/material.dart';
import '../data/pets_repository.dart';
import '../domain/pet.dart';

class QueryScreen extends StatefulWidget {
  const QueryScreen({super.key});

  @override
  State<QueryScreen> createState() => _QueryScreenState();
}

class _QueryScreenState extends State<QueryScreen> {
  final petsRepository = PetsRepository.instance;

  List<Pet> petsByName = [];
  //controllers used in query operation UI
  TextEditingController queryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(20),
            height: 100,
            child: TextField(
              controller: queryController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Pet Name',
              ),
              onChanged: (text) {
                if (text.length >= 2) {
                  petsRepository.fetchPetListByName(text).then((value) {
                    setState(() {
                      petsByName = value;
                    });
                  });
                } else {
                  setState(() {
                    petsByName.clear();
                  });
                }
              },
            ),
          ),
          SizedBox(
            height: 300,
            child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: petsByName.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 50,
                  margin: const EdgeInsets.all(2),
                  child: Center(
                    child: Text(
                      '[${petsByName[index].id}] ${petsByName[index].name} - ${petsByName[index].age} age',
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    queryController.dispose();
    super.dispose();
  }
}
