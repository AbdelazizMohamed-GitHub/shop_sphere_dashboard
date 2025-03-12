import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_sphere_dashboard/features/presention/view/controller/order/order_cubit.dart';
import 'package:shop_sphere_dashboard/features/presention/view/controller/order/order_state.dart';
import 'package:shop_sphere_dashboard/features/presention/view/widget/custom_order_screen_body.dart';
import 'package:shop_sphere_dashboard/features/presention/view/widget/custom_order_stuts_list.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrderCubit(),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_ios_new, size: 30),
          ),
          title: const Text('All Order'),
          leadingWidth: 100,
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 10, top: 20),
          child: Column(
            children: [
              const SizedBox(height: 40, child: CustomOrderStutsList()),
              BlocBuilder<OrderCubit, OrderState>(
                builder: (context, state) {
                  return const CustomOrderScreenBody();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
