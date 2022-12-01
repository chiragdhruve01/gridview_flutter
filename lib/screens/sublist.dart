import 'package:flutter/material.dart';
import 'package:item/service/auth_service.dart';

class SubListPage extends StatefulWidget {
  const SubListPage(this.title, this.travel, {super.key});

  final String title;
  final String travel;

  @override
  State<SubListPage> createState() => _SubListPageState();
}

class _SubListPageState extends State<SubListPage> {
  final AuthService authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder<List>(
        future: authService.getUserRoomChats(widget.travel),
        builder: (context, snapshot) {
          // print("snapshot ${snapshot}");
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, i) {
                return Card(
                  child: ListTile(
                      tileColor: Colors.grey[300],
                      title: Text(
                        snapshot.data![i]['firstName'] +
                            " " +
                            snapshot.data![i]['lastName'],
                      ),
                      subtitle: Text(
                        snapshot.data![i]['email'],
                        style: const TextStyle(
                            backgroundColor: Colors.orange,
                            color: Colors.white),
                      ),
                      trailing: SizedBox(
                        height: 100,
                        width: 100,
                        child: snapshot.data![i]['image'] != null
                            ? Image(
                                image: NetworkImage(
                                  'http://localhost:8000' +
                                      snapshot.data![i]['image'],
                                ),
                              )
                            : const Image(
                                image: AssetImage('assets/logo/icon.png'),
                              ),
                      )),
                );
              },
            );
          } else {
            return const Center(
              child: ListTile(
                title: Text('No Data Found',
                    style: TextStyle(
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.w700,
                      fontSize: 18.0,
                      fontFamily: 'Roboto',
                    )),
                leading: SizedBox(
                  height: 100,
                  width: 100,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
