import 'package:flutter/material.dart';
import 'package:shop_sphere_dashboard/core/utils/app_color.dart';
import 'package:shop_sphere_dashboard/core/widget/custom_product_item.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Products"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search, size: 30),
          ),
          SizedBox(width: 10),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: CustomScrollView(
          slivers: [
            SliverGrid.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemCount: 10,
              itemBuilder: (context, index) => const CustomProductItem(),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryColor,
        onPressed: () {},

        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
