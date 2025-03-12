import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:shop_sphere_dashboard/core/errors/firebase_failure.dart';
import 'package:shop_sphere_dashboard/core/service/firestore_service.dart';
import 'package:shop_sphere_dashboard/features/data/model/product_model.dart';
import 'package:shop_sphere_dashboard/features/domain/entity/prosuct_entity.dart';
import 'package:shop_sphere_dashboard/features/domain/repo/product_repo.dart';

class ProductRepoImpl extends ProductRepo {
  @override
  Future<Either<FirebaseFailure, String>> addProduct({
    required ProductModel product,
    required String dId,
  }) async {
    try {
      await FirestoreService.addProduct(data: product.toMap(), dId: dId);
      return Right('Product added successfully');
    } on FirebaseException catch (e) {
      print("error code" + e.code);
      print("error message" + e.message.toString());
    return Left((FirebaseFailure.fromCode(e.code)));
    }
  }

  @override
  Future<Either<FirebaseFailure, List<ProductEntity>>> getProducts() async {
    try {
      await FirestoreService.gettProducts();
      return Right([]);
    } on FirebaseException catch (e) {
      return Left((FirebaseFailure.fromCode(e.code)));
    }
  }
}
