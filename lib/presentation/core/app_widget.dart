import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/auth/auth_bloc.dart';
import '../../injection.dart';
import '../routes/router.gr.dart';
import 'colors.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              getIt<AuthBloc>()..add(const AuthEvent.authCheckRequested()),
        ),
      ],
      child: MaterialApp(
          title: 'Jottr',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: AppColors.primarySmoke,
            accentColor: Colors.white30,
            floatingActionButtonTheme: const FloatingActionButtonThemeData(
              backgroundColor: AppColors.primaryDark,
            ),
            inputDecorationTheme: InputDecorationTheme(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          builder: ExtendedNavigator.builder(
            router: MyRouter(),
          )),
    );
  }
}
