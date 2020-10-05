import 'package:Jottr/presentation/splash/splash_screen.dart';
import 'package:auto_route/auto_route_annotations.dart';
import 'package:Jottr/presentation/sign_in/sign_in_screen.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    CupertinoRoute(page: SplashScreen, initial: true),
    CupertinoRoute(page: SignInScreen),
  ],
  generateNavigationHelperExtension: true,
)
class $MyRouter {}
