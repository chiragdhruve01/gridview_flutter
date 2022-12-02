import 'package:flutter/material.dart';
import 'package:item/screens/progress.dart';
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
            style: const TextStyle(
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
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  shadowColor: Colors.yellow,
                  child: Column(
                    children: [
                      Container(
                        color: const Color.fromARGB(255, 229, 240, 130),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              snapshot.data![i]['name'],
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.orange),
                            ),
                          ],
                        ),
                      ),
                      // const SizedBox(height: 15.0),
                      ListTile(
                        leading: snapshot.data![i]['image'] != null
                            ? Image(
                                image: NetworkImage(
                                  constants.url + snapshot.data![i]['image'],
                                ),
                              )
                            : const Image(
                                image: AssetImage('assets/logo/icon.png'),
                              ),
                        tileColor: const Color.fromARGB(255, 230, 255, 201),
                        title: Text(
                          snapshot.data![i]['name'],
                        ),
                        subtitle: Text(
                          formattedDate,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.orange),
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              padding: const EdgeInsets.all(0),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          BankingInvoiceDetail(snapshot.data![i]
                                                  ['id']
                                              .toString())),
                                );
                              },
                              icon: const Icon(
                                Icons.forward_sharp,
                                color: Colors.orange,
                                size: 18.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //   children: [
                      //     Text(snapshot.data![i]['name']),
                      //     Text(formattedDate),
                      //   ],
                      // ),
                    ],
                  ),
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
