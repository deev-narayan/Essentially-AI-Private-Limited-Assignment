import 'package:flutter/material.dart';
import 'package:recreate/orders_mob.dart';

class OpenOrdersMob extends StatelessWidget {
  const OpenOrdersMob({super.key});

  @override
  Widget build(BuildContext context) {
    void _handleMenuSelection(String value) {
      print("Selected: $value");
    }

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                child: Container(
                  padding: const EdgeInsets.fromLTRB(10, 8, 10, 8),
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
                                errorBuilder: (context, error, stackTrace) {
                                  return const Icon(
                                    Icons.business,
                                    size: 40,
                                  ); // Placeholder on error
                                },
                              ),
                            ),
                            SizedBox(width: 25),
                          ],
                        ),
                        Row(
                          children: [
                            PopupMenuButton<String>(
                              onSelected: _handleMenuSelection,
                              itemBuilder: (BuildContext context) =>
                                  <PopupMenuEntry<String>>[
                                    const PopupMenuItem<String>(
                                      value: 'marketwatch',
                                      child: ListTile(
                                        leading: Icon(Icons.show_chart, size: 18),
                                        title: Text(
                                          'MARKETWATCH',
                                          style: TextStyle(fontSize: 10),
                                        ),
                                      ),
                                    ),
                                    const PopupMenuItem<String>(
                                      value: 'exchange_files',
                                      child: ListTile(
                                        leading: Icon(
                                          Icons.folder_shared,
                                          size: 18,
                                        ),
                                        title: Text(
                                          'EXCHANGE FILES',
                                          style: TextStyle(fontSize: 10),
                                        ),
                                      ),
                                    ),
                                    const PopupMenuDivider(),
                                    const PopupMenuItem<String>(
                                      enabled: true,
                                      child: ListTile(
                                        leading: Icon(
                                          Icons.business_center,
                                          size: 18,
                                        ),
                                        title: Text(
                                          'PORTFOLIO',
                                          style: TextStyle(fontSize: 10),
                                        ),
                                      ),
                                    ),
                                    const PopupMenuDivider(),
                                    const PopupMenuItem<String>(
                                      enabled: true,
                                      child: ListTile(
                                        leading: Icon(
                                          Icons.account_balance_wallet,
                                          size: 18,
                                        ),
                                        title: Text(
                                          'FUNDS',
                                          style: TextStyle(fontSize: 10),
                                        ),
                                      ),
                                    ),
                                  ],
                            ),
          
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 6.0),
                              child: Center(
                                child: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  child: Text(
                                    "LK",
                                    style: TextStyle(
                                      color: Colors.teal,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
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
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    width: double.infinity,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Text("SIGNORIA", style: TextStyle(fontSize: 10)),
                            Text(
                              "0.00",
                              style: TextStyle(color: Colors.teal, fontSize: 10),
                            ),
                          ],
                        ),
                        SizedBox(width: 20),
                        Column(
                          children: [
                            Text("NIFTY BANK", style: TextStyle(fontSize: 10)),
                            Text(
                              "52,323.30",
                              style: TextStyle(color: Colors.teal, fontSize: 10),
                            ),
                          ],
                        ),
                        SizedBox(width: 20),
                        Column(
                          children: [
                            Text(
                              "NIFTY FIN SERVICE",
                              style: TextStyle(fontSize: 10),
                            ),
                            Text(
                              "25,255.75",
                              style: TextStyle(color: Colors.teal, fontSize: 10),
                            ),
                          ],
                        ),
                        SizedBox(width: 20),
                        Column(
                          children: [
                            Text("RELCHEMQ", style: TextStyle(fontSize: 10)),
                            Text(
                              "162.73",
                              style: TextStyle(color: Colors.teal, fontSize: 10),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
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
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Card(
                          child: TextButton(
                            onPressed: () {},
                            child: Row(
                              children: [
                                Icon(Icons.file_download_outlined),
                                Text(
                                  "Download",
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  OrdersMob(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
