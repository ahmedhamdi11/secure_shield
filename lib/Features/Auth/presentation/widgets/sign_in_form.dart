import 'package:app/Features/Auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:app/core/constants/constants.dart';
import 'package:app/core/functions/show_toast_message.dart';
import 'package:app/core/utils/app_router.dart';
import 'package:app/core/widgets/default_button.dart';
import 'package:app/core/widgets/default_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    AuthCubit cubit = BlocProvider.of<AuthCubit>(context);

    return Form(
      key: cubit.formKey,
      child: Column(
        children: [
          // email field
          DefaultTextField(
            hintText: 'Email',
            onChanged: (value) {
              cubit.email = value;
            },
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your email.';
              } else {
                return null;
              }
            },
            keyboardType: TextInputType.emailAddress,
          ),

          const SizedBox(height: 12.0),

          // password field
          DefaultTextField(
            hintText: 'Password',
            onChanged: (value) {
              cubit.password = value;
            },
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your password.';
              } else {
                return null;
              }
            },
            isHiddenPassword: true,
            suffix: Padding(
              padding: const EdgeInsetsDirectional.only(end: 8.0),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.visibility_off,
                  size: 22.0,
                ),
              ),
            ),
          ),

          // forgot password button
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {},
              child: const Text('Forgot password?'),
            ),
          ),

          const SizedBox(height: 16.0),

          // sign in button
          BlocConsumer<AuthCubit, AuthStates>(
            listener: (context, state) {
              if (state is SignInUserFailureState) {
                _onSignInFailure(state.errMessage);
              } else if (state is SignInUserSuccessState) {
                _onSignInSuccess(state.successMessage, context);
              }
            },
            builder: (context, state) {
              if (state is SignInUserLoadingState) {
                return const SizedBox(
                  height: 55,
                  child: Center(child: CircularProgressIndicator()),
                );
              } else {
                return DefaultButton(
                  onPressed: () => cubit.signInUser(),
                  btnText: 'Sign In',
                );
              }
            },
          ),
        ],
      ),
    );
  }

  void _onSignInSuccess(String successMessage, BuildContext context) {
    showToastMessage(
      successMessage,
      backgroundColor: kSuccessColor,
    );
    GoRouter.of(context).pushReplacement(AppRouter.homeViewPath);
  }

  void _onSignInFailure(String errMessage) {
    showToastMessage(
      errMessage,
      backgroundColor: kErrorColor,
    );
  }
}