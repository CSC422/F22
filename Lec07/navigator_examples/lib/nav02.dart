import 'package:flutter/material.dart';

void main() {
  runApp(const Nav2App());
}

class Nav2App extends StatelessWidget {
  const Nav2App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/details': (context) => const DetailScreen(),
        '/third': (context) => const ThirdScreen(),
      },
    );
  }
}

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            TextButton(
              child: const Text('View DetailScreen'),
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/details',
                );
              },
            ),
            TextButton(
              child: const Text('View ThirdScreen'),
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/third',
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: TextButton(
          style: TextButton.styleFrom(foregroundColor: Colors.green[600]),
          child: const Text('Pop!'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
