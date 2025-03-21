import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_sphere_dashboard/features/presention/view/controller/order/order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit() : super(OrderInitial());
  
}
