import 'package:flash_chat/core/utils/assets_data.dart';
import 'package:flash_chat/features/auth/presentation/views/auth_view.dart';
import 'package:flutter/material.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(
        seconds: 3,
      ),
      () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const AuthView(),
        ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Hero(
        tag: 'splash',
        child: Image.asset(
          AssetsData.logo,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
