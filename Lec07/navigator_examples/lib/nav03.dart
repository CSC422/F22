import 'package:flutter/material.dart';

void main() {
  runApp(const Nav2App());
}

class Nav2App extends StatelessWidget {
  const Nav2App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: (settings) {
        // Handle '/'
        if (settings.name == '/') {
          return MaterialPageRoute(builder: (context) => const HomeScreen());
        }

        // Handle '/details/:id'
        var uri = Uri.parse(settings.name!);
        if (uri.pathSegments.length == 2 &&
            uri.pathSegments.first == 'details') {
          var id = uri.pathSegments[1];
          return MaterialPageRoute(builder: (context) => DetailScreen(id: id));
        }
        // Handle anyother path
        return MaterialPageRoute(builder: (context) => const UnknownScreen());
      },
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
        child: Container(
          color: Colors.blue[50],
          child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextButton(
                  child: const Text('View Details'),
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/details/42',
                    );
                  },
                ),
                TextButton(
                  child: const Text('Random'),
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/other',
                    );
                  },
                ),
              ]),
        ),
      ),
    );
  }
}

class DetailScreen extends StatefulWidget {
  final String id;

  const DetailScreen({
    super.key,
    required this.id,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Viewing details for item ${widget.id}'),
            TextButton(
              child: const Text('Pop!'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class UnknownScreen extends StatelessWidget {
  const UnknownScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text('404! Page not found'),
      ),
    );
  }
}
