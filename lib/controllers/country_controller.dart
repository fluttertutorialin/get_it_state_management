import 'package:configuration/data/common/api_exception.dart';
import 'package:get/get.dart';
import '../data/verify/repositories/app_repository.dart';
import '../view/dialogs/dialog.dart';

class CountryController extends GetxController {
  AppRepository appRepository;

  CountryController({required this.appRepository});

  getCountry() async {
    try {
      showDialogLoading();

      final response = await appRepository.getCountry();
      if (response?.code != null) {
        Get.back();
      } else {
        Get.back();
        print(response?.access);
      }
    } on ApiException catch (e) {
      Get.back();
      await showDialogError(content: e.errorMessage);
    } catch (e) {
      Get.back();
      showDialogError(content: 'An unknown error.');
    }
  }
}
