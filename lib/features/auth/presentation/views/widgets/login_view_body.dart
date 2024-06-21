import 'package:flash_chat/core/functions/dialog_message.dart';
import 'package:flash_chat/core/utils/assets_data.dart';
import 'package:flash_chat/features/auth/presentation/manager/login/login_cubit.dart';
import 'package:flash_chat/features/auth/presentation/views/widgets/custom_elevated_button.dart';
import 'package:flash_chat/features/home/presentation/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  void sumbit() {
    final isValidate = _formKey.currentState!.validate();
    if (isValidate) {
      _formKey.currentState!.save();
      debugPrint('Your Email :$email');
      debugPrint('Your Password :$password');
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          dialog(context, title: 'Login Success', onPressed: () {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (context) => const HomeView(),
                ),
                (route) => false);
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const HomeView(),
              ),
            );
          });
        } else if (state is LoginFailuare) {
          dialog(
            context,
            title: '${state.errorMessage.message}',
            onPressed: () {
              Navigator.of(context).pop();
            },
          );
        }
      },
      builder: (context, state) {
        return Column(
          children: [
            const SizedBox(height: 24),
            Expanded(
              child: Hero(
                tag: 'splash',
                child: Image.asset(
                  AssetsData.logo,
                ),
              ),
            ),
            const Text(
              'Please Login',
              style: TextStyle(
                fontSize: 24,
                color: Colors.amber,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 50),
            Form(
              key: _formKey,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
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
            state is LoginLoading
                ? const CircularProgressIndicator(
                    color: Colors.amber,
                  )
                : CustomElevatedButton(
                    title: 'Login',
                    backgroundColor: const Color.fromARGB(255, 236, 205, 111),
                    onPressed: () {
                      sumbit();
                      BlocProvider.of<LoginCubit>(context)
                          .login(email: email, password: password);
                    },
                  ),
            const SizedBox(height: 20),
          ],
        );
      },
    );
  }
}
