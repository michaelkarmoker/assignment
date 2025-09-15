import 'dart:async';

import 'package:flutter/material.dart';


import 'dart:async';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../styles/app_colors.dart';

class CustomSearchField extends StatefulWidget {
  final String? hintText;
  final Function(String text)? onSearchChanged;
  final Function()? onPressSuffix;
  final Duration debounceDuration;
  final TextEditingController? controller;

  const CustomSearchField({
    Key? key,
    this.hintText = 'Search...',
    this.onSearchChanged,
    this.onPressSuffix,
    this.debounceDuration = const Duration(milliseconds: 500),
    this.controller,
  }) : super(key: key);

  @override
  State<CustomSearchField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<CustomSearchField> {
  final FocusNode _focusNode = FocusNode();
  Timer? _debounce;

  @override
  void dispose() {
    _debounce?.cancel();
    _focusNode.dispose();
    super.dispose();
  }

  void _onChanged(String value) {
    _debounce?.cancel();
    _debounce = Timer(widget.debounceDuration, () {
      if (widget.onSearchChanged != null) {
        widget.onSearchChanged!(value);
      }
    });
  }

  void _onSuffixTap() {


      if (widget.onPressSuffix != null) {
        FocusManager.instance.primaryFocus?.unfocus();
        widget.controller!.clear();
        widget.onPressSuffix!();
      }

  }
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      focusNode: _focusNode,
      onChanged: _onChanged,
      style: Theme.of(context).textTheme.bodySmall?.copyWith(
        fontWeight: FontWeight.w400,
        fontSize: 14,
      ),
      decoration: InputDecoration(
        errorMaxLines: 2,
        isDense: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(
            width: 1,
            color: AppColors.border2,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(
            width: 1.5,
            color: AppColors.primary,
          ),
        ),
        hintText: widget.hintText,
        hintStyle: Theme.of(context)
            .textTheme
            .labelLarge
            ?.copyWith(color: AppColors.hintText),
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.symmetric(
          horizontal: 14.w,
          vertical: 14.w,
        ),
        suffixIcon: (widget.controller?.text??"").isNotEmpty?Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: InkWell(
              onTap: _onSuffixTap,
              child: Icon(Icons.close,color: AppColors.gray,)),
        ):null,

        prefixIcon: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Icon(Icons.search, color: AppColors.gray,size: 25.w,),
        ),
        prefixIconConstraints: BoxConstraints(
          minWidth: 0,
          minHeight: 0,
          maxWidth: 42.w,
          maxHeight: 42.h,
        ),
      ),
    );
  }
}

class Debouncer {
  final int milliseconds;
  Timer? _timer;

  Debouncer({required this.milliseconds});

  void run(VoidCallback action) {
    _timer?.cancel();
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}
