import 'package:flutter/material.dart';
import 'package:shop_sphere_dashboard/core/widget/custom_button.dart';
import 'package:shop_sphere_dashboard/core/widget/custom_text_form.dart';
import 'package:shop_sphere_dashboard/features/presention/view/widget/custom_add_image.dart';
import 'package:shop_sphere_dashboard/features/presention/view/widget/custom_dropdown_menu.dart';

class AddProductScreen extends StatelessWidget {
  const AddProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Product")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              SizedBox(height: 20),
              CustomTextForm(
                pIcon: Icons.title,
                text: "Product Name",
                kType: TextInputType.text,
              ),
              const SizedBox(height: 15),

              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: CustomTextForm(
                      pIcon: Icons.price_check,
                      text: " Price",
                      kType: TextInputType.number,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    flex: 3,
                    child: CustomDropdown(
                      categories: [
                        "Electronics",
                        "Fashion",
                        "Home Appliances",
                        "Books",
                      ],
                      onCategorySelected: (value) {},
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),

              CustomTextForm(
                pIcon: null,
                text: "Product Description",
                kType: TextInputType.text,
                line: 4,
              ),
              SizedBox(height: 15),

              CustomTextForm(
                pIcon: Icons.numbers,
                text: "Product Quantity",
                kType: TextInputType.number,
              ),
              const SizedBox(height: 15),

              CustomAddImage(),
              const SizedBox(height: 20),
              CustomButton(onPressed: () {}, text: "Add Product"),
            ],
          ),
        ),
      ),
    );
  }
}
