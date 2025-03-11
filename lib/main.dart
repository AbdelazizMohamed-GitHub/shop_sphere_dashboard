import 'package:flutter/material.dart';
import 'package:shop_sphere_dashboard/core/utils/app_color.dart';
import 'package:shop_sphere_dashboard/core/utils/app_styles.dart';
import 'package:shop_sphere_dashboard/features/presention/view/screen/add_product_screen.dart';
import 'package:shop_sphere_dashboard/features/presention/view/screen/main_screen.dart';
import 'package:shop_sphere_dashboard/features/presention/view/screen/product_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.backgroundColor,
        appBarTheme: AppBarTheme(
          centerTitle: true,elevation: 0,
          backgroundColor: AppColors.backgroundColor,
          titleTextStyle: AppStyles.text26BoldBlack,
        ),
      ),
      home: const AddProductScreen(),
    );
  }
}
