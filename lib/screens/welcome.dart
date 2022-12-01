import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  // This widget is the root of your application
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 230, 255, 201),
        appBar: AppBar(
          leading: const Icon(Icons.stadium),
          backgroundColor: Colors.green,
          title: Container(
            margin: const EdgeInsets.only(left: 80.0),
            child: const Text(
              'Welcome',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.start,
            ),
          ),
        ),
        body: GridView.count(
          crossAxisCount: 3,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
          shrinkWrap: true,
          children: List.generate(
            5,
            (index) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSbKV-D7QVkH13KmdFlp81HHhoKWRFcPOo_emwaDJMU&s'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      margin: const EdgeInsets.all(3),
                      padding: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(100)),
                      child: const Icon(
                        Icons.play_arrow,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
// class WelcomePage extends StatelessWidget {
//   const WelcomePage({super.key});

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
