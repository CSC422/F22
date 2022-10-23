import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Form Test'),
        ),
        body: const SafeArea(
          child: MyCustomForm(),
        ),
      ),
    );
  }
}

// Define a custom Form widget.
class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  State<MyCustomForm> createState() => _MyCustomFormState();
}

// Define a corresponding State class.
// This class holds data related to the form.
class _MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  autofocus: true,
                  // The validator receives the text that the user has entered.
                  validator: (val) {
                    if (val != null && val.isNotEmpty) {
                      return null;
                    } else {
                      return 'Please enter text';
                    }
                  },
                  onSaved: (val) {
                    print('saved data $val');
                  },
                ),
                TextFormField(
                  // The validator receives the text that the user has entered.

                  onSaved: (val) {
                    print('saved data $val');
                  },

                  validator: (val) {
                    if (val != null && val.isNotEmpty) {
                      return null;
                    } else {
                      return 'Please enter text';
                    }
                  },
                ),
                const SizedBox(
                  height: 20.0,
                ),
                ElevatedButton(
                  onPressed: () {
                    // Validate returns true if the form is valid, otherwise false.
                    if (_formKey.currentState!.validate()) {
                      // If the form is valid, display a snackbar. In the real world,
                      // you'd often call a server or save the information in a database.

                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Processing Data')));
                      _formKey.currentState!.save();
                    }
                  },
                  child: const Text('Submit'),
                )
              ]),
        ));
  }
}
