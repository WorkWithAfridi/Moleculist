// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:moleculist/presentation/views/global/widgets/custom_loader.dart';

import '../../../../common/resources/color/app_colors.dart';
import '../../../../common/resources/dimentions/app_sizes.dart';

/// A custom button widget that supports various styles and configurations.
class CustomButton extends StatelessWidget {
  // Constructor for the CustomButton class.
  // Accepts various optional parameters to customize the button's appearance and behavior.
  const CustomButton({
    super.key,
    required this.label, // The text to display on the button.
    this.buttonColor, // The background color of the button.
    this.borderColor, // The border color of the button.
    this.textColor = Colors.white, // The color of the text (default is white).
    this.prefixIcon, // Icon to display at the beginning of the button (optional).
    this.suffixIcon, // Icon to display at the end of the button (optional).
    this.onTap, // Callback function for button tap (optional).
    this.textSize, // The size of the text (optional).
    this.isDisabled = false, // Whether the button is disabled (default is false).
    this.isBorderedButton = false, // Whether the button has a border (default is false).
    this.onlyContent = false, // Whether to display only the content without a background (default is false).
    this.isLoading = false,
  });

  final String label;
  final Color? buttonColor;
  final Color? borderColor;
  final Color? textColor;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final bool isDisabled;
  final bool isBorderedButton;
  final bool isLoading;
  final bool onlyContent;
  final Function? onTap;
  final double? textSize;

  @override
  Widget build(BuildContext context) {
    // Determine button and text colors based on the button state.
    Color? resolvedButtonColor = buttonColor ?? Color(AppColors().primarySwatch.c500);
    Color? resolvedTextColor = textColor;

    if (isDisabled) {
      resolvedButtonColor = AppColors().white;
      resolvedTextColor = AppColors().white;
    }
    if (isBorderedButton) {
      resolvedButtonColor = AppColors().black;
      resolvedTextColor = AppColors().black;
    }
    if (isBorderedButton && isDisabled) {
      resolvedButtonColor = AppColors().cA3ADB8;
      resolvedTextColor = AppColors().cA3ADB8;
    }
    if (onlyContent && resolvedTextColor == Colors.white) {
      resolvedTextColor = Color(AppColors().primarySwatch.c500);
    }

    return Material(
      color: isBorderedButton || onlyContent
          ? Colors.transparent
          : isDisabled
          ? AppColors().cD3DAE0
          : resolvedButtonColor,
      borderRadius: BorderRadius.circular(AppSizes.radiusLg),
      child: InkWell(
        borderRadius: BorderRadius.circular(AppSizes.radiusLg),
        splashFactory: InkRipple.splashFactory,
        onTap: isDisabled
            ? null
            : () {
                if (onTap != null) {
                  onTap!();
                }
              },
        child: Container(
          height: 48,
          width: getWidth(context),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSizes.radiusLg),
            border: borderColor == null
                ? null
                : isBorderedButton || !onlyContent
                ? Border.all(width: 1, color: borderColor ?? AppColors().cDEE3E7)
                : null,
          ),
          alignment: Alignment.center,
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: isLoading
                ? CustomLoader()
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (prefixIcon != null) ...[HugeIcon(icon: prefixIcon!, color: resolvedTextColor!, size: 16), const Gap(4)],
                      Text(
                        label,
                        style: Theme.of(
                          context,
                        ).textTheme.bodyLarge?.copyWith(color: resolvedTextColor, fontWeight: FontWeight.w700, fontSize: onlyContent ? 14 : (textSize ?? 14)),
                      ),
                      if (suffixIcon != null) ...[const Gap(4), HugeIcon(icon: suffixIcon!, color: resolvedTextColor!, size: 18)],
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
