import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_sphere_dashboard/features/data/model/product_model.dart';
import 'package:shop_sphere_dashboard/features/domain/repo/product_repo.dart';
import 'package:shop_sphere_dashboard/features/presention/view/controller/product_cubit/product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit({required this.productRepo}) : super(ProductInitial());
  final ProductRepo productRepo;
  Future<void> addProduct({
    required ProductModel product,
    required String dId,
  }) async {
    emit(ProductLoading());
    var result = await productRepo.addProduct(product: product, dId: dId);
    result.fold(
      (error) {
        emit(ProductFailer(errMessage: error.message));
      },
      (r) async {
        await getProducts();
        emit(ProductSuccess());
      },
    );
  }

  Future<void> getProducts() async {
    emit(GetProductsLoading());
    var result = await productRepo.getProducts();
    result.fold(
      (error) {
        emit(ProductFailer(errMessage: error.message));
      },
      (products) {
        emit(GetProductsSuccess(products: products));
      },
    );
  }

  Future<void> deleteProduct({required String dId, required imageUrl}) async {
    emit(ProductLoading());
    var result = await productRepo.deleteProduct(dId: dId, imageUrl: imageUrl);
    result.fold(
      (error) {
        emit(ProductFailer(errMessage: error.message));
      },
      (r) async {
        emit(ProductSuccess());
                await getProducts();

      },
    );
  }

  Future<void> updateProduct({
    required String dId,
    required ProductModel data,
  }) async {
    emit(ProductLoading());
    var result = await productRepo.updateProduct(dId: dId, data: data);
    result.fold(
      (error) {
        emit(ProductFailer(errMessage: error.message));
      },
      (r) async {
      
          emit(ProductSuccess());
            await getProducts();
      },
    );
  }
}
