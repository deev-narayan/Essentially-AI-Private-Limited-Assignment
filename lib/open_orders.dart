import 'package:flutter/material.dart';
import 'package:recreate/orders.dart';

class OpenOrders extends StatelessWidget {
  const OpenOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Card(
              child: Container(
                padding: const EdgeInsets.fromLTRB(25, 8, 25, 8),
                child: Container(
                  height: 40,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 40,
                            width: 40,
                            child: Image.asset(
                              'assets/images/logo.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                          SizedBox(width: 25),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  Text("SIGNORIA"),
                                  Text(
                                    "0.00",
                                    style: TextStyle(color: Colors.teal),
                                  ),
                                ],
                              ),
                              SizedBox(width: 20),
                              Column(
                                children: [
                                  Text("NIFTY BANK"),
                                  Text(
                                    "52,323.30",
                                    style: TextStyle(color: Colors.teal),
                                  ),
                                ],
                              ),
                              SizedBox(width: 20),
                              Column(
                                children: [
                                  Text("NIFTY FIN SERVICE"),
                                  Text(
                                    "25,255.75",
                                    style: TextStyle(color: Colors.teal),
                                  ),
                                ],
                              ),
                              SizedBox(width: 20),
                              Column(
                                children: [
                                  Text("RELCHEMQ"),
                                  Text(
                                    "162.73",
                                    style: TextStyle(color: Colors.teal),
                                  ),
                                ],
                              ),
                              SizedBox(width: 20),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text("MARKETWATCH"),
                          SizedBox(width: 15),
                          Text("EXCHANGE FILES"),
                          SizedBox(width: 15),
                          Text("PORTFOLIO"),
                          Icon(Icons.keyboard_arrow_down),
                          SizedBox(width: 15),
                          Text("FUNDS"),
                          Icon(Icons.keyboard_arrow_down),
                          SizedBox(width: 15),
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Text(
                              "LK",
                              style: TextStyle(
                                color: Colors.teal,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Column(
              children: [
                Container(
                  margin: EdgeInsets.all(7),
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  width: double.infinity,
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Open Orders",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Card(
                        child: TextButton(
                          onPressed: () {},
                          child: Row(
                            children: [
                              Icon(Icons.file_download_outlined),
                              Text("Download"),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Orders(),
          ],
        ),
      ),
    );
  }
}
