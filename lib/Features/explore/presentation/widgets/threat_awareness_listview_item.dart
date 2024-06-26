import 'package:app/Features/explore/data/models/threat_awareness_model.dart';
import 'package:app/core/constants/constants.dart';
import 'package:app/core/manager/theme_cubit/theme_cubit.dart';
import 'package:app/core/utils/app_router.dart';
import 'package:app/core/utils/app_styles.dart';
import 'package:app/core/widgets/default_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ThreatAwarenessListViewItem extends StatelessWidget {
  const ThreatAwarenessListViewItem({
    super.key,
    required this.treatAwarenessData,
  });

  final ThreatAwarenessModel treatAwarenessData;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ThemeCubit>();

    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(
          AppRouter.threatAwarenessDetailsPath,
          extra: treatAwarenessData,
        );
      },
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width * 0.8,
        child: Card(
          color: cubit.isDarkTheme ? kCardColor : kLightCardColor,
          margin: const EdgeInsetsDirectional.only(end: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                // details (title, description)
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        treatAwarenessData.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppStyles.text20.copyWith(color: kWhiteColor),
                      ),
                      Text(
                        treatAwarenessData.desc,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: AppStyles.text16
                            .copyWith(color: kWhiteColor.withOpacity(0.5)),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),

                // image
                Stack(
                  children: [
                    // background corners
                    Positioned(
                      top: 0,
                      left: 0,
                      child: Container(
                        width: 50,
                        height: 50,
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
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: kSecondaryColor,
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                    ),

                    // image
                    DefaultNetworkImage(
                      imageUrl: treatAwarenessData.imageUrl,
                      width: 100,
                      height: 100,
                      margin: const EdgeInsets.all(2),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
