import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zheeta/app/color.dart';

class Messages extends StatefulWidget {
  const Messages({super.key});

  @override
  State<Messages> createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryLight,
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: Platform.isIOS ? 60.0 : 120.0),
        child: SizedBox(
          height: 65,
          width: 65,
          child: ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                  shadowColor: MaterialStateProperty.all<Color>(AppColors.black.withOpacity(0.7)),
                  elevation: MaterialStateProperty.all(10),
                  backgroundColor: MaterialStateProperty.all<Color>(AppColors.primaryDark),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ))),
              child: SvgPicture.asset('assets/images/icons/chat.svg')),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: SingleChildScrollView(
        child: Column(),
      ),
    );
  }
}
