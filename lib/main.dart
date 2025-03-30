import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_sphere_dashboard/core/service/setuplocator.dart';
import 'package:shop_sphere_dashboard/core/utils/app_color.dart';
import 'package:shop_sphere_dashboard/core/utils/app_key.dart';
import 'package:shop_sphere_dashboard/core/utils/app_styles.dart';
import 'package:shop_sphere_dashboard/features/presention/view/controller/product_cubit/product_cubit.dart';
import 'package:shop_sphere_dashboard/features/presention/view/screen/product_screen.dart';
import 'package:shop_sphere_dashboard/firebase_options.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Supabase.initialize(
    url: AppKeys.supbaseUrl,
    anonKey: AppKeys.supbaseApiKey,
  );
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>getIt<ProductCubit>(),
      child: MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.backgroundColor,
          appBarTheme: AppBarTheme(
            centerTitle: true,
            elevation: 0,
            backgroundColor: AppColors.backgroundColor,
            titleTextStyle: AppStyles.text26BoldBlack,
          ),
        ),
        home: ProductScreen(),
      ),
    );
  }
}
