// ignore_for_file: must_be_immutable
import 'package:flash_chat/core/utils/assets_data.dart';
import 'package:flash_chat/features/auth/presentation/manager/register/register_cubit.dart';
import 'package:flash_chat/features/auth/presentation/views/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/functions/dialog_message.dart';
import 'custom_elevated_button.dart';

class RegisterViewBody extends StatelessWidget {
  RegisterViewBody({super.key});

  final _formKey = GlobalKey<FormState>();

  String? email;
  String? password;

  void sumbit() {
    final isValidate = _formKey.currentState!.validate();
    if (!isValidate) {
      return;
    }
    _formKey.currentState!.save();
    debugPrint('Your Email :$email');
    debugPrint('Your Password :$password');
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterSuccess) {
          dialog(context, title: 'Register Completed \n Login Now!',
              onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const LoginView(),
              ),
            );
          });
        } else if (state is RegisterFailuare) {
          dialog(context, title: '${state.errorMessage.message}',
              onPressed: () {
            Navigator.pop(context);
          });
        }
      },
      builder: (context, state) {
        return Column(
          children: [
            Expanded(
              child: Hero(
                tag: 'splash',
                child: Image.asset(
                  AssetsData.logo,
                ),
              ),
            ),
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        hintText: 'Email',
                        labelText: 'Email Adress',
                      ),
                      keyboardType: TextInputType.emailAddress,
                      textCapitalization: TextCapitalization.none,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Cant Be Empty';
                        } else if (value.length < 10) {
                          return 'enter  validate Email';
                        }
                        return null;
                      },
                      onSaved: (newValue) {
                        email = newValue;
                      },
                    ),
                    const SizedBox(height: 24),
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        hintText: 'Password',
                        labelText: 'Enter Password',
                      ),
                      keyboardType: TextInputType.emailAddress,
                      textCapitalization: TextCapitalization.none,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Cant Be Empty';
                        } else if (value.length < 5) {
                          return 'enter  validate Email';
                        }
                        return null;
                      },
                      onSaved: (newValue) {
                        password = newValue;
                      },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 42),
            state is RegisterLoading
                ? const CircularProgressIndicator()
                : CustomElevatedButton(
                    title: 'Register',
                    backgroundColor: const Color.fromARGB(255, 236, 205, 111),
                    onPressed: () {
                      sumbit();
                      BlocProvider.of<RegisterCubit>(context).register(
                          email: email, password: password, formKey: _formKey);
                    },
                  ),
            const SizedBox(height: 20),
          ],
        );
      },
    );
  }
}
