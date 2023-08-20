import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GetIt locator = GetIt.instance;

initLocator() async {
  final sharedPrefs = await SharedPreferences.getInstance();
  locator.registerLazySingleton(() => sharedPrefs);
}
