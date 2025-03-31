// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_sphere_dashboard/core/widget/custom_back_button.dart';
import 'package:uuid/uuid.dart';

import 'package:shop_sphere_dashboard/core/service/supabase_service.dart';
import 'package:shop_sphere_dashboard/core/widget/custom_button.dart';
import 'package:shop_sphere_dashboard/core/widget/custom_text_form.dart';
import 'package:shop_sphere_dashboard/core/widget/warning.dart';
import 'package:shop_sphere_dashboard/features/data/model/product_model.dart';
import 'package:shop_sphere_dashboard/features/domain/entity/prosuct_entity.dart';
import 'package:shop_sphere_dashboard/features/presention/view/controller/product_cubit/product_cubit.dart';
import 'package:shop_sphere_dashboard/features/presention/view/controller/product_cubit/product_state.dart';
import 'package:shop_sphere_dashboard/features/presention/view/widget/custom_add_image.dart';
import 'package:shop_sphere_dashboard/features/presention/view/widget/custom_dropdown_menu.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({
    super.key,
    required this.isUpdate,
    this.productEntity,
  });
  final ProductEntity? productEntity;
  final bool isUpdate;
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
  void initState() {
    if (widget.isUpdate) {
      nameController.text = widget.productEntity!.name;
      quantityController.text = widget.productEntity!.stock.toString();
      priceController.text = widget.productEntity!.price.toString();
      descriptionController.text = widget.productEntity!.description;
      selectedCategory = widget.productEntity!.category;
    }
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    quantityController.dispose();
    priceController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  final formKey = GlobalKey<FormState>();
  String dId = Uuid().v4();
  String buttonText = "Add Product ";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CustomBackButton(),
        title: Text(widget.isUpdate ? "Update Product" : "Add Product"),
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: Column(
              children: [
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
                        productCategory: selectedCategory,
                        isUpdate: widget.isUpdate,
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
                  imageUrl:
                      widget.isUpdate ? widget.productEntity!.imageUrl : "",
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
                    if (state is ProductSuccess) {
                      Navigator.pop(context);
                    }
                  },
                  builder: (context, state) {
                    return state is ProductLoading
                        ? Center(child: CircularProgressIndicator())
                        : CustomButton(
                          onPressed: () async {
                            if (formKey.currentState!.validate() &&
                                selectedCategory != null) {
                              if (imageFile != null || widget.isUpdate) {
                                buttonText = "Image Uploading ...";
                                setState(() {});
                                ProductModel product = ProductModel(
                                  name: nameController.text,
                                  price: double.parse(priceController.text),
                                  stock: int.parse(quantityController.text),
                                  category: selectedCategory!,
                                  description: descriptionController.text,
                                  id:
                                      widget.isUpdate
                                          ? widget.productEntity!.id
                                          : dId,
                                  sId: "123456789",
                                  imageUrl:
                                      widget.isUpdate
                                          ? widget.productEntity!.imageUrl
                                          : await SupabaseService.uploadImage(
                                                file: imageFile!,
                                              ) ??
                                              "",
                                );
                                widget.isUpdate
                                    ? await context
                                        .read<ProductCubit>()
                                        .updateProduct(
                                          dId: widget.productEntity!.id,
                                          data: product,
                                        )
                                    : await context
                                        .read<ProductCubit>()
                                        .addProduct(dId: dId, product: product);
                              } else {
                                Warning.showWarning(
                                  context,
                                  message: "Please Add Image",
                                );
                              }
                            }
                          },
                          text: widget.isUpdate ? "Update Product" : buttonText,
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
