import 'package:get_it/get_it.dart';
import 'package:isolates_demo/services/api_services.dart';

GetIt serviceLocator = GetIt.instance;

setupServiceLocator() {
  // user management service
  serviceLocator.registerLazySingleton<ApiServices>(() => ApiServices());
}
