import 'dart:io';

import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  static final SupabaseClient supabase = Supabase.instance.client;

  static Future<String> uploadImage({required File file}) async {
    final fileName = '${DateTime.now().millisecondsSinceEpoch}.png';
    await supabase.storage.from('products').upload(fileName, file);

    String imageUrl = supabase.storage.from('products').getPublicUrl(fileName);

    return imageUrl;
  }

  void deleteImage({required String fileName}) {
    supabase.storage.from('products').remove([fileName]);
  }
}
