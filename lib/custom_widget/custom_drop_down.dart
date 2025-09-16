import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDropdownField<T> extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final String? textHeading;
  final bool required;
  final FocusNode? focusNode;
  final FocusNode? nextFocus;
  final T? selectedValue;
  final List<T> items;
  final Function(T?)? onChanged;
  final Color? enabledBorderColor;
  final Color? focusBorderColor;
  final double? borderRadius;
  final FormFieldValidator<T>? validator;
  final String Function(T)? itemAsString;


  const CustomDropdownField({
    super.key,
    this.labelText,
    this.hintText,
    this.textHeading,
    this.focusNode,
    this.nextFocus,
    this.validator,
    this.required = false,
    this.selectedValue,
    required this.items,
    this.onChanged,
    this.enabledBorderColor,
    this.focusBorderColor,
    this.borderRadius,
    this.itemAsString,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (textHeading != null) ...[
          Text(
            textHeading!,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 5.h),
        ],
        DropdownButtonFormField<T>(
          isExpanded: true,
          value: items.contains(selectedValue) ? selectedValue : null,
          focusNode:focusNode ,
          validator:  validator ??
              (required
                  ? (value) =>
              value == null ? "Please select ${labelText??textHeading??""}" : null
                  : null),
          // selectedItemBuilder: (context){
          //   return items.map((e) => Text(
          //     itemAsString?.call(e) ?? e.toString(),
          //     maxLines: 2,
          //     overflow: TextOverflow.ellipsis,
          //     style: Theme.of(context).textTheme.bodyMedium,
          //   )).toList();
          // },
          items: items
              .map((e) => DropdownMenuItem<T>(
            value: e,
            child: Text(
              itemAsString?.call(e) ?? e.toString(),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ))
              .toList(),
          onChanged: (v){
            if(onChanged!=null){onChanged!(v) ;}
            if(nextFocus!=null){       FocusScope.of(  context ).requestFocus(nextFocus);}

          },
          decoration: InputDecoration(
            isDense: true,
            hintText: hintText ?? "Select option",
            filled: true,
            fillColor: Colors.white,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 14.w,
              vertical: 9.h,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 10.r),
              borderSide: BorderSide(
                color: enabledBorderColor ?? Colors.grey.shade400,
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 10.r),
              borderSide: BorderSide(
                color: focusBorderColor ?? Theme.of(context).primaryColor,
                width: 1.5,
              ),
            ),
            label: labelText != null
                ? RichText(
              text: TextSpan(
                text: labelText!,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: 14,
                  color: Colors.grey,
                ),
                children: required
                    ? [
                  const TextSpan(
                    text: ' *',
                    style: TextStyle(color: Colors.red),
                  )
                ]
                    : [],
              ),
            )
                : null,
          ),
          icon: Icon(Icons.arrow_drop_down, size: 24.w),
        ),
      ],
    );
  }
}
