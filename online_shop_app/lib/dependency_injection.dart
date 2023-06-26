import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_list_app/services/auth_service/auth_service.dart';

class DependencyInjection {
  static final GetIt getIt = GetIt.instance;

  Future<void> init() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    getIt.registerSingleton<SharedPreferences>(sharedPreferences);
    getIt.registerSingleton<AuthService>(AuthService());
  }
}
