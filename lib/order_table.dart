import 'package:flutter/material.dart';

class OrdersTable extends StatefulWidget {
  const OrdersTable({super.key});

  @override
  State<OrdersTable> createState() => _OrdersTableState();
}

class _OrdersTableState extends State<OrdersTable> {
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
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color.fromARGB(29, 224, 224, 224)),
      ),
      child: DataTable(
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
          DataColumn(
            label: Text("Time", textAlign: TextAlign.center),
            headingRowAlignment: MainAxisAlignment.center,
          ),
          DataColumn(
            label: Text("Client", textAlign: TextAlign.center),
            headingRowAlignment: MainAxisAlignment.center,
          ),
          DataColumn(
            label: Text("Ticker", textAlign: TextAlign.center),
            headingRowAlignment: MainAxisAlignment.center,
          ),
          DataColumn(
            label: Text("Side", textAlign: TextAlign.center),
            headingRowAlignment: MainAxisAlignment.center,
          ),
          DataColumn(
            label: Text("Product", textAlign: TextAlign.center),
            headingRowAlignment: MainAxisAlignment.center,
          ),
          DataColumn(
            headingRowAlignment: MainAxisAlignment.center,
            label: Text("Qty (Executed/Total)", textAlign: TextAlign.center),
          ),
          DataColumn(
            label: Text("Price", textAlign: TextAlign.center),
            headingRowAlignment: MainAxisAlignment.center,
          ),
          DataColumn(
            label: Text("Actions", textAlign: TextAlign.center),
            headingRowAlignment: MainAxisAlignment.center,
          ),
        ],
        rows: orders.map((order) {
          return DataRow(
            cells: [
              DataCell(Center(child: Text(order["time"]))),
              DataCell(Center(child: Text(order["client"]))),
              DataCell(
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(order["ticker"]),
                    const SizedBox(width: 8),
                    const Icon(Icons.sensors, size: 16, color: Colors.blue),
                  ],
                ),
              ),
              DataCell(Center(child: Text(order["side"]))),
              DataCell(Center(child: Text(order["product"]))),
              DataCell(Center(child: Text(order["qty"]))),
              DataCell(Center(child: Text(order["price"]))),
              DataCell(
                Container(
                  width: double.infinity,
                  child: IconButton(
                    icon: const Icon(Icons.more_horiz),
                    onPressed: () {
                      // Action button logic
                    },
                  ),
                ),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}
