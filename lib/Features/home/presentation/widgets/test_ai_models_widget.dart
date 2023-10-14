import 'package:app/core/utils/app_router.dart';
import 'package:app/core/widgets/default_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TestAiModelsWidget extends StatelessWidget {
  const TestAiModelsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(18.0),
      children: [
        DefaultButton(
          onPressed: () =>
              GoRouter.of(context).push(AppRouter.fraudsDetectionViewPath),
          btnText: 'Fraud Detection',
        ),
        const SizedBox(
          height: 12.0,
        ),
        DefaultButton(
          onPressed: () =>
              GoRouter.of(context).push(AppRouter.attackDetectionViewPath),
          btnText: 'Attack Detection',
        ),
        const SizedBox(
          height: 12.0,
        ),
        DefaultButton(
          onPressed: () =>
              GoRouter.of(context).push(AppRouter.malwareDetectionViewPath),
          btnText: 'Malware Detection',
        ),
        const SizedBox(
          height: 12.0,
        ),
        DefaultButton(
          onPressed: () =>
              GoRouter.of(context).push(AppRouter.emailDetectionViewPath),
          btnText: 'Phishing Email Detection',
        ),
      ],
    );
  }
}