import 'package:app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Animate(
      effects: const [
        FadeEffect(),
      ],
      child: const Center(
        child: Text(
          'Home View',
          style: AppStyles.text16,
        ),
      ),
    );
  }
}
