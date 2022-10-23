import 'package:flutter/material.dart';

typedef StringValue = String Function(String);

// ignore: must_be_immutable
class EditPage extends StatefulWidget {
  @override
  State<EditPage> createState() => _EditPageState();
  void Function(String) callback;
  EditPage(this.callback, {super.key});
}

class _EditPageState extends State<EditPage> {
  TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Widget Communication"),
        backgroundColor: Colors.red,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 50,
            margin: const EdgeInsets.all(8),
            child: TextFormField(
              controller: textController,
              maxLines: 1,
              maxLength: 20,
              decoration: const InputDecoration(
                hintText: "Enter Some Text Here",
                contentPadding: EdgeInsets.all(8),
              ),
            ),
          ),
          ElevatedButton(
              child: const Text("Submit"),
              onPressed: () {
                widget.callback(textController.text);
                Navigator.pop(context);
              }),
        ],
      ),
    );
  }
}
