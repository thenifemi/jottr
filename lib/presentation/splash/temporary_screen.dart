import 'package:Jottr/presentation/core/colors.dart';
import 'package:flutter/material.dart';

class TemporaryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "AUTHENTICATED!",
          style: TextStyle(
            fontSize: 45.0,
            color: AppColors.primarygray,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
