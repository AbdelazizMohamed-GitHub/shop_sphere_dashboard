import 'package:flutter/material.dart';
import 'package:shop_sphere_dashboard/core/utils/app_color.dart';
import 'package:shop_sphere_dashboard/core/utils/app_styles.dart';
import 'package:shop_sphere_dashboard/features/domain/entity/prosuct_entity.dart';
import 'package:shop_sphere_dashboard/features/presention/view/widget/custom_details_header.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.product});
  final ProductEntity product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomDetailsHeader(product: product),

              Text(
                "The iPhone 15 Pro is crafted with aerospace-grade titanium, making it lighter yet more durable than ever. Powered by the A17 Pro chip, it delivers unparalleled performance for gaming, photography, and everyday tasks.",
                style: AppStyles.text16Regular,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
