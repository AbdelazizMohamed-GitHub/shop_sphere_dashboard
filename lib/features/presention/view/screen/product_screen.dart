import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_sphere_dashboard/core/service/setuplocator.dart';
import 'package:shop_sphere_dashboard/core/utils/app_color.dart';
import 'package:shop_sphere_dashboard/core/widget/custom_back_button.dart';
import 'package:shop_sphere_dashboard/core/widget/custom_product_item.dart';
import 'package:shop_sphere_dashboard/core/widget/warning.dart';
import 'package:shop_sphere_dashboard/features/presention/view/controller/product_cubit/product_cubit.dart';
import 'package:shop_sphere_dashboard/features/presention/view/controller/product_cubit/product_state.dart';
import 'package:shop_sphere_dashboard/features/presention/view/screen/add_product_screen.dart';
import 'package:shop_sphere_dashboard/features/presention/view/screen/search_screen.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ProductCubit>()..getProducts(),
      child: Scaffold(
        appBar: AppBar(
          leading: CustomBackButton(),
          title: const Text("Products"),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SearchScreen()),
                );
              },
              icon: const Icon(Icons.search, size: 30),
            ),
            SizedBox(width: 10),
          ],
        ),
        body: BlocBuilder<ProductCubit, ProductState>(
          builder: (context, state) {
            return state is GetProductsLoading
                ? Center(child: CircularProgressIndicator())
                : state is ProductFailer
                ? Center(child: Text(state.errMessage))
                : state is GetProductsSuccess
                ? RefreshIndicator(
                  onRefresh: () async {
                  await  context.read<ProductCubit>().getProducts();
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
              MaterialPageRoute(
                builder: (context) => const AddProductScreen(isUpdate: false),
              ),
            ).then((value) {
              if (value == true) {
                context.read<ProductCubit>().getProducts();
              }
            });
          },

          child: Icon(Icons.add, color: Colors.white),
        ),
      ),
    );
  }
}
