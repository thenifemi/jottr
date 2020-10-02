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
                const Text(
                  "JOTTR.",
                  style: TextStyle(
                      fontSize: 45.0,
                      color: AppColors.primarygray,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 40.0),
                const Text(
                  "Log into your account!",
                  style: TextStyle(
                    fontSize: 16.0,
                    color: AppColors.primarygray,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 5.0),
                const Text(
                  "If you dont have an account, Click Signup!",
                  style: TextStyle(
                    fontSize: 16.0,
                    color: AppColors.primaryDark,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 40.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Email",
                      style: TextStyle(
                        fontSize: 14.0,
                        color: AppColors.primarygray,
                      ),
                    ),
                    const SizedBox(height: 5.0),
                    TextFormField(
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                      decoration: const InputDecoration(
                        labelText: 'Your email',
                        labelStyle: TextStyle(
                          color: AppColors.primarygray,
                          fontSize: 14.0,
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        fillColor: Colors.white,
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
                          color: AppColors.primarygray,
                          fontSize: 14.0,
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        fillColor: Colors.white,
                        filled: true,
                      ),
                      autocorrect: false,
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                    ),
                    const SizedBox(height: 30.0),
                    Row(
                      children: [
                        Expanded(
                          child: RawMaterialButton(
                            onPressed: () {},
                            fillColor: AppColors.primaryDark,
                            child: const Text('LOG IN'),
                          ),
                        ),
                        const SizedBox(width: 15.0),
                        Expanded(
                          child: RawMaterialButton(
                            onPressed: () {},
                            fillColor: AppColors.primaryDark,
                            child: const Text('SIGN UP'),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30.0),
                    SizedBox(
                      width: double.infinity,
                      child: RawMaterialButton(
                        onPressed: () {},
                        fillColor: Colors.blue,
                        child: const Text('SIGN IN WITH GOOGLE'),
                      ),
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
