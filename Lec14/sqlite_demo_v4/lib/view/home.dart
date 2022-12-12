import 'package:flutter/material.dart';
import '../data/pets_repository.dart';
import '../view/delete_screen.dart';
import 'insert_update_screen.dart';
import '../view/query_screen.dart';
import '../view/view_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final petsRepository = PetsRepository.instance;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Tab(
                text: 'Insert',
              ),
              Tab(
                text: 'View',
              ),
              Tab(
                text: 'Query',
              ),
              Tab(
                text: 'Update',
              ),
              Tab(
                text: 'Delete',
              ),
            ],
          ),
          title: const Text('SQLite Demo'),
        ),
        body: const SafeArea(
          child: TabBarView(
            children: [
              InsertUpdateScreen(),
              ViewScreen(),
              QueryScreen(),
              InsertUpdateScreen(update: true),
              DeleteScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
