import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../constants/constants.dart';
import '../data/db_helper.dart';
import '../domain/pet.dart';

class PetsRepository {
  //singleton pattern
  static final PetsRepository instance = PetsRepository._();
  PetsRepository._();

  final _dbHelper = DBHelper.instance;

  Future<int> insert(name, age, species, imgUrl) async {
    // row to insert
    Map<String, dynamic> row = {
      Columns.name.name: name,
      Columns.age.name: age,
      Columns.species.name: species,
      Columns.imgUrl.name: imgUrl,
    };
    Pet pet = Pet.fromMap(row);
    debugPrint('inserting $pet');
    final id = await _dbHelper.insert(pet);
    debugPrint('inserted row id: $id');
    return id;
  }

  Future<List<Pet>> fetchPetList() async {
    final allRows = await _dbHelper.queryAllRows();
    List<Pet> pets = [];
    for (var row in allRows) {
      pets.add(Pet.fromMap(row));
    }
    return pets;
  }

  Future<List<Pet>> fetchPetListByName(name) async {
    final allRows = await _dbHelper.queryRows(name);
    List<Pet> petsByName = [];
    for (var row in allRows) {
      petsByName.add(Pet.fromMap(row));
    }
    return petsByName;
  }

  Future<Pet> fetchPet(id) async {
    final allRows = await _dbHelper.getById(id);
    return allRows.isEmpty ? Pet.empty(id) : Pet.fromMap(allRows[0]);
  }

  Future<int> update(Pet pet) async {
    final rowsAffected = await _dbHelper.update(pet);
    return rowsAffected;
  }

  Future<int> delete(id) async {
    // Assuming that the number of rows is the id for the last row.
    final rowsDeleted = await _dbHelper.delete(id);
    return rowsDeleted;
  }

  Future<void> reset() async {
    return await _dbHelper.reset();
  }

  void fillDummyData() {
    for (var pet in kDummyPetsData) {
      insert(pet.name, pet.age, pet.species, pet.imgUrl);
    }
  }
}
