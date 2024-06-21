import 'package:flash_chat/features/auth/presentation/manager/register/register_cubit.dart';
import 'package:flash_chat/features/auth/presentation/views/widgets/register_view_body.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: Scaffold(
        body: RegisterViewBody(),
      ),
    );
  }
}
