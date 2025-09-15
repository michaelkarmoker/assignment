import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class CustomDateRangePickerField extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final String? textHeading;
  final bool required;
  final DateTimeRange? selectedRange;
  final Function(DateTimeRange)? onRangeSelected;
  final Color? enabledBorderColor;
  final Color? focusBorderColor;
  final double? borderRadius;

  const CustomDateRangePickerField({
    super.key,
    this.labelText,
    this.hintText,
    this.textHeading,
    this.required = false,
    this.selectedRange,
    this.onRangeSelected,
    this.enabledBorderColor,
    this.focusBorderColor,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    String displayText = '';
    if (selectedRange != null) {
      displayText =
      "${DateFormat('dd-MM-yyyy').format(selectedRange!.start)}  →  ${DateFormat('dd-MM-yyyy').format(selectedRange!.end)}";
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (textHeading != null) ...[
          Text(
            textHeading!,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 5.h),
        ],
        GestureDetector(
          onTap: () async {
            DateTimeRange? pickedRange = await showDateRangePicker(
              context: context,
              firstDate: DateTime(1950),
              lastDate: DateTime(2100),
              initialDateRange: selectedRange ??
                  DateTimeRange(
                    start: DateTime.now(),
                    end: DateTime.now().add(const Duration(days: 7)),
                  ),
              saveText: "Done",
            );

            if (pickedRange != null) {
              onRangeSelected?.call(pickedRange);
            }
          },
          child: AbsorbPointer(
            child: TextFormField(
              readOnly: true,
              controller: TextEditingController(text: displayText),
              decoration: InputDecoration(
                isDense: true,
                hintText: hintText ?? "Select date range",
                filled: true,
                fillColor: Colors.white,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 14.w,
                  vertical: 14.h,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(borderRadius ?? 10.r),
                  borderSide: BorderSide(
                    color: enabledBorderColor ?? Colors.grey.shade300,
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
                suffixIcon: Icon(Icons.date_range_outlined, size: 20.w),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
