import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../styles/app_colors.dart';

class CustomTextField extends StatefulWidget {
  final String? hintText;
  final String? textHeading;
  final String? labelText;
  final String? prefixImage;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final FocusNode? nextFocus;
  final TextInputType inputType;
  final TextInputAction inputAction;
  final bool isPassword;
  final bool prefixIconVisible;
  final bool isAmount;
  final List<TextInputFormatter>? inputFormatters;
  final Function(String text)? onChanged;
  final bool isEnabled;
  final int? maxLines;
  final int? miniLine;
  final TextCapitalization capitalization;
  final double? borderRadius;
  final Icon? prefixIcon;
  final String? suffixIcon;
  final bool showBorder;
  final String? countryDialCode;
  final double prefixHeight;
  final double? verticalPadding;
  final double regularBorderSize;
  final Color? fillColor;
  final Color? focusBorderColor;
  final Color? disableBorderColor;
  final Color? enabledBorderColor;
  final bool showCodePicker;
  final bool suffix;
  final TextStyle? hintStyle;
  final Function()? onPressedSuffix;
  final bool required;

  final Function()? onTap;
  final FormFieldValidator<String>? validator;

  const CustomTextField({
    super.key,
    this.hintText = ' ',
    this.controller,
    this.focusNode,
    this.prefixImage,
    this.nextFocus,
    this.verticalPadding,
    this.validator,
    this.isEnabled = true,
    this.inputType = TextInputType.text,
    this.inputAction = TextInputAction.next,
    this.maxLines,
    this.miniLine,
    this.onChanged,
    this.hintStyle,
    this.prefixIcon,
    this.capitalization = TextCapitalization.none,
    this.isPassword = false,
    this.prefixIconVisible = false,
    this.isAmount = false,
    this.inputFormatters,
    this.borderRadius,
    this.showBorder = false,
    this.prefixHeight = 30,
    this.countryDialCode,
    this.fillColor,
    this.focusBorderColor,
    this.suffix = true,
    this.suffixIcon,
    this.onPressedSuffix,
    this.required = false,
    this.textHeading,
    this.labelText,
    this.showCodePicker = false,
    this.onTap,
    this.regularBorderSize = 1.0,
    this.disableBorderColor,
    this.enabledBorderColor,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFormFiledState();
}

class _CustomTextFormFiledState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.textHeading != null) ...[
          AutoSizeText(
            widget.textHeading!,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 5.h),
        ],
        TextFormField(
          textAlignVertical: TextAlignVertical.top,
          textAlign: TextAlign.start,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: widget.validator,
          maxLines: widget.maxLines ?? 1,
          minLines: widget.miniLine ?? 1,
          controller: widget.controller,
          focusNode: widget.focusNode,
          enabled: widget.isEnabled,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            fontWeight: FontWeight.w400,
            fontSize: 14,
            color: widget.isEnabled ? Colors.black : Colors.grey, // disabled text
          ),
          textInputAction: widget.inputAction,
          keyboardType:
          (widget.isAmount || widget.inputType == TextInputType.phone)
              ? const TextInputType.numberWithOptions(
            signed: false,
            decimal: true,
          )
              : widget.inputType,
          textCapitalization: widget.capitalization,
          obscureText: widget.isPassword ? _obscureText : false,
          inputFormatters: widget.inputType == TextInputType.phone
              ? <TextInputFormatter>[
            FilteringTextInputFormatter.allow(RegExp(r'[0-9+]')),
          ]
              : widget.isAmount
              ? [FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'))]
              : widget.inputFormatters,
          decoration: InputDecoration(
            errorMaxLines: 2,
            isDense: true,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius ?? 10.r),
              borderSide: BorderSide(
                width: 1,
                color: widget.enabledBorderColor ?? AppColors.border2,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius ?? 10.r),
              borderSide: BorderSide(
                width: 1.5,
                color: widget.focusBorderColor ?? AppColors.primary,
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius ?? 10.r),
              borderSide: BorderSide(
                width: 1,
                color: widget.disableBorderColor ?? Colors.grey.shade400,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius ?? 10.r),
              borderSide: const BorderSide(width: 1.5, color: Colors.red),
            ),
            hintText: widget.hintText,
            fillColor: widget.isEnabled
                ? widget.fillColor ?? Colors.white
                : Colors.grey.shade300, // disabled background
            hintStyle: widget.hintStyle ??
                Theme.of(context)
                    .textTheme
                    .labelLarge
                    ?.copyWith(color: AppColors.hintText),
            filled: true,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 14.w,
              vertical: widget.verticalPadding ?? 14.w,
            ),
            labelStyle: widget.labelText != null
                ? Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: AppColors.hintText)
                : null,
            label: widget.labelText != null
                ? Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: widget.labelText ?? '',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 14,
                      color: AppColors.hintText,
                    ),
                  ),
                  if (widget.required && widget.labelText != null)
                    const TextSpan(
                      text: ' *',
                      style: TextStyle(color: Colors.red),
                    ),
                ],
              ),
            )
                : null,
            prefixIcon: widget.prefixIconVisible
                ? (widget.maxLines ?? 1) > 1
                ? null
                : Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: SizedBox(
                child: widget.prefixImage != null
                    ? SvgPicture.asset(
                  '${widget.prefixIcon}',
                  height: widget.prefixHeight,
                  color: AppColors.gray,
                )
                    : widget.prefixIcon,
              ),
            )
                : null,
            suffixIcon: widget.suffixIcon != null
                ? GestureDetector(
              onTap: widget.onPressedSuffix,
              child: Container(
                width: 40.w,
                padding: const EdgeInsets.all(1),
                child: Center(
                  child: SvgPicture.asset(
                    '${widget.suffixIcon}',
                    height: widget.prefixHeight,
                  ),
                ),
              ),
            )
                : widget.isPassword
                ? IconButton(
              icon: Icon(
                _obscureText
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
                color: const Color(0xff989394),
              ),
              onPressed: _toggle,
            )
                : null,
          ),
          onFieldSubmitted: (text) => widget.nextFocus != null
              ? FocusScope.of(context).requestFocus(widget.nextFocus)
              : null,
          onChanged: widget.onChanged,
          onTap: widget.onTap,
        ),
        SizedBox(height: 10.h),
      ],
    );
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
}
