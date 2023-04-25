import 'package:flutter/material.dart';
import 'package:health_tracking_app/core/constants/text_styles.dart';
import '../constants/color_constant.dart';

class AppTextField extends StatelessWidget {
  String hintText;
  Widget suffixIcon;
  Function()? onSuffix;
  String? Function(String?)? validator;
  bool obscureText;
  TextEditingController? textEditingController;
  TextInputType inputType;

  AppTextField({
    required this.hintText,
    this.suffixIcon = const SizedBox(),
    this.validator,
    this.onSuffix,
    required this.inputType,
    required this.obscureText,
    required this.textEditingController,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return TextFormField(
      obscureText: obscureText,
      style: TextStyle(color: AppColors.darkBlue),
      controller: textEditingController,
      validator: validator,
      keyboardType: inputType,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
            horizontal: size.width * 0.06, vertical: size.height * 0.02),
        labelText: hintText,
        labelStyle: AppTextStyles.text20(bold: false, size: size)
            .copyWith(color: AppColors.darkBlue),
        focusColor: AppColors.darkBlue,
        fillColor: AppColors.lightGrey,
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(size.width * 0.02),
          borderSide: BorderSide(
            color: AppColors.darkBlue,
            width: 2,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(size.width * 0.02),
          borderSide: BorderSide(
            color: AppColors.darkBlue,
            width: 1,
          ),
        ),
        suffixIcon: IconButton(
          onPressed: onSuffix,
          icon: suffixIcon,
        ),
        suffixIconColor: AppColors.darkBlue,
      ),
      cursorColor: AppColors.darkBlue,
    );
  }
}
