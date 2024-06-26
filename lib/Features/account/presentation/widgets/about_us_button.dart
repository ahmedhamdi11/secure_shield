import 'dart:math' show pi;

import 'package:app/core/constants/constants.dart';
import 'package:app/core/functions/scroll_to_item.dart';
import 'package:app/core/manager/theme_cubit/theme_cubit.dart';
import 'package:app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AboutUsButton extends StatefulWidget {
  const AboutUsButton({
    super.key,
  });

  @override
  State<AboutUsButton> createState() => _AboutUsButtonState();
}

class _AboutUsButtonState extends State<AboutUsButton> {
  bool _isExpanded = false;
  final GlobalKey _globalKey = GlobalKey();
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ThemeCubit>();

    return GestureDetector(
      onTap: () {
        // toggle the expand
        setState(() {
          _isExpanded = !_isExpanded;
        });

        // scroll to the button to be fully displayed
        if (_isExpanded) {
          Future.delayed(const Duration(milliseconds: 100)).then(
            (value) => scrollToItem(_globalKey),
          );
        }
      },
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return AnimatedContainer(
            key: _globalKey,
            height: _isExpanded ? 350 : 74,
            duration: const Duration(milliseconds: 280),
            padding:
                const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 8),
            decoration: BoxDecoration(
              color: cubit.isDarkTheme ? kCardColor : kLightCardColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 38,
                  child: Row(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.info_outline,
                          color: cubit.isDarkTheme
                              ? kIconsBackgroundColor
                              : kLightTextColor,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'About Us',
                        style: AppStyles.text16.copyWith(
                          color: kWhiteColor,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const Spacer(),
                      Transform.rotate(
                        angle: _isExpanded ? pi / 2 : -pi / 2,
                        child: Icon(
                          Icons.arrow_back_ios_new,
                          color: cubit.isDarkTheme
                              ? kPrimaryColor
                              : kLightTextColor,
                          size: 18,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                if (_isExpanded)
                  Expanded(
                    child: Animate(
                      effects: const [FadeEffect()],
                      child: Scrollbar(
                        controller: _scrollController,
                        radius: const Radius.circular(20),
                        thumbVisibility: true,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: ListView(
                            controller: _scrollController,
                            padding: EdgeInsets.zero,
                            children: [
                              Text(
                                """
Secure Shield is an innovative application that protects individuals and organizations from cyber threats, safeguards bank accounts, secures all electronic devices, and raises awareness about cybersecurity by providing information on how to protect against cyberattacks.

Secure Shield App Features:
 * Email Protection: Secure Shield protects your email from phishing attacks and spam.
 
 * Fraud Protection: Secure Shield helps prevent fraudulent transactions and identity theft.
 
 * Virus Protection: Secure Shield guards your devices against malware and viruses.
 
Secure Shield App Benefits:
 * Easy to Use: Secure Shield is user-friendly and can be easily used by individuals and organizations.
 
 * Enhanced Security: Secure Shield provides comprehensive protection against a wide range of cyber threats.
 
 * Peace of Mind: Secure Shield gives you peace of mind knowing that your data and devices are safe.

Our Team:
 * Eng. Ahmed Hamdy
 * Eng. Iman Ali Shaaban
 * Eng. Mohamed Salah
 * Eng. Yasmine Mahrous
 * Eng. Mohamed Tamer
 * Eng. Ahmed Abdel Azim
""",
                                style: AppStyles.text14.copyWith(
                                  color: kWhiteColor.withOpacity(0.9),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
