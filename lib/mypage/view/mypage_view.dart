import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyPageView extends StatelessWidget {
  const MyPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          context.push('/login');
        },
        child: Text('로그인'),
      ),
    );
  }
}
