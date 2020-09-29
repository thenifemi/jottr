import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jottr/application/auth/sign_in_form/sign_in_form_bloc.dart';
import 'package:jottr/presentation/core/colors.dart';

class SignInFormWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInFormBloc, SignInFormState>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Form(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                const SizedBox(height: 20.0),
                RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(text: "Log In "),
                      TextSpan(
                        text: "or",
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      TextSpan(
                        text: " Sign Up",
                        style: TextStyle(
                            fontSize: 45.0,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryOrange),
                      ),
                    ],
                    style: TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primarygray),
                  ),
                ),
                const SizedBox(height: 10.0),
                const Text(
                  "Yunno! Whatever you wanna do..",
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primarygray),
                ),
                const SizedBox(height: 40.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Email",
                      style: TextStyle(
                          fontSize: 14.0, color: AppColors.primarygray),
                    ),
                    const SizedBox(height: 5.0),
                    TextFormField(
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                      decoration: const InputDecoration(
                        labelText: 'Your email',
                        labelStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 14.0,
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        fillColor: AppColors.primarygray,
                        filled: true,
                      ),
                      autocorrect: false,
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Password",
                      style: TextStyle(
                          fontSize: 14.0, color: AppColors.primarygray),
                    ),
                    const SizedBox(height: 5.0),
                    TextFormField(
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                      decoration: const InputDecoration(
                        labelText: 'Your password',
                        labelStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 14.0,
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        fillColor: AppColors.primarygray,
                        filled: true,
                      ),
                      autocorrect: false,
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
