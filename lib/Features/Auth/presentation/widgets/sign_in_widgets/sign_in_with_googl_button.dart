import 'package:app/Features/Auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:app/core/constants/constants.dart';
import 'package:app/core/manager/theme_cubit/theme_cubit.dart';
import 'package:app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class SignInWithGoogleButton extends StatelessWidget {
  const SignInWithGoogleButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ThemeCubit>();

    return InkWell(
      onTap: () => BlocProvider.of<AuthCubit>(context).singInWithGoogle(),
      borderRadius: BorderRadius.circular(25),
      child: Container(
        padding: const EdgeInsets.all(12),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
            color: cubit.isDarkTheme ? kWhiteColor : kLightTextColor,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              'assets/icons/google_icon.svg',
              width: 25,
              height: 25,
            ),
            const SizedBox(width: 8),
            Text(
              'SIGN IN WITH GOOGLE',
              style: AppStyles.text16.copyWith(
                color: cubit.isDarkTheme ? kWhiteColor : kLightTextColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
