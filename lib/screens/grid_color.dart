import 'package:flutter/material.dart';

class GridColor extends StatefulWidget {
  const GridColor({super.key});

  @override
  State<GridColor> createState() => _GridColorState();
}

class _GridColorState extends State<GridColor> {
  // This widget is the root of your application
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 230, 255, 201),
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios, color: Colors.orange),
            iconSize: 18,
          ),
          backgroundColor: Colors.green,
          title: Container(
            margin: const EdgeInsets.only(left: 80.0),
            child: const Text(
              'Colors',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.start,
            ),
          ),
        ),
        body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, crossAxisSpacing: 4.0, mainAxisSpacing: 4.0),
          itemCount: 40,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              color: Colors.primaries[index % 10],
              child: Center(child: Text('$index')),
            );
          },
        ),
      ),
    );
  }
}
// class GridColor extends StatelessWidget {
//   const GridColor({super.key});

//   @override
//   Widget build(BuildContext context) {
    
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 230, 255, 201),
//       appBar: AppBar(
//         leading: const Icon(Icons.stadium),
//         backgroundColor: Colors.green,
//         title: const Text(
//           'Welcome',
//           textAlign: TextAlign.start,
//         ),
//       ),
//       body: const AnimatedDefaultTextStyle(
//         duration: Duration(seconds: 1),
//         curve: Curves.fastOutSlowIn,
//         style: TextStyle(
//           color: Color(0xFF4e954e),
//           fontSize: 50,
//           fontFamily: 'Montserrat',
//           fontWeight: FontWeight.w600,
//         ),
//         child: Text(
//           "C",
//         ),
//       ),
//     );
//   }
// }
