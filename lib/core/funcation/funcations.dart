
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Funcations {
 static  Color getStatusColor(String status) {
    switch (status) {
      case 'Pending':
        return Colors.orange;
      case 'Shipped':
        return Colors.blue;
      case 'Delivered':
        return Colors.green;
      default:
        return Colors.black;
    }
  }
 static Future<File?> pickImageFromGallery() async {
    final ImagePicker picker = ImagePicker();

    final XFile? image =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 50);

    if (image != null) {
      return File(image.path) ;
    } else {
      return null;
    }
  }

}