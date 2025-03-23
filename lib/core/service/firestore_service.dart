import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shop_sphere_dashboard/features/data/model/product_model.dart';
import 'package:shop_sphere_dashboard/features/domain/entity/prosuct_entity.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addProduct({required String dId, required Map<String, dynamic> data}) async {
 
      await _firestore.collection('products').doc(dId).set(data);
   
  }
    Future<List<ProductEntity>> gettProducts() async {
    final snapshot = await _firestore.collection('products').get();
    return snapshot.docs.map((doc) => ProductModel.fromMap(doc.data())).toList();
    
  }
  Future<void> deleteProduct({required String dId}) async {
    await _firestore.collection('products').doc(dId).delete();
  }
  Future<void> updateProduct({required String dId, required ProductModel data}) async {
    await _firestore.collection('products').doc(dId).update(data.toMap());
  }

  
}