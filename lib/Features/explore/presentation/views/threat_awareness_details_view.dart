import 'package:app/Features/explore/data/models/threat_awareness_model.dart';
import 'package:app/core/constants/constants.dart';
import 'package:app/core/manager/theme_cubit/theme_cubit.dart';
import 'package:app/core/utils/app_styles.dart';
import 'package:app/core/widgets/default_back_button.dart';
import 'package:app/core/widgets/default_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThreatAwarenessDetailsView extends StatelessWidget {
  const ThreatAwarenessDetailsView({super.key, required this.data});

  final ThreatAwarenessModel data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const DefaultBackButton(),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        children: [
          const SizedBox(height: 20),

          // title
          Text(
            data.title,
            style: AppStyles.text22.copyWith(
              color: context.read<ThemeCubit>().isDarkTheme
                  ? kWhiteColor
                  : kLightTextColor,
            ),
          ),

          const SizedBox(height: 12),

          // image
          Stack(
            children: [
              // background corners
              Positioned(
                top: 0,
                left: 0,
                child: Container(
                  width: 75,
                  height: 75,
                  decoration: BoxDecoration(
                    color: kSecondaryColor,
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  width: 75,
                  height: 75,
                  decoration: BoxDecoration(
                    color: kSecondaryColor,
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
              ),

              // image
              DefaultNetworkImage(
                imageUrl: data.imageUrl,
                width: MediaQuery.sizeOf(context).width,
                height: 200,
                margin: const EdgeInsets.all(2),
              ),
            ],
          ),

          const SizedBox(height: 28),

          // description
          Text(
            data.desc,
            style: AppStyles.text16.copyWith(
              color: context.read<ThemeCubit>().isDarkTheme
                  ? kWhiteColor.withOpacity(0.8)
                  : kLightTextColor,
            ),
          ),

          const SizedBox(height: 38),
        ],
      ),
    );
  }
}
