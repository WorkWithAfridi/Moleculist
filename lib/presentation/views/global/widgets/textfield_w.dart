import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../common/resources/color/app_colors.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    super.key,
    this.label,
    this.hint,
    this.helper,
    this.isRequired,
    this.onTextChanged,
    this.validator,
    this.isEnabled = true,
    this.prefixIcon,
    this.prefixExtraWidgets,
    this.suffixIcon,
    this.suffixExtraWidgets,
    this.prefixIconOnTap,
    this.suffixIconOnTap,
    this.onSubmitted,
    this.isPassword = false,
    this.isPasswordVisible = false,
    required this.controller,
    this.textInputAction = TextInputAction.done,
  });

  String? label;
  String? hint;
  String? helper;
  bool? isRequired;
  bool isEnabled;
  TextEditingController? controller;
  Function? onTextChanged;
  Function? validator;
  Function? prefixIconOnTap;
  Function? suffixIconOnTap;
  IconData? prefixIcon;
  IconData? suffixIcon;
  bool? isPassword;
  bool? isPasswordVisible;
  TextInputAction? textInputAction;
  List<Widget>? suffixExtraWidgets;
  List<Widget>? prefixExtraWidgets;
  Function? onSubmitted;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        label != null
            ? Column(
                children: [
                  Row(
                    children: [
                      Text(label!, style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w400)),
                      isRequired == true
                          ? Text(
                              " *",
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.red, fontWeight: FontWeight.bold),
                            )
                          : const SizedBox.shrink(),
                      const Spacer(),
                    ],
                  ),
                  const Gap(6),
                ],
              )
            : const SizedBox.shrink(),
        Container(
          color: Colors.transparent,
          height: 64,
          child: TextFormField(
            enabled: isEnabled,
            textInputAction: textInputAction,
            cursorColor: AppColors().primary,
            onChanged: (value) {
              if (onTextChanged != null) {
                onTextChanged!(value);
              }
            },
            validator: (value) {
              if (validator != null) {
                return validator!(value);
              }
              return null;
            },
            onFieldSubmitted: (String value) {
              if (onSubmitted != null) {
                onSubmitted!();
              }
            },
            controller: controller,
            obscureText: isPasswordVisible ?? false,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontSize: 13.0,
                height: 1,
                fontWeight: FontWeight.w100,
                color: isEnabled ? AppColors().c58636E.withValues(alpha: .6) : AppColors().cCAD0D6,
              ),
              helper: helper != null
                  ? Transform.translate(
                      offset: const Offset(-8, 2),
                      child: Text(
                        helper!,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontSize: 12.0,
                          height: 1,
                          fontWeight: FontWeight.w100,
                          color: isEnabled ? AppColors().c58636E : AppColors().cCAD0D6,
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
              prefixIcon: prefixIcon == null && prefixExtraWidgets == null
                  ? null
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        prefixIcon != null ? const Gap(12) : const SizedBox.shrink(),
                        prefixExtraWidgets != null ? Row(children: [...prefixExtraWidgets ?? [], const Gap(8)]) : const SizedBox.shrink(),
                        prefixIcon != null
                            ? GestureDetector(
                                onTap: () {
                                  if (prefixIconOnTap != null) {
                                    suffixIconOnTap!();
                                  }
                                },
                                child: HugeIcon(icon: prefixIcon!, color: isEnabled ? AppColors().c58636E : AppColors().cD7DEE4, size: 20),
                              )
                            : const SizedBox.shrink(),
                      ],
                    ),
              suffixIcon: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  suffixExtraWidgets != null ? Row(children: [...suffixExtraWidgets ?? [], const Gap(8)]) : const SizedBox.shrink(),
                  suffixIcon != null
                      ? GestureDetector(
                          onTap: () {
                            if (suffixIconOnTap != null) {
                              suffixIconOnTap!();
                            }
                          },
                          child: HugeIcon(icon: suffixIcon!, color: isEnabled ? AppColors().c58636E : AppColors().cD7DEE4, size: 20),
                        )
                      : const SizedBox.shrink(),
                  suffixIcon != null ? const Gap(12) : const SizedBox.shrink(),
                ],
              ),
              fillColor: isEnabled ? Colors.transparent : AppColors().cF7F9FA,
              filled: true,
              contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
              errorStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 12.0, height: 1, color: AppColors().cDB0D0D),
              border: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                borderSide: BorderSide(
                  color: AppColors().cD8DFE4, // Set your preferred border color
                  width: 1,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                borderSide: BorderSide(color: AppColors().cD8DFE4, width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                borderSide: BorderSide(color: AppColors().primary, width: 2.0),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                borderSide: BorderSide(color: AppColors().cDB0D0D, width: 2.0),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                borderSide: BorderSide(color: AppColors().cD7DEE4, width: 1.5),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
