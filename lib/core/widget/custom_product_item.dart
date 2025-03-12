import 'package:flutter/material.dart';
import 'package:shop_sphere_dashboard/core/utils/app_images.dart';

import 'package:shop_sphere_dashboard/core/utils/app_styles.dart';
import 'package:shop_sphere_dashboard/features/domain/entity/prosuct_entity.dart';

class CustomProductItem extends StatelessWidget {
  const CustomProductItem({super.key, required this.product});
  final ProductEntity product;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
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
                child: Image.asset(ProductImages.apple),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 150,
                  child: Text(product.name, style: AppStyles.text14Regular),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('\$ ${product.price}', style: AppStyles.text16Bold),
                    const Spacer(),
                    Text(
                      '${product.stock} Stock',
                      style: AppStyles.text14Regular,
                    ),
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
