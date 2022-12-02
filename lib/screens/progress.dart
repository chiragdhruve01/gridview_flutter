import 'package:flutter/material.dart';

class BankingInvoiceDetail extends StatefulWidget {
  static var tag = "/BankingInvoiceDetail";

  @override
  _BankingInvoiceDetailState createState() => _BankingInvoiceDetailState();
}

class _BankingInvoiceDetailState extends State<BankingInvoiceDetail> {
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
            'Details',
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
            SizedBox(height: 16.0),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const <Widget>[
                      Icon(
                        Icons.chevron_left,
                        size: 25,
                        color: Colors.orange,
                      )
                    ],
                  ),
                  const Text(
                    "Alerts",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.orange),
                  ),
                ],
              ),
            ),
            const Text(
              "",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.orange),
            ),
            SizedBox(height: 16.0),
            Text(
              "Invoice Mar 2020",
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Name",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Colors.pink)),
                    Text("chirag", style: TextStyle()),
                  ],
                ),
                Divider(thickness: 0, color: Colors.white),
              ],
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Address",
                    ),
                    Text(
                      "874 Cameron Road,NY,US",
                    ),
                  ],
                ),
                Divider(thickness: 0, color: Colors.white),
              ],
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Code",
                    ),
                    Text(
                      "#7783",
                    ),
                  ],
                ),
                Divider(thickness: 0, color: Colors.white),
              ],
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "TimeService",
                    ),
                    Text(
                      "25 Mar - 25 Mar",
                    ),
                  ],
                ),
                Divider(thickness: 0, color: Colors.white),
              ],
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Readings", style: TextStyle(color: Colors.pink)),
                    Text(
                      "\120/140",
                    ),
                  ],
                ),
                Divider(thickness: 0, color: Colors.white),
              ],
            ),
            SizedBox(height: 16.0),
            GestureDetector(
              onTap: () {},
              child: Container(
                height: 50.0,
                padding: EdgeInsets.fromLTRB(16, 4, 16, 4),
                alignment: Alignment.center,
                child: Text(
                  'submit',
                ),
                decoration: BoxDecoration(
                  color: Colors.pink,
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
