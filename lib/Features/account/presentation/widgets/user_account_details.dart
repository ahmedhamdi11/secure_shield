import 'package:app/Features/Auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:app/core/constants/constants.dart';
import 'package:app/core/functions/show_toast_message.dart';
import 'package:app/core/manager/theme_cubit/theme_cubit.dart';
import 'package:app/core/utils/app_router.dart';
import 'package:app/core/utils/app_styles.dart';
import 'package:app/core/widgets/svg_icon_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class UserAccountDetails extends StatelessWidget {
  const UserAccountDetails({
    super.key,
  });

  void _onSignOuSuccess(String successMessage, BuildContext context) {
    showToastMessage(
      successMessage,
      backgroundColor: kPrimaryColor,
    );
    GoRouter.of(context).pushReplacement(AppRouter.signInViewPath);
  }

  void _onSignOuFailure(String errMessage, BuildContext context) {
    showToastMessage(
      errMessage,
      backgroundColor: kRedColor,
    );
    GoRouter.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final currentUser = FirebaseAuth.instance.currentUser!;
    final cubit = context.read<ThemeCubit>();

    return BlocListener<AuthCubit, AuthStates>(
      listener: (context, state) {
        if (state is SignOutUserFailureState) {
          _onSignOuFailure(state.errMessage, context);
        } else if (state is SignOutUserSuccessState) {
          _onSignOuSuccess(state.successMessage, context);
        }
      },
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Profile Info',
                style: AppStyles.text20.copyWith(
                  color: cubit.isDarkTheme ? kWhiteColor : kLightTextColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                decoration: BoxDecoration(
                  color: cubit.isDarkTheme ? kCardColor : kLightCardColor,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 32,
                      backgroundColor: cubit.isDarkTheme
                          ? kIconsBackgroundColor
                          : kLightTextColor.withOpacity(0.8),
                      backgroundImage: currentUser.photoURL != null
                          ? CachedNetworkImageProvider(
                              currentUser.photoURL!,
                            )
                          : null,
                      child: currentUser.photoURL != null
                          ? null
                          : const SvgIconWidget(
                              iconPath: 'assets/icons/account_icon.svg',
                            ),
                    ),
                    const SizedBox(width: 18),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            currentUser.displayName != null &&
                                    currentUser.displayName != ''
                                ? currentUser.displayName!
                                : 'username',
                            style: AppStyles.text22.copyWith(
                              color: kWhiteColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(width: 4),
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              currentUser.email != null
                                  ? currentUser.email!
                                  : 'email',
                              style: AppStyles.text18.copyWith(
                                color: kWhiteColor.withOpacity(0.6),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
