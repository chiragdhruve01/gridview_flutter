import 'package:flutter/material.dart';
import 'package:item/screens/grid_color.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class PhotoItem {
  final String image;
  final String name;
  PhotoItem(this.image, this.name);
}

class _WelcomePageState extends State<WelcomePage> {
  final List<PhotoItem> _items = [
    PhotoItem(
        "https://images.pexels.com/photos/1772973/pexels-photo-1772973.png?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
        "Stephan Seeber"),
    PhotoItem(
        "https://images.pexels.com/photos/1758531/pexels-photo-1758531.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
        "Liam Gant"),
    PhotoItem(
        "https://images.pexels.com/photos/1130847/pexels-photo-1130847.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
        "Stephan Seeber"),
    PhotoItem(
        "https://images.pexels.com/photos/45900/landscape-scotland-isle-of-skye-old-man-of-storr-45900.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
        "Pixabay"),
    PhotoItem(
        "https://images.pexels.com/photos/165779/pexels-photo-165779.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
        "Scott Webb"),
    PhotoItem(
        "https://images.pexels.com/photos/548264/pexels-photo-548264.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
        "Krivec Ales"),
    PhotoItem(
        "https://images.pexels.com/photos/188973/matterhorn-alpine-zermatt-mountains-188973.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
        "Pixabay"),
    PhotoItem(
        "https://images.pexels.com/photos/795188/pexels-photo-795188.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
        "Melanie Wupper"),
    PhotoItem(
        "https://images.pexels.com/photos/5222/snow-mountains-forest-winter.jpg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
        "Jaymantri"),
    PhotoItem(
        "https://images.pexels.com/photos/789381/pexels-photo-789381.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
        "Riciardus"),
    PhotoItem(
        "https://images.pexels.com/photos/326119/pexels-photo-326119.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
        "Pixabay"),
    PhotoItem(
        "https://images.pexels.com/photos/707344/pexels-photo-707344.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
        "Eberhard"),
    PhotoItem(
        "https://images.pexels.com/photos/691034/pexels-photo-691034.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
        "Mirsad Mujanovic"),
    PhotoItem(
        "https://images.pexels.com/photos/655676/pexels-photo-655676.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
        "Vittorio Staffolani"),
    PhotoItem(
        "https://images.pexels.com/photos/592941/pexels-photo-592941.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
        "Tobi"),
  ];
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
        body: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 0,
              mainAxisSpacing: 0,
              crossAxisCount: 3,
            ),
            itemCount: _items.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(5.0),
                child: GestureDetector(
                  onTap: () async {
                    await showDialog(
                      context: context,
                      builder: (_) =>
                          imageDialog('My Image', _items[index].image, context),
                    );
                  },
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(_items[index].image),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(20.0),
                              ),
                            ),
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: Container(
                                margin: const EdgeInsets.all(5),
                                //padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    color: Theme.of(context).primaryColor,
                                    borderRadius: BorderRadius.circular(100)),
                                child: SizedBox(
                                  height: 30.0,
                                  width: 30.0,
                                  child: IconButton(
                                    padding: new EdgeInsets.all(0.0),
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  GridColor()));
                                      print("yeeehhh clicked");
                                    },
                                    icon: Icon(
                                      Icons.play_arrow,
                                      size: 25,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Center(
                            child: Text(
                          _items[index].name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ))
                      ]),
                ),
              );
            }),
      ),
    );
  }

  Widget imageDialog(text, path, context) {
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            width: 220,
            height: 200,
            child: Image.network(
              '$path',
              fit: BoxFit.cover,
            ),
          ),
        ],
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
