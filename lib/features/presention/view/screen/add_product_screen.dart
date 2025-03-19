import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_sphere_dashboard/core/service/supabase_service.dart';
import 'package:shop_sphere_dashboard/core/widget/custom_button.dart';
import 'package:shop_sphere_dashboard/core/widget/custom_text_form.dart';
import 'package:shop_sphere_dashboard/core/widget/warning.dart';
import 'package:shop_sphere_dashboard/features/data/model/product_model.dart';
import 'package:shop_sphere_dashboard/features/presention/view/controller/product_cubit/product_cubit.dart';
import 'package:shop_sphere_dashboard/features/presention/view/controller/product_cubit/product_state.dart';
import 'package:shop_sphere_dashboard/features/presention/view/widget/custom_add_image.dart';
import 'package:shop_sphere_dashboard/features/presention/view/widget/custom_dropdown_menu.dart';
import 'package:uuid/uuid.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  String? selectedCategory;
  TextEditingController nameController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  File? imageFile;
  @override
  void dispose() {
    nameController.dispose();
    quantityController.dispose();
    priceController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Product")),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                SizedBox(height: 20),
                CustomTextForm(
                  textController: nameController,
                  pIcon: Icons.title,
                  text: "Product Name",
                  kType: TextInputType.text,
                ),
                const SizedBox(height: 15),
                CustomTextForm(
                  textController: quantityController,
                  pIcon: Icons.numbers,
                  text: "Product Quantity",
                  kType: TextInputType.number,
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: CustomTextForm(
                        textController: priceController,
                        pIcon: Icons.money_off_rounded,
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
                        onCategorySelected: (value) {
                          selectedCategory = value;
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),

                CustomTextForm(
                  textController: descriptionController,
                  pIcon: null,
                  text: "Product Description",
                  kType: TextInputType.text,
                  line: 4,
                ),
                SizedBox(height: 15),

                CustomAddImage(
                  onTap: (File file) {
                    imageFile = file;
                  },
                ),
                const SizedBox(height: 20),
                BlocConsumer<ProductCubit, ProductState>(
                  listener: (context, state) {
                    if (state is ProductFailer) {
                      Warning.showWarning(context, message: state.errMessage);
                    }
                    if (state is AddProductSuccess) {
                      Warning.showWarning(
                        context,
                        message: "Product Added Successfully",
                      );
                    }
                  },
                  builder: (context, state) {
                    return state is AddProductLoading
                        ? Center(child: CircularProgressIndicator())
                        : CustomButton(
                          onPressed: () async {
                            if (formKey.currentState!.validate() &&
                                selectedCategory != null) {
                              if (imageFile != null) {
                                String dId = Uuid().v4();
                                ProductModel product = ProductModel(
                                  name: nameController.text,
                                  price: double.parse(priceController.text),
                                  stock: int.parse(quantityController.text),
                                  category: selectedCategory!,
                                  description: descriptionController.text,
                                  id: dId,
                                  sId: "123456789",
                                  imageUrl: await SupabaseService.uploadImage(
                                    file: imageFile!,                    ),
                                );
                                await context.read<ProductCubit>().addProduct(
                                  dId: dId,
                                  product: product,
                                );
                              }else {
                              Warning.showWarning(
                                context,
                                message: "Please Add Image",
                              );
                            }
                            } 
                          },
                          text: "Add Product",
                        );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
