import 'package:flutter/material.dart';

import 'package:shop_sphere_dashboard/core/utils/app_color.dart';
import 'package:shop_sphere_dashboard/core/utils/app_images.dart';
import 'package:shop_sphere_dashboard/core/utils/app_styles.dart';
import 'package:shop_sphere_dashboard/core/utils/app_theme.dart';
import 'package:shop_sphere_dashboard/features/domain/entity/prosuct_entity.dart';

class CustomProductItem extends StatelessWidget {
  const CustomProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              child: GestureDetector(
                onTap: () {},
                child: Image.asset(AppImages.product),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 150,
                  child: Text("Product", style: AppStyles.text14Regular),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('\$5', style: AppStyles.text16Bold),
                    const Spacer(),
                    Text('5 Stock', style: AppStyles.text14Regular),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
