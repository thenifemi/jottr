import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jottr/presentation/core/colors.dart';

import '../../application/auth/sign_in_form/sign_in_form_bloc.dart';
import '../../injection.dart';
import 'widgets/sign_in_form_widget.dart';

class SignInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkSmoke,
      body: BlocProvider(
        create: (context) => getIt<SignInFormBloc>(),
        child: SignInFormWidget(),
      ),
    );
  }
}
