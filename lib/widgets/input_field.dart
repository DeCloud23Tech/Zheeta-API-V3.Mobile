import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zheeta/common/constants/color.dart';

class InputField extends StatefulWidget {
  final TextEditingController? controller;
  final Function(String value)? onChanged;
  final String? Function(String?)? validator;
  final String? hintText;
  final bool password;
  final int minLine;
  final int maxLine;
  final VoidCallback? onTap;
  final bool readonly;
  final String? initialValue;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;

  const InputField({
    super.key,
    this.controller,
    this.hintText,
    this.password = false,
    this.onChanged,
    this.validator,
    this.minLine = 1,
    this.maxLine = 1,
    this.onTap,
    this.readonly = false,
    this.initialValue,
    this.suffixIcon,
    this.keyboardType = TextInputType.text,
  });

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: TextFormField(
        initialValue: widget.initialValue,
        onTap: widget.onTap,
        autocorrect: false,
        obscureText: widget.password ? obscure : false,
        style: const TextStyle(color: AppColors.black),
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        onChanged: widget.onChanged,
        minLines: widget.minLine,
        maxLines: widget.maxLine,
        readOnly: widget.readonly,
        textCapitalization: TextCapitalization.sentences,
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
          hintText: widget.hintText,
          hintStyle:
              TextStyle(color: AppColors.grey.withOpacity(0.5), fontSize: 14),
          errorStyle: const TextStyle(color: Colors.red),
          suffixIcon: widget.suffixIcon ??
              (widget.password
                  ? InkWell(
                      onTap: () => setState(() {
                        obscure = !obscure;
                      }),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: obscure
                              ? SvgPicture.asset(
                                  "assets/images/icons/eye_closed.svg")
                              : SvgPicture.asset("assets/images/icons/eye.svg"),
                        ),
                      ),
                    )
                  : SizedBox()),
        ),
        validator: widget.validator,
      ),
    );
  }
}

class DropdownInputField extends StatefulWidget {
  final TextEditingController? controller;
  final void Function(String?)? onChanged;
  final String? Function(String?)? validator;
  final String? hintText;
  final bool password;
  final List<String> items;
  final String? value;
  final VoidCallback? onTap;

  const DropdownInputField({
    super.key,
    this.controller,
    this.hintText,
    this.password = false,
    this.onChanged,
    this.validator,
    required this.items,
    this.value,
    this.onTap,
  });

  @override
  State<DropdownInputField> createState() => _DropdownInputFieldState();
}

class _DropdownInputFieldState extends State<DropdownInputField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: DropdownButtonFormField<String>(
        dropdownColor: Theme.of(context).scaffoldBackgroundColor,
        icon: const Icon(Icons.arrow_drop_down, color: Colors.grey),
        hint: Text(
          widget.hintText!,
          style: TextStyle(
            color: AppColors.grey.withOpacity(0.5),
          ),
        ),
        style: TextStyle(
          color: AppColors.black,
          fontSize: 14,
        ),
        items: widget.items.map((e) {
          return DropdownMenuItem<String>(
            value: e,
            child: Text(e),
          );
        }).toList(),
        value: widget.value,
        validator: widget.validator,
        onChanged: (newValue) {
          setState(() {
            widget.onChanged?.call(newValue);
          });
        },
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
          errorStyle: const TextStyle(color: Colors.red),
        ),
      ),
    );
  }
}
