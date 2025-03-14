import 'package:flutter/material.dart';



class OrdersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Orders'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.filter_list),
            onPressed: () {},
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Dashboard',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.shopping_cart),
              title: Text('Orders'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.inventory),
              title: Text('Products'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.people),
              title: Text('Customers'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.analytics),
              title: Text('Analytics'),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Search and Filter Row
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search by Order ID, Customer Name, or Product',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),),
                SizedBox(width: 10),
                DropdownButton<String>(
                  value: 'All',
                  items: ['All', 'Pending', 'Shipped', 'Delivered', 'Cancelled']
                      .map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {},
                ),
                SizedBox(width: 10),
                DropdownButton<String>(
                  value: 'Last 7 Days',
                  items: ['Last 7 Days', 'Last 30 Days', 'Custom Range']
                      .map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {},
                ),
              ],
            ),
            SizedBox(height: 20),

            // Create New Order Button
            ElevatedButton(
              onPressed: () {},
              child: Text('Create New Order'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16),
              ),
            ),
            SizedBox(height: 20),

            // Orders Table
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: [
                  DataColumn(label: Text('Order ID')),
                  DataColumn(label: Text('Customer Name')),
                  DataColumn(label: Text('Date')),
                  DataColumn(label: Text('Status')),
                  DataColumn(label: Text('Total Amount')),
                  DataColumn(label: Text('Actions')),
                ],
                rows: [
                  DataRow(cells: [
                    DataCell(Text('#12345')),
                    DataCell(Text('John Doe')),
                    DataCell(Text('2023-10-15')),
                    DataCell(
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.yellow[100],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text('Pending'),
                      ),
                    ),
                    DataCell(Text('\$150.00')),
                    DataCell(Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.visibility),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {},
                        ),
                      ],
                    )),
                  ]),
                  // Add more rows as needed
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}