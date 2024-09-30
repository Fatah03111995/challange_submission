import 'package:challange_submission/core/theme/text_styles.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'This is HOMEPAGE',
          style: TextStyles.m,
        ),
      ),
    );
  }
}
