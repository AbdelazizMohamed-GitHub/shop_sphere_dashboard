import 'package:flutter/material.dart';

class CustomerScreen extends StatelessWidget {
  const CustomerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Customers")),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 16),
        itemCount: 5,

        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: ListTile(
              title: Text("Customer $index"),
              trailing: IconButton(
                onPressed: () {},
                icon: Icon(Icons.message_rounded),
              ),
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),

              ),
              subtitle: Text("Phone $index"),
            ),
          );
        },
      ),
    );
  }
}
