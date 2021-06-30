import 'package:configuration/utility/logging.dart';
import '../module/api_module.dart';
import '../module/components_module.dart';
import '../module/controller_module.dart';
import '../module/repo_module.dart';

class Injection {
  static Future inject() async {
    await ComponentsModule().provides();
    await ApiModule().provides();
    await RepoModule().provides();
    await ControllerModule().provides();
    Log.info("Injection", "---------------------> injected");
  }
}
