import 'package:flutter/material.dart';
import 'package:recreate/open_order_mob.dart';
import 'package:recreate/open_order_tab.dart';
import 'package:recreate/open_orders.dart';

class ResponsiveOrdersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 1163) {
            // Desktop: A full-width DataTable
            return OpenOrders();
          } else if (constraints.maxWidth > 665) {
            // Tablet: Horizontally scrollable DataTable
            return OpenOrdersTab();
          } else {
            // Mobile: A ListView of Cards
            return OpenOrdersMob();
          }
        },
      ),
    );
  }
}

class MobileLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Use a ListView.builder to create a list of OrderCard widgets
    return ListView.builder(
      itemCount: 10, // Example item count
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "RELIANCE",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Icon(Icons.more_vert),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Text("Buy", style: TextStyle(color: Colors.green)),
                    SizedBox(width: 16),
                    Text("Qty: 50/100"),
                  ],
                ),
                SizedBox(height: 4),
                Text("Price: \$250.50"),
              ],
            ),
          ),
        );
      },
    );
  }
}

class TabletLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Wrap your DataTable in a SingleChildScrollView
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        // ... your columns and rows here
        columns: [
          DataColumn(label: Text('Time')),
          DataColumn(label: Text('Client')),
          DataColumn(label: Text('Ticker')),
          // Add other columns...
        ],
        rows: [
          // Add your DataRows here...
        ],
      ),
    );
  }
}

// DesktopLayout would be similar to TabletLayout but might not need scrolling
class DesktopLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text("data");
  }
}
