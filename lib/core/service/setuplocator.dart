import 'package:get_it/get_it.dart';
import 'package:shop_sphere_dashboard/core/service/firestore_service.dart';
import 'package:shop_sphere_dashboard/core/service/supabase_service.dart';
import 'package:shop_sphere_dashboard/features/data/repo_impl/product_repo_impl.dart';
import 'package:shop_sphere_dashboard/features/presention/view/controller/product_cubit/product_cubit.dart';

GetIt getIt = GetIt.instance;

void setupLocator() {
  getIt.registerSingleton<SupabaseService>(SupabaseService());
  getIt.registerSingleton<FirestoreService>(FirestoreService());
  getIt.registerSingleton<ProductRepoImpl>(
    ProductRepoImpl(firestoreService: getIt<FirestoreService>()),
  );
  getIt.registerSingleton<ProductCubit>(
    ProductCubit(productRepo: getIt<ProductRepoImpl>()),
  );
}
