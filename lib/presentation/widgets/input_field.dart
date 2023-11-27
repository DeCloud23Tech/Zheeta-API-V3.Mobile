import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zheeta/core/constants/color.dart';

class InputField extends StatefulWidget {
  final controller;
  final label;
  final password;
  const InputField(
      {Key? key,
      required this.controller,
      required this.label,
      this.password = false})
      : super(key: key);

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
      child: SizedBox(
          height: 52,
          child: TextFormField(
              autocorrect: false,
              obscureText: widget.password ? obscure : false,
              style: const TextStyle(color: black),
              controller: widget.controller,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: white,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: grey, width: 0.5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: primaryDark, width: 1.0),
                  ),
                  hintText: widget.label,
                  hintStyle:
                      TextStyle(color: grey.withOpacity(0.5), fontSize: 14),
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
                              child: obscure
                                  ? SvgPicture.asset(
                                      "assets/images/icons/eye_closed.svg")
                                  : SvgPicture.asset(
                                      "assets/images/icons/eye.svg"),
                            ),
                          ),
                        )
                      : SizedBox()),
              validator: (value) {
                if (value == '') {
                  return '${widget.label} is a required field';
                }
                widget.controller.text = value ?? '';
                return null;
              })),
    );
  }
}
