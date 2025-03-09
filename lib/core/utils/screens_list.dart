import 'package:flutter/material.dart';
import 'package:shop_sphere_dashboard/core/utils/app_images.dart';

const List<Widget> screens = [
  // ExploreScreen(),
  // FavoriteScreen(),
  // NotificationScreen(),
  // ProfileScreen(),
];
List<PaymentMethodModel> paymentMethod = [
  PaymentMethodModel(title: "Cash on delivery", imagePath: AppImages.payCash),
  PaymentMethodModel(title: "Paypal", imagePath: AppImages.paypal),
];
List orderStauts = [
  'Pending',
  'Delivered',
  'Processing',
  'Cancelled',
];

class PaymentMethodModel {
  final String title;
  final String imagePath;

  PaymentMethodModel({required this.title, required this.imagePath});
}

List category = [
  "All",
  "Electronics ",
  "Clothing",
  "Home ",
  "Sports ",
  "Toys ",
  "Automotive  ",
  "Books ",
];
