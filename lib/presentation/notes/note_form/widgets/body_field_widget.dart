import 'package:Jottr/presentation/core/colors.dart';
import 'package:flutter/material.dart';

class BodyField extends StatelessWidget {
  const BodyField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextFormField(
        cursorColor: AppColors.primaryDark,
        // ignore: avoid_bool_literals_in_conditional_expressions
        style: const TextStyle(
          color: AppColors.primarygray,
        ),
        decoration: const InputDecoration(
          labelText: 'Note',
          contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
          labelStyle: TextStyle(
            color: AppColors.primarygray,
            fontSize: 14.0,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          fillColor: Colors.white,
          filled: true,
        ),
      ),
    );
  }
}
