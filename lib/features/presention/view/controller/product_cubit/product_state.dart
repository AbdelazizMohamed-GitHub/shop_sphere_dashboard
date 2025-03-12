import 'package:shop_sphere_dashboard/features/domain/entity/prosuct_entity.dart';

class ProductState {}

class ProductInitial extends ProductState {}

class AddProductLoading extends ProductState {}

class AddProductSuccess extends ProductState {}

class ProductFailer extends ProductState {
  String errMessage;
  ProductFailer({required this.errMessage});
}
class GetProductsSuccess extends ProductState {
  List<ProductEntity> products;
  GetProductsSuccess({required this.products});
}
class GetProductsLoading extends ProductState {}

