import 'package:flutter/material.dart';
import 'package:mogu_mobile/common/layout/default_layout.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      needAlarm: false,
      child: Center(
        child: Text('로그인페이지'),
      ),
    );
  }
}
