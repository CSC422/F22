import 'package:flutter/material.dart';

class ChoiceButton extends StatelessWidget {
  final String title;
  final void Function() onpress;
  final Color color;
  final bool visibilty;

  const ChoiceButton({
    Key? key,
    required this.title,
    required this.onpress,
    required this.color,
    required this.visibilty,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 40,
        width: MediaQuery.of(context).size.width / 1.2,
        margin: const EdgeInsets.symmetric(vertical: 4.0),
        child: Visibility(
          visible: visibilty,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: color,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
            ),
            onPressed: onpress,
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ));
  }
}
