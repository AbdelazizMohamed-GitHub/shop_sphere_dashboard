import 'package:flutter/material.dart';
import 'package:shop_sphere_dashboard/core/utils/app_color.dart';
import 'package:shop_sphere_dashboard/core/utils/app_styles.dart';
import 'package:shop_sphere_dashboard/features/presention/view/screen/massage_screen.dart';

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
              title: Text("Customer $index", style: AppStyles.text16Bold),
              trailing: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) => ChatScreen(staffId: '', customerId: ''),
                    ),
                  );
                },
                icon: Icon(Icons.message_rounded),
              ),
              leading: CircleAvatar(backgroundColor: AppColors.primaryColor),
              subtitle: Text("Phone $index", style: AppStyles.text14Regular),
            ),
          );
        },
      ),
    );
  }
}
