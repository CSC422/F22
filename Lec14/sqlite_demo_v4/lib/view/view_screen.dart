import 'package:flutter/material.dart';
import '../data/pets_repository.dart';
import '../domain/pet.dart';

class ViewScreen extends StatefulWidget {
  const ViewScreen({super.key});

  @override
  State<ViewScreen> createState() => _ViewScreenState();
}

class _ViewScreenState extends State<ViewScreen> {
  final petsRepository = PetsRepository.instance;
  List<Pet> pets = [];

  @override
  void initState() {
    petsRepository.fetchPetList().then((value) {
      setState(() {
        pets = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: pets.length + 1,
      itemBuilder: (BuildContext context, int index) {
        if (index == pets.length) {
          return ElevatedButton(
            child: const Text('Refresh'),
            onPressed: () {
              petsRepository.fetchPetList().then((value) {
                setState(() {
                  pets = value;
                });
              });
            },
          );
        }
        return Card(
          child: ListTile(
            title: Text('[${pets[index].id}] ${pets[index].name}'),
            subtitle: Text('Age: ${pets[index].age.toString()}'),
            leading: CircleAvatar(
              backgroundImage: NetworkImage(pets[index].imgUrl != ''
                  ? pets[index].imgUrl
                  : 'https://png.pngtree.com/png-vector/20210604/ourmid/pngtree-gray-network-placeholder-png-image_3416659.jpg'),
            ),
            trailing: const Icon(Icons.star),
          ),
        );
        // return SizedBox(
        //   height: 40,
        //   child: Center(
        //     child: Text(
        //       '[${pets[index].id}] ${pets[index].name} - ${pets[index].age} age',
        //       style: const TextStyle(fontSize: 18),
        //     ),
        //   ),
        // );
      },
    );
  }
}
