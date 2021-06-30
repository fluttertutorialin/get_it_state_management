import 'package:configuration/di/di_module.dart';
import '../../data/verify/repositories/app_repository.dart';

class RepoModule extends DIModule {
  @override
  provides() async {
    getIt.registerFactory(() => AppRepository(collectionApi: getIt.get()));
  }
}
