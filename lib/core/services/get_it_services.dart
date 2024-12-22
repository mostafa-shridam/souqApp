import 'package:get_it/get_it.dart';
import 'package:souq/core/repos/product_repo/product_repo.dart';
import 'package:souq/core/repos/product_repo/product_repo_impl.dart';
import 'package:souq/core/services/data_services.dart';
import 'package:souq/core/services/firebase_auth_service.dart';
import 'package:souq/core/services/firestore_services.dart';
import 'package:souq/features/auth/data/domain/repo/auth_repo.dart';
import 'package:souq/features/auth/data/repos/auth_repo_impl.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  getIt.registerSingleton<DatabaseService>(FireStoreService());
  getIt.registerSingleton<AuthRepo>(
    AuthRepoIml(
      databaseService: getIt<DatabaseService>(),
      firebaseAuthService: getIt<FirebaseAuthService>(),
    ),
  );
    getIt.registerSingleton<ProductRepo>(
    ProductRepoImpl(
      databaseService: getIt<DatabaseService>(),
    ),
  );
}