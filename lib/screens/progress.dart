import 'package:flutter/material.dart';
import 'package:item/service/auth_service.dart';
import 'package:item/utils/constants.dart' as constants;

class BankingInvoiceDetail extends StatefulWidget {
  static var tag = "/BankingInvoiceDetail";
  BankingInvoiceDetail(this.id, {super.key});
  final dynamic id;

  @override
  _BankingInvoiceDetailState createState() => _BankingInvoiceDetailState();
}

class _BankingInvoiceDetailState extends State<BankingInvoiceDetail> {
  final AuthService authService = AuthService();
  List<dynamic>? messages = [];

  @override
  void initState() {
    super.initState();
    getPrefs();
  }

  Future<void> getPrefs() async {
    messages = await authService.getCountryDetails(widget.id);
    setState(() => {messages});
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.yellow[100],
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Container(
          margin: const EdgeInsets.only(left: 80.0),
          child: const Text(
            'Info',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.start,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16.0),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 250,
                    width: 250,
                    child:
                        (messages!.isNotEmpty && messages![0]['image'] != null)
                            ? Image(
                                image: NetworkImage(
                                  constants.url + messages![0]['image'],
                                ),
                              )
                            : const Image(
                                image: AssetImage('assets/logo/city.png'),
                              ),
                  ),
                  Text(messages!.isNotEmpty ? messages![0]['name'] : "",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.orange)),
                ],
              ),
            ),
            const Divider(thickness: 0, color: Colors.white),
            Column(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const SizedBox(height: 16.0),
                    Text(
                      messages!.isNotEmpty ? messages![0]['description'] : "",
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 26.0),
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    scrollable : true,
                    backgroundColor: Color.fromARGB(255, 224, 142, 35),
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(25.0),
                    ),
                    icon: const Image(
                      image: AssetImage('assets/logo/city.png'),
                    ),
                    // title: Text(
                    //   'Booking Confirmed Thank You',
                    //   style: TextStyle(
                    //     color: Color.fromARGB(255, 40, 240, 223),
                    //   ),
                    // ),
                    content: Text(
                      'Booking Confirmed for ' +
                          (messages![0]['name'] ?? "") +
                          ',\nThank You ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 240, 40, 197),
                      ),
                    ),
                    // actions: [
                    //   ElevatedButton(
                    //     onPressed: () => Navigator.of(context).pop(false),
                    //     child: Text('No'),
                    //   ),
                    //   ElevatedButton(
                    //     onPressed: () => Navigator.of(context).pop(true),
                    //     child: Text('Yes'),
                    //   ),
                    //   ElevatedButton(
                    //     onPressed: () => Navigator.of(context).pop(true),
                    //     child: Text('okay'),
                    //   ),
                    // ],
                  ),
                );
              },
              child: Container(
                height: 50.0,
                padding: EdgeInsets.fromLTRB(16, 4, 16, 4),
                alignment: Alignment.center,
                child: Text(
                  'Confirm',
                ),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 26, 226, 129),
                  boxShadow: [BoxShadow(color: Colors.transparent)],
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.all(Radius.circular(2.0)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
