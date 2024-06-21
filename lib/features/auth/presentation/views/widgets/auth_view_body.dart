import 'package:flash_chat/core/utils/assets_data.dart';
import 'package:flash_chat/features/auth/presentation/views/login_view.dart';
import 'package:flash_chat/features/auth/presentation/views/register_view.dart';
import 'package:flutter/material.dart';

import 'custom_elevated_button.dart';

class AuthViewBody extends StatelessWidget {
  const AuthViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: Column(
        children: [
          Hero(
            tag: 'splash',
            child: Image.asset(
              AssetsData.logo,
              fit: BoxFit.cover,
            ),
          ),
          const Spacer(),
          CustomElevatedButton(
            title: 'Login',
            backgroundColor: Colors.blue[300],
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const LoginView(),
                ),
              );
            },
          ),
          const SizedBox(
            height: 20,
          ),
          CustomElevatedButton(
            title: 'Register',
            backgroundColor: Colors.blue[700],
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const RegisterView(),
                ),
              );
            },
          ),
          const SizedBox(
            height: 60,
          ),
        ],
      ),
    );
  }
}
