import 'package:covid_tracker/app/app_controller.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

void setUpAppProvider() async {
  GetIt.I.registerSingletonAsync<AppController>(() async {
    final prefs = await SharedPreferences.getInstance();
    return AppController(prefs: prefs);
  });
}
