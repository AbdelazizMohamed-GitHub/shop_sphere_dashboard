import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shop_sphere_dashboard/features/data/model/product_model.dart';
import 'package:shop_sphere_dashboard/features/domain/entity/prosuct_entity.dart';

class FirestoreService {
 static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

 static Future<void> addProduct({required String dId, required Map<String, dynamic> data}) async {
 
      await _firestore.collection('products').doc(dId).set(data);
   
  }
   static Future<List<ProductEntity>> gettProducts() async {
    final snapshot = await _firestore.collection('products').get();
    return snapshot.docs.map((doc) => ProductModel.fromMap(doc.data())).toList();
    
  }

  
}