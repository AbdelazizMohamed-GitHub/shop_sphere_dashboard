import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shop_sphere_dashboard/core/funcation/funcations.dart';
import 'package:shop_sphere_dashboard/core/utils/app_images.dart';
import 'package:shop_sphere_dashboard/core/widget/custom_text_form.dart';
import 'package:shop_sphere_dashboard/features/presention/view/widget/custom_dropdown_menu.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  Uint8List? imageFile;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Product")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
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

            GestureDetector(
              onTap: ()async {
              imageFile= await Funcations.pickImageFromGallery() as Uint8List;
              },
              child: Container(
                width: double.infinity,
                height: 150,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child:
                    imageFile == null
                        ? Center(child: Text("Tap to select an image"))
                        : Image.memory(imageFile!, fit: BoxFit.cover), 
              ),
            ),
          ],
        ),
      ),
    );
  }
}
