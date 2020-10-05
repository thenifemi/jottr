import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:Jottr/presentation/core/colors.dart';

import '../sign_in/sign_in_screen.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Jottr',
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
    );
  }
}
