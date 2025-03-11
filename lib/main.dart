import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shop_sphere_dashboard/core/utils/app_color.dart';
import 'package:shop_sphere_dashboard/core/utils/app_styles.dart';
import 'package:shop_sphere_dashboard/features/presention/view/screen/add_product_screen.dart';
import 'package:shop_sphere_dashboard/firebase_options.dart';

void main()async {WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

 
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
