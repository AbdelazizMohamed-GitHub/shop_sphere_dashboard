// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import 'package:shop_sphere_dashboard/core/errors/firebase_failure.dart';
import 'package:shop_sphere_dashboard/core/service/firestore_service.dart';
import 'package:shop_sphere_dashboard/core/service/supabase_service.dart';
import 'package:shop_sphere_dashboard/features/data/model/product_model.dart';
import 'package:shop_sphere_dashboard/features/domain/entity/prosuct_entity.dart';
import 'package:shop_sphere_dashboard/features/domain/repo/product_repo.dart';

class ProductRepoImpl extends ProductRepo {
   FirestoreService firestoreService ;
  ProductRepoImpl({
    required this.firestoreService,
  });
  Future<Either<FirebaseFailure, String>> addProduct({
    required ProductModel product,
    required String dId,
  }) async {
    try {
      await firestoreService.addProduct(data: product.toMap(), dId: dId);
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
   var result=   await firestoreService.gettProducts();
      return Right(result);
    } on FirebaseException catch (e) {
      return Left((FirebaseFailure.fromCode(e.code)));
    }
  }
  
  @override
  Future<Either<FirebaseFailure, void>> deleteProduct({required String dId,required String imageUrl}) async{
try {
  await firestoreService.deleteProduct(dId: dId);

  SupabaseService.deleteImage(fileName: imageUrl);

  return Right('Product deleted successfully');
  
} on FirebaseException catch (e) {
  
  return Left((FirebaseFailure.fromCode(e.code)));
}
catch (e) {
  
  return Left((FirebaseFailure.fromCode(e.toString())));
  
}
  }
  
  @override
  Future<Either<FirebaseFailure, void>> updateProduct({required String dId, required ProductModel data})async {
 try {
    await firestoreService.updateProduct(dId: dId, data: data);
    return Right('Product updated successfully');
 } on FirebaseException catch (e) {
   
   return Left((FirebaseFailure.fromCode(e.code)));
 }
 catch (e) {
   
   return Left((FirebaseFailure.fromCode(e.toString())));
   
 }
  }
}
