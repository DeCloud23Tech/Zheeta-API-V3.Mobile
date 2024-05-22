
import 'package:flutter/material.dart';

class BasicProfileProp extends StatelessWidget {
  final String? leftTitle;
  final String? leftValue;
  final String? rightTitle;
  final String? rightValue;

  BasicProfileProp({
    super.key,
    this.leftTitle,
    this.leftValue,
    this.rightTitle,
    this.rightValue,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.4,
              child: Row(
                children: [
                  Text(
                    leftTitle != null ? '$leftTitle: ' : '',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    leftValue != null ? '$leftValue' : '',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff979797)),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Text(
                  rightTitle != null ? '$rightTitle: ' : '',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                ),
                Text(
                  rightValue != null ? '$rightValue' : '',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff979797)),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 15),
      ],
    );
  }
}
