import 'package:dartz/dartz.dart';
import 'package:shop_sphere_dashboard/core/errors/firebase_failure.dart';
import 'package:shop_sphere_dashboard/features/data/model/product_model.dart';
import 'package:shop_sphere_dashboard/features/domain/entity/prosuct_entity.dart';

abstract class ProductRepo {
  Future<Either<FirebaseFailure, String>> addProduct({
    required ProductModel product,
    required String dId,
  });
  
  Future<Either<FirebaseFailure, List<ProductEntity>>> getProducts();
  
  Future<Either<FirebaseFailure, void>> deleteProduct({required String dId,required String imageUrl});
  
  Future<Either<FirebaseFailure, void>> updateProduct({required String dId, required ProductModel data});

}
