import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shop_sphere_dashboard/core/widget/custom_back_button.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomBackButton(),
        title: const Text("Search"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SearchAnchor(
          builder: (BuildContext context, SearchController controller) {
            return SearchBar(
              
              controller: controller,
              hintText: "Search for products...",
              onChanged: (query) {
                controller.openView();
              },
              leading: Icon(Icons.search),
            );
          },
          suggestionsBuilder: (
            BuildContext context,
            SearchController controller,
          ) async {
            final query = controller.text.toLowerCase();

            final products = await FirebaseFirestore.instance
                .collection('products')
                .get()
                .then(
                  (snapshot) =>
                      snapshot.docs
                          .map((doc) => doc.data()['name'] as String)
                          .toList(),
                );
            final results =
                products
                    .where((product) => product.toLowerCase().contains(query))
                    .toList();

            return results.map((product) {
              return ListTile(
                title: Text(product),
                onTap: () {
                  controller.closeView(product);
                },
              );
            }).toList();
          },
        ),
      ),
    );
  }
}
