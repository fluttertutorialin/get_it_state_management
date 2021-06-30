import 'package:configuration/di/di_module.dart';
import 'package:get/get.dart';
import '../../controllers/country_controller.dart';

class ControllerModule extends DIModule {
  @override
  provides() async {
    getIt.registerLazySingleton(
            () => Get.put(CountryController(appRepository: getIt.get())));
  }
}
