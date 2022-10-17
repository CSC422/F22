import 'package:flutter/material.dart';

// In Android, a route is equivalent to an Activity. In iOS, a route is equivalent to a ViewController.
// The push() method adds a Route to the stack of routes managed by the Navigator.
// Where does the Route come from? You can create your own, or use a MaterialPageRoute

void main() {
  runApp(const Nav2App());
}

class Nav2App extends StatelessWidget {
  const Nav2App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: TextButton(
          style: TextButton.styleFrom(foregroundColor: Colors.blue[600]),
          child: const Text('View Details'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  //fullscreenDialog: true,
                  builder: (context) {
                return const DetailScreen();
              }),
            );
          },
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
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.green[800]),
          child: const Text('Back - Pop!'),
          // close the second route and return to the first? By using the Navigator.pop() method.
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
