import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:zheeta/core/constants/color.dart';
import 'primary_button.dart';

class Modal extends StatelessWidget {
  final title;
  final content;
  final btn1Title;
  final btn2Title;
  final action;
  const Modal(
      {Key? key,
      this.title,
      this.content,
      this.btn1Title,
      this.btn2Title,
      this.action})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
          child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0)),
              padding: EdgeInsets.all(25),
              child: SingleChildScrollView(
                  child: Column(children: [
                if (title != null)
                  Text(title,
                      style: TextStyle(
                          decoration: TextDecoration.none,
                          fontFamily: 'Nunito',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: primaryDark)),
                SizedBox(height: title != null ? 30 : 10),
                Text(content,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        decoration: TextDecoration.none,
                        fontFamily: 'Nunito',
                        height: 1.5,
                        fontSize: 13,
                        fontWeight: FontWeight.normal,
                        color: grayscale)),
                SizedBox(height: 27),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.65,
                  child: btn2Title == null
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                                width: MediaQuery.of(context).size.width * 0.6,
                                child: PrimaryButton(
                                    title: btn1Title, action: action)),
                          ],
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () => Navigator.of(context).pop(),
                              child: Text(
                                  btn1Title != null ? btn1Title : "NO, CANCEL",
                                  style: TextStyle(
                                      decoration: TextDecoration.none,
                                      fontFamily: 'Nunito',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: grayscale)),
                            ),
                            GestureDetector(
                              onTap: action,
                              child: Text(btn2Title,
                                  style: TextStyle(
                                      decoration: TextDecoration.none,
                                      fontFamily: 'Nunito',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: primaryDark)),
                            )
                          ],
                        ),
                )
              ])))),
    );
  }
}
