import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/auth/sign_in_form/sign_in_form_bloc.dart';
import '../../core/colors.dart';

class SignInFormWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInFormBloc, SignInFormState>(
      listener: (BuildContext context, state) {
        state.authFailureOrSuccessOption.fold(
          () {},
          (either) => either.fold(
            (failure) {
              Flushbar(
                message: failure.map(
                  cancelledByUser: (_) => 'Cancelled',
                  serverError: (_) => 'Oops! Server error',
                  emailAlreadyInUse: (_) => 'Email already in use',
                  invalidEmailAndPasswordCombination: (_) =>
                      'Invalid email and password combination',
                ),
                flushbarStyle: FlushbarStyle.FLOATING,
                duration: const Duration(seconds: 3),
                margin: const EdgeInsets.all(15),
                borderRadius: 8,
              ).show(context);
            },
            (_) => {
              //TODO: Navigate
            },
          ),
        );
      },
      builder: (BuildContext context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Form(
            // ignore: deprecated_member_use
            autovalidate: state.showErrorMessages,
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
                  "Don't have an account? Just click Sign Up!",
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
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 5.0),
                    TextFormField(
                      style: const TextStyle(
                        color: AppColors.primarygray,
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
                      onChanged: (value) => context
                          .bloc<SignInFormBloc>()
                          .add(SignInFormEvent.emailChanged(value)),
                      validator: (_) => context
                          .bloc<SignInFormBloc>()
                          .state
                          .emailAddress
                          .value
                          .fold(
                            (f) => f.maybeMap(
                              invalidEmail: (_) => 'Invalid Email',
                              orElse: () => null,
                            ),
                            (_) => null,
                          ),
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
                        fontSize: 14.0,
                        color: AppColors.primarygray,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 5.0),
                    TextFormField(
                      style: const TextStyle(
                        color: AppColors.primarygray,
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
                      onChanged: (value) => context
                          .bloc<SignInFormBloc>()
                          .add(SignInFormEvent.passwordChanged(value)),
                      validator: (_) => context
                          .bloc<SignInFormBloc>()
                          .state
                          .password
                          .value
                          .fold(
                            (f) => f.maybeMap(
                              shortPassword: (_) => 'Password is too short',
                              orElse: () => null,
                            ),
                            (_) => null,
                          ),
                    ),
                    const SizedBox(height: 30.0),
                    Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 45.0,
                            child: RawMaterialButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              onPressed: () {
                                context.bloc<SignInFormBloc>().add(
                                    const SignInFormEvent
                                        .signInWithEmailAndPasswordPressed());
                              },
                              fillColor: AppColors.primaryDark,
                              elevation: 0.0,
                              child: const Text(
                                'Log In',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 15.0),
                        Expanded(
                          child: SizedBox(
                            height: 45.0,
                            child: RawMaterialButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              onPressed: () {
                                context.bloc<SignInFormBloc>().add(
                                      const SignInFormEvent
                                          .registerWithEmailAndPasswordPressed(),
                                    );
                              },
                              fillColor: AppColors.primaryDark,
                              elevation: 0.0,
                              child: const Text(
                                'Sign Up',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20.0),
                    SizedBox(
                      width: double.infinity,
                      height: 45.0,
                      child: RawMaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        onPressed: () {
                          context.bloc<SignInFormBloc>().add(
                              const SignInFormEvent.signInWithGooglePressed());
                        },
                        fillColor: Colors.grey[300],
                        elevation: 0.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/core/logos/google_G_logo.png',
                              height: 20.0,
                            ),
                            const SizedBox(width: 5.0),
                            const Text(
                              'SIGN IN WITH GOOGLE',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
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
