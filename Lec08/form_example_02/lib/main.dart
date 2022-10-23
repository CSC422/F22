import 'package:flutter/material.dart';
import 'package:form_example_02/model/user.dart';

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
          appBar: AppBar(title: const Text('Profile')),
          body: const HomeMaterial(),
        ));
  }
}

class HomeMaterial extends StatefulWidget {
  const HomeMaterial({super.key});

  @override
  State<HomeMaterial> createState() => _HomeMaterialState();
}

class _HomeMaterialState extends State<HomeMaterial> {
  final _formKey = GlobalKey<FormState>();
  final _user = User();
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 16.0,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'First name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your first name';
                  }
                  return null;
                },
                onSaved: (val) => setState(() => _user.firstName = val!),
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Last name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your last name.';
                  }
                  return null;
                },
                onSaved: (val) => setState(() => _user.lastName = val!),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(0, 50, 0, 20),
                child: const Text('Subscribe'),
              ),
              SwitchListTile(
                  title: const Text('Monthly Newsletter'),
                  value: _user.newsletter,
                  onChanged: (bool val) =>
                      setState(() => _user.newsletter = val)),
              Container(
                padding: const EdgeInsets.fromLTRB(0, 50, 0, 20),
                child: const Text('Interests'),
              ),
              CheckboxListTile(
                  title: Text(_capitalize(User.reading)),
                  value: _user.interests[User.reading],
                  onChanged: (val) {
                    setState(() => _user.interests[User.reading] = val!);
                  }),
              CheckboxListTile(
                  title: Text(_capitalize(User.traveling)),
                  value: _user.interests[User.traveling],
                  onChanged: (val) {
                    setState(() => _user.interests[User.traveling] = val!);
                  }),
              CheckboxListTile(
                title: Text(_capitalize(User.chess)),
                value: _user.interests[User.chess],
                onChanged: (val) {
                  setState(() => _user.interests[User.chess] = val!);
                },
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 16.0),
                child: ElevatedButton(
                  child: const Text('Save'),
                  onPressed: () {
                    final form = _formKey.currentState;
                    if (form!.validate()) {
                      form.save();
                      print('saving user data');
                      _user.save();
                      _showDialog(context);
                    }
                  },
                ),
              ),
            ],
          ),
        ));
  }

  _showDialog(BuildContext context) {
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('Submitting form')));
  }

  _capitalize(String s) => s[0].toUpperCase() + s.substring(1);
}
