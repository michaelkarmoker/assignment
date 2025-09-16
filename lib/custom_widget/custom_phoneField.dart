import 'package:auto_size_text/auto_size_text.dart';
import 'package:canopas_country_picker/canopas_country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_intl_phone_field/flutter_intl_phone_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../styles/app_colors.dart';

class CustomPhoneField extends StatefulWidget {
  final String? hintText;
  final String? textHeading;
  final String? labelText;
  final TextEditingController? controller;
  final TextEditingController? phonCodeController;
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
  final double? bottomPadding;
  final bool showBorder;
  final double prefixHeight;
  final double? verticalPadding;
  final double regularBorderSize;
  final Color? fillColor;
  final Color? focusBorderColor;
  final Color? disableBorderColor;
  final Color? enabledBorderColor;
  final TextStyle? hintStyle;
  final bool required;
  final String? initialCountryCode;

  final Function()? onTap;
  final FormFieldValidator<String>? validator;

  const CustomPhoneField({
    super.key,
    this.initialCountryCode,
    this.hintText = ' ',
    this.controller,
    this.phonCodeController,
    this.focusNode,
    this.nextFocus,
    this.verticalPadding,
    this.validator,
    this.isEnabled = true,
    this.inputType = TextInputType.text,
    this.inputAction = TextInputAction.next,
    this.maxLines,
    this.bottomPadding,
    this.miniLine,
    this.onChanged,
    this.hintStyle,
    this.capitalization = TextCapitalization.none,
    this.isPassword = false,
    this.prefixIconVisible = false,
    this.isAmount = false,
    this.inputFormatters,
    this.borderRadius,
    this.showBorder = false,
    this.prefixHeight = 30,
    this.fillColor,
    this.focusBorderColor,
    this.required = false,
    this.textHeading,
    this.labelText,
    this.onTap,
    this.regularBorderSize = 1.0,
    this.disableBorderColor,
    this.enabledBorderColor,
  });

  @override
  State<CustomPhoneField> createState() => _CustomTextFormFiledState();
}

class _CustomTextFormFiledState extends State<CustomPhoneField> {
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
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 5.h),
        ],
        IntlPhoneField(

          initialCountryCode:widget.initialCountryCode??CountryCode.getCountryCodeByDialCode(
    dialCode:widget.phonCodeController?.text??""

    ).code,

          textAlignVertical: TextAlignVertical.top,
          textAlign: TextAlign.start,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onCountryChanged: (v){
            if(widget.phonCodeController!=null){
              widget.phonCodeController!.text="+"+v.fullCountryCode;
            }

          },
          onChanged: (v){
            if(widget.phonCodeController!=null){
              widget.phonCodeController!.text= v.countryCode;
            }
          },
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

          obscureText: widget.isPassword ? _obscureText : false,

          decoration: InputDecoration(
            errorMaxLines: 2,
            isDense: true,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius ?? 10.r),
              borderSide: BorderSide(
                width: 1,
                color: widget.enabledBorderColor ?? Colors.grey.shade400,
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
                color: widget.disableBorderColor ?? Colors.grey.shade200,
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


          ),



        ),
        SizedBox(height: widget.bottomPadding??10.h),
      ],
    );
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
}
