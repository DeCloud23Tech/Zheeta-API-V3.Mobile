import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zheeta/app/color.dart';

class InputField extends StatefulWidget {
  final TextEditingController? controller;
  final Function(String value)? onChanged;
  final String? Function(String?)? validator;
  final label;
  final password;
  const InputField({
    Key? key,
    this.controller,
    required this.label,
    this.password = false,
    this.onChanged,
    this.validator,
  }) : super(key: key);

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  var obscure = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: TextFormField(
        autocorrect: false,
        obscureText: widget.password ? obscure : false,
        style: const TextStyle(color: AppColors.black),
        controller: widget.controller,
        keyboardType: TextInputType.text,
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.white,
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.grey, width: 0.5),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.primaryDark, width: 1.0),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.red, width: 0.5),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.grey, width: 0.5),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.red, width: 1.0),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.grey, width: 0.5),
          ),
          hintText: widget.label,
          hintStyle: TextStyle(color: AppColors.grey.withOpacity(0.5), fontSize: 14),
          errorStyle: const TextStyle(color: Colors.red),
          suffixIcon: widget.password
              ? InkWell(
                  onTap: () => setState(() {
                    obscure = !obscure;
                  }),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: obscure ? SvgPicture.asset("assets/images/icons/eye_closed.svg") : SvgPicture.asset("assets/images/icons/eye.svg"),
                    ),
                  ),
                )
              : SizedBox(),
        ),
        validator: widget.validator,
      ),
    );
  }
}
