import 'package:Jottr/application/auth/auth_bloc.dart';
import 'package:Jottr/presentation/core/colors.dart';
import 'package:Jottr/presentation/routes/router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        state.map(
          initial: (_) {},
          authenticated: (_) =>
              ExtendedNavigator.of(context).replace(Routes.notesOverviewScreen),
          unAuthenticated: (_) =>
              ExtendedNavigator.of(context).replace(Routes.signInScreen),
        );
      },
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
        ),
        child: Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "JOTTR.",
                  style: TextStyle(
                    fontSize: 45.0,
                    color: AppColors.primarygray,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 10.0),
                CircularProgressIndicator(
                  backgroundColor: AppColors.primaryDark,
                  strokeWidth: 3.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
