import 'package:flutter/material.dart';
import 'package:item/service/auth_service.dart';
import 'package:item/utils/constants.dart' as constants;
import 'package:intl/intl.dart';

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
        backgroundColor: Colors.green,
        title: Container(
          margin: const EdgeInsets.only(left: 80.0),
          child: Text(
            widget.title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.start,
          ),
        ),
      ),
      body: FutureBuilder<List>(
        future: authService.getCountryList(widget.travel),
        builder: (context, snapshot) {
          // print("snapshot ${snapshot}");
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, i) {
                var date = DateTime.parse(snapshot.data![i]['created_at']);
                var formattedDate = DateFormat('E MMM yyyy').format(date);
                return Card(
                  child: ListTile(
                      tileColor: const Color.fromARGB(255, 230, 255, 201),
                      title: Text(
                        snapshot.data![i]['name'],
                      ),
                      subtitle: Text(
                        formattedDate,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            // backgroundColor: Colors.orange,
                            color: Colors.orange),
                      ),
                      trailing: SizedBox(
                        height: 100,
                        width: 100,
                        child: snapshot.data![i]['image'] != null
                            ? Image(
                                image: NetworkImage(
                                  constants.url + snapshot.data![i]['image'],
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
