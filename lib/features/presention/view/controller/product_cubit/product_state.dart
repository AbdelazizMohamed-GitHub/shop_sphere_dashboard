class ProductState {}

class ProductInitial extends ProductState {}

class AddProductLoading extends ProductState {}

class AddProductSuccess extends ProductState {}

class AddProductFailer extends ProductState {
  String errMessage;
  AddProductFailer({required this.errMessage});
}
