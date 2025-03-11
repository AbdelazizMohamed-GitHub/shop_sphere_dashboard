import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
 static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

 static Future<void> addProduct({required Map<String, dynamic> data}) async {
    try {
      await _firestore.collection('products').add(data);
    } catch (e) {
      print(e);
    }
  }
  
}