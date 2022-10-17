import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              title: const Text('Navigator 1.0 Demo'),
              backgroundColor: Colors.green,
            ),
            body: const FirstScreen()));
  }
}

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Avoide unnecessary constainers
    return Center(
        child: ElevatedButton(
      onPressed: () => Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const NewScreen())),
      child: const Text('Move to the next screen'),
    ));
  }
}

class NewScreen extends StatefulWidget {
  const NewScreen({Key? key}) : super(key: key);

  @override
  State<NewScreen> createState() => _NewScreenState();
}

class _NewScreenState extends State<NewScreen> {
  final TextEditingController textEditingController = TextEditingController();
  String _message = '';

  @override
  void initState() {
    textEditingController.addListener(_printLatestValue);
    super.initState();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    // ignore: avoid_print
    print('Dispose used');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Screen'),
        backgroundColor: Colors.green,
      ),
      // Avoide unnsessary constainers
      body: Center(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                const Text('This is the new screen'),
                TextField(
                  controller: textEditingController,
                ),
                const SizedBox(
                  height: 100,
                ),
                Text(
                  'Message:\n$_message',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 22),
                ),
                ElevatedButton(
                    onPressed: (() => Navigator.pop(context)),
                    child: const Text('back'))
              ],
            )),
      ),
    );
  }

  void _printLatestValue() {
    setState(() {
      _message = textEditingController.text;
    });

    print('Second text field: ${textEditingController.text}');
  }
}
