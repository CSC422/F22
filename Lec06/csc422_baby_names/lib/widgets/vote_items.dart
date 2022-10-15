import 'package:flutter/material.dart';

import '../data/db.dart';
import '../model/record.dart';

class VoteItems extends StatefulWidget {
  final MyData data;
  const VoteItems({super.key, required this.data});

  @override
  State<VoteItems> createState() => _VoteItemsState();
}

class _VoteItemsState extends State<VoteItems> {
  @override
  Widget build(BuildContext context) {
    var data = widget.data;
    return ListView.builder(
        shrinkWrap: true,
        itemCount: data.db.length,
        itemBuilder: (context, index) {
          var record = Record.fromMap(data.db[index]);
          return Padding(
            key: ValueKey(record.name),
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Dismissible(
              key: ValueKey(record.id),
              onDismissed: (direction) => setState(() {
                data.db.removeAt(index);
              }),
              background: Container(
                color: Colors.red,
                child: const Icon(Icons.delete),
              ),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(5.0),
                  color: record.gender == Gender.male
                      ? Colors.blue[100]
                      : Colors.pink[100],
                ),
                child: ListTile(
                  title: Text("${record.name}    ${record.votes}"),
                  trailing: IconButton(
                      icon: Icon(
                        Icons.delete,
                        color: Colors.red[800],
                      ),
                      onPressed: () {
                        setState(() {
                          data.db.removeAt(index);
                          //print(data.db.toString());
                        });
                      }),
                  onTap: () {
                    setState(() {
                      int x = int.parse(data.db[index]['votes'].toString());
                      data.db[index]['votes'] = ++x;
                    });
                  },
                ),
              ),
            ),
          );
        });
  }
}
