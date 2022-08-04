import 'package:biz/stores/main_screen_store.dart';
import 'package:biz/utils/custom_alerts.dart';
import 'package:biz/utils/custom_validator.dart';
import 'package:biz/utils/form_helper.dart';
import 'package:get_it/get_it.dart';

import 'constants/function_response.dart';

final getIt = GetIt.instance;

Future<void> setupLocator() async {
  //Custom Utilities
  getIt.registerFactory(() => FunctionResponse());
  getIt.registerFactory(() => CustomAlerts());
  getIt.registerFactory(() => CustomValidator());
  getIt.registerFactory(() => CustomFormHelper());
  // Screens
  getIt.registerSingleton(MainScreenStore());
}
