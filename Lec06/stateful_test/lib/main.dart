import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const BlueBox());
}

class BlueBox extends StatefulWidget {
  const BlueBox({super.key});

  @override
  State<BlueBox> createState() => _BlueBoxState();
}

class _BlueBoxState extends State<BlueBox> {
  double size = 40;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Center(
          child: GestureDetector(
        onTap: () {
          setState(() {
            size += 20;
          });

          print(size);
        },
        child: Container(
          height: size,
          width: size,
          color: Colors.blue,
        ),
      )),
    );
  }
}

// import 'package:flutter/material.dart';

// void main() {
//   runApp(const BlueBox());
// }

// class BlueBox extends StatefulWidget {
//   const BlueBox({super.key});

//   @override
//   State<BlueBox> createState() => _BlueBoxState();
// }

// class _BlueBoxState extends State<BlueBox> {
//   double size = 50.0;

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         setState(() {
//           size = size + 10;
//         });

//         print(size);
//       },
//       child: Center(
//         child: Container(
//           width: size,
//           height: size,
//           color: Colors.blue,
//         ),
//       ),
//     );
//   }
// }
