import 'package:shop_sphere_dashboard/features/domain/entity/prosuct_entity.dart';

class ProductState {}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductSuccess extends ProductState {}

class ProductFailer extends ProductState {
  String errMessage;
  ProductFailer({required this.errMessage});
}
class GetProductsLoading extends ProductState {}
class GetProductsSuccess extends ProductState {
  List<ProductEntity> products;
  GetProductsSuccess({required this.products});
}

