import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Jottr/application/auth/auth_bloc.dart';

import '../../application/auth/auth_bloc.dart';
import '../../injection.dart';
import '../sign_in/sign_in_screen.dart';
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
          inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        home: AnnotatedRegion<SystemUiOverlayStyle>(
            value: const SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.dark,
            ),
            child: SignInScreen()),
      ),
    );
  }
}
