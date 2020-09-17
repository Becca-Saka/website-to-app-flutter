
import 'package:get_it/get_it.dart';
import 'package:stacked_services/stacked_services.dart';

GetIt locator = GetIt.instance;

setUpLocator(){
  locator.registerLazySingleton(() => NavigationService());
}