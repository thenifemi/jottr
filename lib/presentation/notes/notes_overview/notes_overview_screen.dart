import 'package:Jottr/application/auth/auth_bloc.dart';
import 'package:Jottr/presentation/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotesOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Jottr',
          style: TextStyle(
            color: AppColors.primaryDark,
            fontSize: 24.0,
          ),
        ),
        actions: [
          const IconButton(
              icon: Icon(
                Icons.check_box_rounded,
                color: AppColors.primaryDark,
              ),
              onPressed: null),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: GestureDetector(
              onTap: () {
                context.bloc<AuthBloc>().add(const AuthEvent.signedOut());
              },
              child: const CircleAvatar(),
            ),
          ),
        ],
        elevation: 0.0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //TODO: Navigate to NoteFormScreen
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
