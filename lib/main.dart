import 'package:flutter/material.dart';
import 'package:item/screens/homepage.dart';
import 'package:item/screens/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Learning App',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomePage(),
    );
  }
}

// class _MyHomePageState extends State<MyHomePage> {
//   String _counter = "hello";
//   int _counter2 = 0;

//   void _incrementCounter() {
//     setState(() {
//       _counter = "chirag";
//       _counter2++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               // ignore: prefer_interpolation_to_compose_strings
//               _counter + " " + '$_counter2',
//               style: Theme.of(context).textTheme.headline4,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.access_time),
//       ),
//     );
//   }
// }
