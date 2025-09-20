import 'package:flutter/material.dart';
import 'package:recreate/orders_tab.dart';

class OpenOrdersTab extends StatelessWidget {
  const OpenOrdersTab({super.key});

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
                                errorBuilder: (context, error, stackTrace) {
                                  return const Icon(
                                    Icons.business,
                                    size: 40,
                                  ); // Placeholder on error
                                },
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
                            PopupMenuButton<String>(
                              onSelected: _handleMenuSelection,
                              itemBuilder: (BuildContext context) =>
                                  <PopupMenuEntry<String>>[
                                    const PopupMenuItem<String>(
                                      value: 'marketwatch',
                                      child: ListTile(
                                        leading: Icon(Icons.show_chart),
                                        title: Text('MARKETWATCH'),
                                      ),
                                    ),
                                    const PopupMenuItem<String>(
                                      value: 'exchange_files',
                                      child: ListTile(
                                        leading: Icon(Icons.folder_shared),
                                        title: Text('EXCHANGE FILES'),
                                      ),
                                    ),
                                    const PopupMenuDivider(),
                                    const PopupMenuItem<String>(
                                      enabled: true,
                                      child: ListTile(
                                        leading: Icon(Icons.business_center),
                                        title: Text('PORTFOLIO'),
                                      ),
                                    ),
                                    const PopupMenuDivider(),
                                    const PopupMenuItem<String>(
                                      enabled: true,
                                      child: ListTile(
                                        leading: Icon(
                                          Icons.account_balance_wallet,
                                        ),
                                        title: Text('FUNDS'),
                                      ),
                                    ),
                                  ],
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 12.0),
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
                  OrdersTab(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
