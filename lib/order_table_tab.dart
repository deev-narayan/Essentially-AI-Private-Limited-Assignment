import 'package:flutter/material.dart';

class OrdersTableTab extends StatefulWidget {
  const OrdersTableTab({super.key});

  @override
  State<OrdersTableTab> createState() => _OrdersTableTabState();
}

class _OrdersTableTabState extends State<OrdersTableTab> {
  // Sample JSON data
  final List<Map<String, dynamic>> orders = [
    {
      "time": "08:14:31",
      "client": "AAA001",
      "ticker": "RELIANCE",
      "side": "Buy",
      "product": "CNC",
      "qty": "50/100",
      "price": "250.50",
    },
    {
      "time": "08:14:31",
      "client": "AAA003",
      "ticker": "MRF",
      "side": "Buy",
      "product": "NRML",
      "qty": "10/20",
      "price": "2700.00",
    },
    {
      "time": "08:14:31",
      "client": "AAA002",
      "ticker": "ASIANPAINT",
      "side": "Buy",
      "product": "NRML",
      "qty": "10/30",
      "price": "1500.60",
    },
    {
      "time": "08:14:31",
      "client": "AAA002",
      "ticker": "TATAINVEST",
      "side": "Sell",
      "product": "INTRADAY",
      "qty": "10/10",
      "price": "2300.10",
    },
  ];

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isMobile = 650 < screenWidth;

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color.fromARGB(29, 224, 224, 224)),
      ),
      child: isMobile ? _buildMobileView() : _buildDesktopView(),
    );
  }

  /// ---------- DESKTOP / TABLET VIEW ----------
  Widget _buildDesktopView() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal, // Scroll left-right
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical, // Scroll up-down
        child: DataTable(
          columnSpacing: 20,
          headingRowColor: WidgetStateProperty.all(
            const Color.fromARGB(55, 245, 245, 245),
          ),
          dataRowColor: WidgetStateProperty.all(Colors.white.withOpacity(0.02)),
          border: TableBorder(
            horizontalInside: BorderSide(
              color: Colors.grey.withOpacity(0.3),
              width: 0.5,
            ),
          ),
          columns: const [
            DataColumn(label: Text("Time", style: TextStyle(fontSize: 18))),
            DataColumn(label: Text("Client", style: TextStyle(fontSize: 18))),
            DataColumn(label: Text("Ticker", style: TextStyle(fontSize: 18))),
            DataColumn(label: Text("Side", style: TextStyle(fontSize: 18))),
            DataColumn(label: Text("Product", style: TextStyle(fontSize: 18))),
            DataColumn(
              label: Text("Qty (Exec/Total)", style: TextStyle(fontSize: 18)),
            ),
            DataColumn(label: Text("Price", style: TextStyle(fontSize: 18))),
            DataColumn(label: Text("Actions", style: TextStyle(fontSize: 18))),
          ],
          rows: orders.map((order) {
            return DataRow(
              cells: [
                DataCell(
                  Text(order["time"], style: const TextStyle(fontSize: 18)),
                ),
                DataCell(
                  Text(order["client"], style: const TextStyle(fontSize: 18)),
                ),
                DataCell(
                  Row(
                    children: [
                      Text(
                        order["ticker"],
                        style: const TextStyle(fontSize: 18),
                      ),
                      const SizedBox(width: 4),
                      const Icon(Icons.sensors, size: 18, color: Colors.blue),
                    ],
                  ),
                ),
                DataCell(
                  Text(order["side"], style: const TextStyle(fontSize: 18)),
                ),
                DataCell(
                  Text(order["product"], style: const TextStyle(fontSize: 18)),
                ),
                DataCell(
                  Text(order["qty"], style: const TextStyle(fontSize: 18)),
                ),
                DataCell(
                  Text(order["price"], style: const TextStyle(fontSize: 18)),
                ),
                DataCell(
                  IconButton(
                    icon: const Icon(Icons.more_horiz, size: 18),
                    onPressed: () {},
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }

  /// ---------- MOBILE VIEW ----------
  Widget _buildMobileView() {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(), // disable inner scroll
        shrinkWrap: true, // take only needed space
        itemCount: orders.length,
        itemBuilder: (context, index) {
          final order = orders[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Top Row: Ticker + Action Button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            order["ticker"],
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 6),
                          const Icon(
                            Icons.sensors,
                            size: 18,
                            color: Colors.blue,
                          ),
                        ],
                      ),
                      IconButton(
                        icon: const Icon(Icons.more_horiz, size: 18),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  // Other Details
                  _buildMobileRow("Time", order["time"]),
                  _buildMobileRow("Client", order["client"]),
                  _buildMobileRow("Side", order["side"]),
                  _buildMobileRow("Product", order["product"]),
                  _buildMobileRow("Qty (Exec/Total)", order["qty"]),
                  _buildMobileRow("Price", order["price"]),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  /// Helper for displaying key-value pairs in mobile view
  Widget _buildMobileRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          Flexible(
            child: Text(
              value,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              overflow: TextOverflow.ellipsis, // Avoid overflow
            ),
          ),
        ],
      ),
    );
  }
}
