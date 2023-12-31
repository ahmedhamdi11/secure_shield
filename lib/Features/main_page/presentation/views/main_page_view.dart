import 'package:app/Features/main_page/presentation/manager/cubits/cubit/main_page_cubit.dart';
import 'package:app/core/constants/constants.dart';
import 'package:app/core/widgets/default_animated_switcher.dart';
import 'package:app/core/widgets/svg_icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPageView extends StatelessWidget {
  const MainPageView({super.key});

  @override
  Widget build(BuildContext context) {
    MainPageCubit cubit = BlocProvider.of<MainPageCubit>(context);
    return BlocBuilder<MainPageCubit, MainPageStates>(
      builder: (context, state) {
        return Scaffold(
          extendBody: true,
          appBar: AppBar(
            title: DefaultAnimatedSwitcher(
              child: SizedBox(
                key: UniqueKey(),
                width: double.infinity,
                child: Text(
                  cubit.appViews[cubit.currentView].title,
                ),
              ),
            ),
          ),
          body: cubit.appViews[cubit.currentView].view,
          bottomNavigationBar: CurvedNavigationBar(
            backgroundColor: Colors.transparent,
            buttonBackgroundColor: kCardColor,
            color: kCardColor,
            animationDuration: const Duration(milliseconds: 400),
            onTap: (value) => cubit.onViewChanges(value),
            items: [
              SvgIconWidget(
                iconPath: 'assets/icons/home_icon.svg',
                iconColor: cubit.currentView == 0 ? kPrimaryColor : kWhiteColor,
              ),
              SvgIconWidget(
                iconPath: 'assets/icons/explore_icon.svg',
                iconColor: cubit.currentView == 1 ? kPrimaryColor : kWhiteColor,
              ),
              SvgIconWidget(
                iconPath: 'assets/icons/test_ai_icon.svg',
                iconColor: cubit.currentView == 2 ? kPrimaryColor : kWhiteColor,
              ),
              SvgIconWidget(
                iconPath: 'assets/icons/account_icon.svg',
                iconColor: cubit.currentView == 3 ? kPrimaryColor : kWhiteColor,
              ),
            ],
          ),
        );
      },
    );
  }
}
