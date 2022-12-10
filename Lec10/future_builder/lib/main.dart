import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Future Builder Demo',

      // to hide debug banner
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Future Builder Demo'),
        ),
        body: Center(
          child: TextButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (ctx) => const FutureDemoPage(),
              ),
            ),
            child: const Text('Demonstrate FutureBuilder',
                style: TextStyle(fontSize: 20)),
          ),
        ),
      ),
    );
  }
}

class FutureDemoPage extends StatelessWidget {
  const FutureDemoPage({super.key});

  Future<String> getData() {
    return Future.delayed(const Duration(seconds: 2), () {
      return "Data fetched";
      //throw Exception("Error!");
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Future Demo Page'),
        ),
        body: FutureBuilder(
          future: getData(),
          builder: (ctx, snapshot) {
            // Checking if future is resolved or not
            if (snapshot.connectionState == ConnectionState.done) {
              // If we got an error
              if (snapshot.hasError) {
                return Center(
                  child: Text(
                    '${snapshot.error} occurred',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                );

                // if we got our data
              } else if (snapshot.hasData) {
                // Extracting data from snapshot object
                final data = snapshot.data as String;
                return Center(
                  child: Text(
                    data,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                );
              }
            }

            // Displaying LoadingSpinner to indicate waiting state
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
