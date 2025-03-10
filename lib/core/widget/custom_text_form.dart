import 'package:flutter/material.dart';
import 'package:shop_sphere_dashboard/core/utils/app_color.dart';

class CustomTextForm extends StatelessWidget {
  const CustomTextForm({
    super.key,
    required this.pIcon,
    this.sIcon,
    required this.text,
    this.textController,
    this.obscureText = false,
    required this.kType,
    this.line = 1,
  });
  final IconData? pIcon;
  final Widget? sIcon;
  final String text;
  final TextEditingController? textController;
  final bool obscureText;
  final TextInputType kType;
  final int line;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: line,
      obscureText: obscureText,
      keyboardType: kType,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your $text';
        }
        return null;
      },
      controller: textController,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        errorBorder: border,
        focusedErrorBorder: border,
        disabledBorder: border,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.primaryColor),
        ),
        enabledBorder: border,
        prefixIcon: Icon(pIcon),
        suffixIcon: sIcon,
        hintText: text,
        
      
      ),
    );
  }
}

var border = OutlineInputBorder(
  borderRadius: BorderRadius.circular(10),
  borderSide: const BorderSide(color: Colors.grey),
);
