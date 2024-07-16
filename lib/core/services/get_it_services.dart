import 'package:get_it/get_it.dart';
import 'package:souq/core/services/firebase_auth_service.dart';
import 'package:souq/features/auth/data/domain/repo/auth_repo.dart';
import 'package:souq/features/auth/data/repos/auth_repo_impl.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  getIt.registerSingleton<AuthRepo>(
    AuthRepoIml(
      firebaseAuthService: getIt<FirebaseAuthService>(),
    ),
  );
}
