import 'package:app/core/constants/constants.dart';
import 'package:app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class DefaultSwitchTile extends StatelessWidget {
  const DefaultSwitchTile({
    super.key,
    required this.value,
    this.onChanged,
    required this.titleText,
    this.icon,
  });

  final bool value;
  final void Function(bool)? onChanged;
  final String titleText;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      value: value,
      dense: true,
      activeTrackColor: kPrimaryColor,
      activeColor: kWhiteColor,
      inactiveThumbColor: kLightTextColor.withOpacity(0.9),
      contentPadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      title: Row(
        children: [
          if (icon != null)
            Container(
              alignment: Alignment.center,
              child: icon!,
            ),
          if (icon != null) const SizedBox(width: 8),
          Text(
            titleText,
            style: AppStyles.text16.copyWith(
              color: kWhiteColor,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
      onChanged: onChanged,
    );
  }
}
