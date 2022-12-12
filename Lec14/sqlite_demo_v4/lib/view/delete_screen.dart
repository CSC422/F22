import 'package:flutter/material.dart';
import '../constants/constants.dart';
import '../data/pets_repository.dart';

class DeleteScreen extends StatefulWidget {
  const DeleteScreen({super.key});

  @override
  State<DeleteScreen> createState() => _DeleteScreenState();
}

class _DeleteScreenState extends State<DeleteScreen> {
  final petsRepository = PetsRepository.instance;
  //controllers used in delete operation UI
  TextEditingController idDeleteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(20),
            child: TextField(
              controller: idDeleteController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Pet id',
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                child: const Text('Delete'),
                onPressed: () {
                  int id = int.parse(idDeleteController.text);
                  petsRepository.delete(id).then((rowsDeleted) =>
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                              'Deleted $rowsDeleted row(s) : for id = $id'))));
                },
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                child: const Text('Reset'),
                onPressed: () {
                  petsRepository.reset().then((rowsDeleted) =>
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Reset Table $kTableName'))));
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    idDeleteController.dispose();
    super.dispose();
  }
}
