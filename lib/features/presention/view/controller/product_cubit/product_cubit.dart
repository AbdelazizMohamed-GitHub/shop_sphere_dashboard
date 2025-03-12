import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_sphere_dashboard/features/data/model/product_model.dart';
import 'package:shop_sphere_dashboard/features/domain/repo/product_repo.dart';
import 'package:shop_sphere_dashboard/features/presention/view/controller/product_cubit/product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit({required this.productRepo}) : super(ProductInitial());
  final ProductRepo productRepo;
 Future<void> addProduct( {required ProductModel product,required String dId}) async {
    emit(AddProductLoading());
 var result =await   productRepo.addProduct(product: product, dId: dId);
    result.fold((error) {
      emit(AddProductFailer(errMessage:error.message ));
    }, (r) {
      emit(AddProductSuccess());
    });
    
  }
}
