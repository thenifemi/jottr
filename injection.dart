import 'package:injectable/injectable.dart';

@injectableInit
void configureInjection(String env) {
  $initGetIt(getIt, enviroment: env);
}
