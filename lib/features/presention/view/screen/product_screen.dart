import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_sphere_dashboard/core/utils/app_color.dart';
import 'package:shop_sphere_dashboard/core/widget/custom_product_item.dart';
import 'package:shop_sphere_dashboard/core/widget/warning.dart';
import 'package:shop_sphere_dashboard/features/data/repo_impl/product_repo_impl.dart';
import 'package:shop_sphere_dashboard/features/presention/view/controller/product_cubit/product_cubit.dart';
import 'package:shop_sphere_dashboard/features/presention/view/controller/product_cubit/product_state.dart';
import 'package:shop_sphere_dashboard/features/presention/view/screen/add_product_screen.dart';
import 'package:shop_sphere_dashboard/features/presention/view/screen/details_screen.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              ProductCubit(productRepo: ProductRepoImpl())..getProducts(),
      child: Scaffold(
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
        body: BlocConsumer<ProductCubit, ProductState>(
          listener: (context, state) {
            if (state is ProductFailer) {
              Warning.showWarning(context, message: state.errMessage);
            }
          },
          builder: (context, state) {
            return state is GetProductsLoading
                ? Center(child: CircularProgressIndicator())
                : state is GetProductsSuccess
                ? RefreshIndicator(
                  onRefresh: () async {
                    context.read<ProductCubit>().getProducts();
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: CustomScrollView(
                      slivers: [
                        SliverGrid.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 10,
                                crossAxisSpacing: 10,
                              ),
                          itemCount: state.products.length,
                          itemBuilder:
                              (context, index) => CustomProductItem(
                                product: state.products[index],
                              ),
                        ),
                      ],
                    ),
                  ),
                )
                : state is ProductFailer
                ? Text("${state.errMessage}")
                : Container();
          },
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.primaryColor,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AddProductScreen()),
            );
          },

          child: Icon(Icons.add, color: Colors.white),
        ),
      ),
    );
  }
}
