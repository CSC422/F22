import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter with Riverpod'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Consumer(
              builder: (context, ref, __) {
                final counter = ref.watch(counterProvider);
                return Text(
                  '$counter',
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
            const CounterWidget(),
          ],
        ),
      ),
    );
  }
}

// final counterProvider = StateProvider<int>((ref) {
//   return 0;
// });
final counterProvider = StateProvider<int>((ref) {
  return 0;
});
// 2. create a [ConsumerWidget] subclass
class CounterWidget extends ConsumerWidget {
  const CounterWidget({super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 3. watch the provider and rebuild when the value changes
    final counter = ref.watch(counterProvider);
    return ElevatedButton(
      // 4. use the value
      child: Text('Value: $counter'),
      // 5. change the state inside a button callback
      onPressed: () => ref.read(counterProvider.notifier).state++,
    );
  }
}
