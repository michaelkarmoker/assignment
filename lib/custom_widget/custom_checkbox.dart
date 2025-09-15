
import 'package:flutter/material.dart';


class CustomCheckbox extends StatelessWidget {
  final bool isChecked;
  final Function(String) onClicked;
  final Function(bool?)? onChanged;
  final Color? checkColor ;
   CustomCheckbox({super.key,this.isChecked = false,
    required this.onChanged,  this.checkColor,
    required this.onClicked});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 16,
      width: 16,
      child: Transform.translate(
        offset:  Offset(-1, 0),
        child: Checkbox(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          side: MaterialStateBorderSide.resolveWith(
                (Set<MaterialState> states) {
              if (states.contains(MaterialState.selected)) {
                return BorderSide(color: checkColor??Colors.black);
              }
              return BorderSide(color: Colors.black);
            },
          ),
          checkColor: Colors.white,
          activeColor: checkColor??Theme.of(context).primaryColor,

          value: isChecked, onChanged: onChanged,
        ),
      ),
    );
  }
}